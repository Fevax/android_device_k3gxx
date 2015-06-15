/*
 * Copyright (C) 2014 The Android Open Source Project
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
#define LOG_TAG "ConsumerIrHal"

#include <stdlib.h>
#include <malloc.h>
#include <stdbool.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <pthread.h>
#include <sched.h>
#include <cutils/log.h>
#include <hardware/hardware.h>
#include <hardware/consumerir.h>

#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))

static const consumerir_freq_range_t consumerir_freqs[] = {
    {.min = 16000, .max = 60000},
};

#define TMP_BUF_SIZE 80
#define BUF_SIZE 4096

static int consumerir_transmit_impl(int carrier_freq, int pattern[], int pattern_len)
{
    char buf[BUF_SIZE];
    char tmp[TMP_BUF_SIZE];
    size_t buf_size = 0;
    size_t tmp_size = 0;
    int result = 0;
    const char* delimiter;

    memset(buf, 0, BUF_SIZE);

    snprintf(buf, BUF_SIZE, "%d,", carrier_freq);
    buf_size = strlen(buf);
    int i;
    for (i = 0; i < pattern_len; ++i) {
        delimiter = (i == pattern_len - 1) ? "" : ",";
        snprintf(tmp, 80, "%d%s", pattern[i], delimiter);
        tmp_size = strlen(tmp);
        if (buf_size + tmp_size > BUF_SIZE) {
            ALOGE("Error: too long pattern: %d, %zu symbols already", pattern_len, buf_size + tmp_size);
            return -7;
        }
        strncat(buf, tmp, BUF_SIZE - buf_size);
        buf_size += tmp_size;
    }

    int tries = 10;
    int fd = 0;
    while (tries-- > 0) {
        fd = open("/sys/class/sec/sec_ir/ir_send", O_RDWR);
        int lasterr = errno;
        if (fd >= 0)
            break;
        if (lasterr != 4) {
            // may be need some timing
            ALOGE("Failed to open device. %d - %s", lasterr, strerror(lasterr));
            return -lasterr;
        }
        sched_yield();
    }

    if (write(fd, buf, buf_size) >= 0) {
        result = 0;
    } else { 
        result = errno;
        ALOGE("Failed to write. %d - %s", result, strerror(result));
        result = -result;
    }
    close(fd);
    return result;
}

pthread_mutex_t g_mtx;

static int consumerir_transmit(struct consumerir_device *dev,
   int carrier_freq, int pattern[], int pattern_len)
{
    pthread_mutex_lock(&g_mtx);
    int res = consumerir_transmit_impl(carrier_freq, pattern, pattern_len);
    if (res < 0) {
        ALOGE("Consumer IR transmit failed. Error: %d", res);
    }
    pthread_mutex_unlock(&g_mtx);
    return res;
}

static int consumerir_get_num_carrier_freqs(struct consumerir_device *dev)
{
    return ARRAY_SIZE(consumerir_freqs);
}

static int consumerir_get_carrier_freqs(struct consumerir_device *dev,
    size_t len, consumerir_freq_range_t *ranges)
{
    size_t to_copy = ARRAY_SIZE(consumerir_freqs);

    to_copy = len < to_copy ? len : to_copy;
    memcpy(ranges, consumerir_freqs, to_copy * sizeof(consumerir_freq_range_t));
    return to_copy;
}

static int consumerir_close(hw_device_t *dev)
{
    free(dev);
    pthread_mutex_destroy(&g_mtx);
    return 0;
}

/*
 * Generic device handling
 */
static int consumerir_open(const hw_module_t* module, const char* name,
        hw_device_t** device)
{
    pthread_mutex_init(&g_mtx, NULL);

    if (strcmp(name, CONSUMERIR_TRANSMITTER) != 0) {
        return -EINVAL;
    }
    if (device == NULL) {
        ALOGE("NULL device on open");
        return -EINVAL;
    }

    consumerir_device_t *dev = malloc(sizeof(consumerir_device_t));
    memset(dev, 0, sizeof(consumerir_device_t));

    dev->common.tag = HARDWARE_DEVICE_TAG;
    dev->common.version = 0;
    dev->common.module = (struct hw_module_t*) module;
    dev->common.close = consumerir_close;

    dev->transmit = consumerir_transmit;
    dev->get_num_carrier_freqs = consumerir_get_num_carrier_freqs;
    dev->get_carrier_freqs = consumerir_get_carrier_freqs;

    *device = (hw_device_t*) dev;
    return 0;
}

static struct hw_module_methods_t consumerir_module_methods = {
    .open = consumerir_open,
};

consumerir_module_t HAL_MODULE_INFO_SYM = {
    .common = {
        .tag                = HARDWARE_MODULE_TAG,
        .module_api_version = CONSUMERIR_MODULE_API_VERSION_1_0,
        .hal_api_version    = HARDWARE_HAL_API_VERSION,
        .id                 = CONSUMERIR_HARDWARE_MODULE_ID,
        .name               = "Consumer IR Module",
        .author             = "The CyanogenMod Project",
        .methods            = &consumerir_module_methods,
    },
};
