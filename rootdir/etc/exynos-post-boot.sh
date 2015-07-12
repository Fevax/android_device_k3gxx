#!/system/bin/sh

#Custom script for controling ramdisk values - duki994

BB=/sbin/busybox

# protect init from oom
echo "-1000" > /proc/1/oom_score_adj;

#Set permissions to /sbin /bin
PERMISSIONS_FIX()
{
	# Permissions fix
	$BB chown -R root:root /tmp;
	$BB chown -R root:root /res;
	$BB chown -R root:root /sbin;
	$BB chown -R root:root /lib;
	$BB chmod -R 777 /tmp/;
	$BB chmod -R 775 /res/;
	$BB chmod -R 06755 /sbin/ext/;
	$BB chmod 06755 /sbin/busybox;
	$BB chmod 06755 /system/xbin/busybox;

	# These are redundant, but I add them in any case
	$BB chown system /system;
	$BB chmod -R 777 /system/bin;
	$BB chmod -R 777 /sbin;
	$BB chmod -R 777 /system/xbin;
}
PERMISSIONS_FIX;

#sysfs nodes permissions
$BB chown system /sys/devices/system/cpu/cpu*;
$BB chown system /sys/devices/system/cpu/cpufreq/interactive/*
$BB chown system /sys/devices/system/cpu/cpu0/cpufreq/*
$BB chown system /sys/devices/system/cpu/cpu1/online
$BB chown system /sys/devices/system/cpu/cpu2/online
$BB chown system /sys/devices/system/cpu/cpu3/online
$BB chown system /sys/devices/system/cpu/cpu4/online
$BB chmod 666 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
$BB chmod 666 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
$BB chmod 666 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
$BB chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq
$BB chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/stats/*
$BB chmod 666 /sys/devices/system/cpu/cpufreq/all_cpus/*
$BB chmod 666 /sys/devices/system/cpu/cpu1/online
$BB chmod 666 /sys/devices/system/cpu/cpu2/online
$BB chmod 666 /sys/devices/system/cpu/cpu3/online
$BB chmod 666 /sys/devices/system/cpu/cpu4/online
exit