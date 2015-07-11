#!/system/bin/sh

#Custom script for controling ramdisk values - duki994

BB=/sbin/busybox

# protect init from oom
echo "-1000" > /proc/1/oom_score_adj;

#Set permissions to /sbin /bin
$BB chown system /system;
$BB chmod -R 777 /system/bin;
$BB chmod -R 777 /sbin;