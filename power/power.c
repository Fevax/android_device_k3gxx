/*
 * Copyright (C) 2014, The CyanogenMod Project <http://www.cyanogenmod.org>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdbool.h>

#define LOG_TAG "Universal5422 PowerHAL"
#include <utils/Log.h>

#include <hardware/hardware.h>
#include <hardware/power.h>

#define TSP_POWER "/sys/class/input/input1/enabled"
#define TOUCHKEY_POWER "/sys/class/input/input18/enabled"
#define SPEN_POWER "/sys/class/input/input19/enabled"
#define GPIO_POWER "/sys/class/input/input17/enabled"

#define BOOST_PULSE_PATH "/sys/devices/system/cpu/cpufreq/interactive/boostpulse"
#define BOOST_PATH "/sys/devices/system/cpu/cpufreq/interactive/boost"
#define BOOST_PULSE_DURATION 1000000
#define NSEC_PER_SEC 1000000000
#define USEC_PER_SEC 1000000
#define NSEC_PER_USEC 100

#define TOSTR(expr) #expr

struct universal5422_power_module {
    struct power_module base;
    pthread_mutex_t lock;
    int boostpulse_fd;
    int boostpulse_warned;
};

static unsigned int vsync_count;
static struct timespec last_touch_boost;
static bool touch_boost;

static void sysfs_write(char *path, char *s) {
    char buf[80];
    int len;
    int fd = open(path, O_WRONLY);

    if (fd < 0) {
        strerror_r(errno, buf, sizeof(buf));
        ALOGE("Error opening %s: %s\n", path, buf);
        return;
    }

    len = write(fd, s, strlen(s));
    if (len < 0) {
        strerror_r(errno, buf, sizeof(buf));
        ALOGE("Error writing to %s: %s\n", path, buf);
    }

    close(fd);
}

static void power_init(__attribute__((unused)) struct power_module *module)
{
    sysfs_write("/sys/devices/system/cpu/cpufreq/interactive/timer_rate", "20000");
	sysfs_write("/sys/devices/system/cpu/cpufreq/interactive/timer_slack", "20000");
	sysfs_write("/sys/devices/system/cpu/cpufreq/interactive/min_sample_time", "40000");
	sysfs_write("/sys/devices/system/cpu/cpufreq/interactive/hispeed_freq", "600000");
	sysfs_write("/sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load", "99");
	sysfs_write("/sys/devices/system/cpu/cpufreq/interactive/target_loads", "70 600000:70 800000:75 1500000:80 1700000:90");
	sysfs_write("/sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay", "20000 1000000:80000 1200000:100000 1700000:20000");
	sysfs_write("/sys/devices/system/cpu/cpufreq/interactive/boostpulse_duration", TOSTR(BOOST_PULSE_DURATION));
    sysfs_write("/sys/devices/system/cpu/cpufreq/interactive/io_is_busy", "1");
}

static void power_set_interactive(__attribute__((unused)) struct power_module *module, int on)
{
    sysfs_write(TSP_POWER, on ? "1" : "0");
    sysfs_write(SPEN_POWER, on ? "1" : "0");
    sysfs_write(GPIO_POWER, on ? "1" : "0");
    sysfs_write(TOUCHKEY_POWER, on ? "1" : "0");
}

static int boostpulse_open(struct universal5422_power_module *universal5422)
{
    char buf[80];

    pthread_mutex_lock(&universal5422->lock);

    if (universal5422->boostpulse_fd < 0) {
        universal5422->boostpulse_fd = open(BOOST_PULSE_PATH, O_WRONLY);

        if (universal5422->boostpulse_fd < 0) {
            if (!universal5422->boostpulse_warned) {
                strerror_r(errno, buf, sizeof(buf));
                ALOGE("Error opening %s: %s\n", BOOST_PULSE_PATH, buf);
                universal5422->boostpulse_warned = 1;
            }
        }
    }

    pthread_mutex_unlock(&universal5422->lock);
    return universal5422->boostpulse_fd;
}

static struct timespec timespec_diff(const struct timespec *lhs, const struct timespec *rhs)
{
    struct timespec result;
    if (rhs->tv_nsec > lhs->tv_nsec) {
        result.tv_sec = lhs->tv_sec - rhs->tv_sec - 1;
        result.tv_nsec = NSEC_PER_SEC + lhs->tv_nsec - rhs->tv_nsec;
    } else {
        result.tv_sec = lhs->tv_sec - rhs->tv_sec;
        result.tv_nsec = lhs->tv_nsec - rhs->tv_nsec;
    }
    return result;
}

static int check_boostpulse_on(const struct timespec *diff)
{
    long boost_ns = (BOOST_PULSE_DURATION * NSEC_PER_USEC) % NSEC_PER_SEC;
    long boost_s = BOOST_PULSE_DURATION / USEC_PER_SEC;

    if (diff->tv_sec == boost_s)
        return (diff->tv_nsec < boost_ns);
    return (diff->tv_sec < boost_s);
}


static void universal5422_power_hint(struct power_module *module, power_hint_t hint,
                       void *data) {
    struct universal5422_power_module *universal5422 = (struct universal5422_power_module *) module;
    struct timespec now, diff;
    char buf[80];
    int len;
    switch (hint) {
    case POWER_HINT_INTERACTION:
        if (boostpulse_open(universal5422) >= 0) {
            pthread_mutex_lock(&universal5422->lock);
            len = write(universal5422->boostpulse_fd, "1", 1);

            if (len < 0) {
                strerror_r(errno, buf, sizeof(buf));
                ALOGE("Error writing to %s: %s\n", BOOST_PULSE_PATH, buf);
            } else {
                clock_gettime(CLOCK_MONOTONIC, &last_touch_boost);
                touch_boost = true;
            }
            pthread_mutex_unlock(&universal5422->lock);
        }

        break;

    case POWER_HINT_VSYNC:
        pthread_mutex_lock(&universal5422->lock);
        if (data) {
            if (vsync_count < UINT_MAX)
                vsync_count++;
        } else {
            if (vsync_count)
                vsync_count--;
            if (vsync_count == 0 && touch_boost) {
                touch_boost = false;
                clock_gettime(CLOCK_MONOTONIC, &now);
                diff = timespec_diff(&now, &last_touch_boost);
                if (check_boostpulse_on(&diff)) {
                    sysfs_write(BOOST_PATH, "0");
                }
            }
        }
        pthread_mutex_unlock(&universal5422->lock);
        break;

    default:
        break;
    }
}

static struct hw_module_methods_t power_module_methods = {
    .open = NULL,
};

struct universal5422_power_module HAL_MODULE_INFO_SYM = {
    .base = {
        .common = {
            .tag = HARDWARE_MODULE_TAG,
            .module_api_version = POWER_MODULE_API_VERSION_0_2,
            .hal_api_version = HARDWARE_HAL_API_VERSION,
            .id = POWER_HARDWARE_MODULE_ID,
            .name = "Universal5422 Power HAL",
            .author = "The CyanogenMod Project",
            .methods = &power_module_methods,
        },

        .init = power_init,
        .setInteractive = power_set_interactive,
        .powerHint = universal5422_power_hint,
    },

    .lock = PTHREAD_MUTEX_INITIALIZER,
    .boostpulse_fd = -1,
    .boostpulse_warned = 0,
};
