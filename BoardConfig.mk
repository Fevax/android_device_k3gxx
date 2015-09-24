#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/samsung/k3gxx

# Platform
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := exynos5
TARGET_SLSI_VARIANT := insignal
TARGET_SOC := exynos5422

# Architecture
TARGET_BUILD_VARIANT := eng
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a15
ARCH_ARM_HAVE_TLS_REGISTER := true
WITH_DEXPREOPT := true
TARGET_PROVIDES_INIT_RC := true

# Bootloader
TARGET_OTA_ASSERT_DEVICE := k3g,k3gxx
TARGET_BOOTLOADER_BOARD_NAME := universal5422
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Bionic Tuning
ARCH_ARM_USE_MEMCPY_ALIGNMENT := true
BOARD_MEMCPY_ALIGNMENT := 64
BOARD_MEMCPY_ALIGN_BOUND := 32768

### LIBC
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Camera
USE_CAMERA_STUB := true
BOARD_USE_SAMSUNG_CAMERAFORMAT_NV21 := true
BOARD_NEEDS_MEMORYHEAPION := true
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
COMMON_GLOBAL_CFLAGS += -DSAMSUNG_CAMERA_HARDWARE

# HEALTH DAEMON (CHARGER) DEFINES
RED_LED_PATH := "/sys/devices/virtual/sec/led/led_r"
GREEN_LED_PATH := "/sys/devices/virtual/sec/led/led_g"
BLUE_LED_PATH := "/sys/devices/virtual/sec/led/led_b"
BACKLIGHT_PATH := "/sys/devices/14400000.fimd_fb/backlight/panel/brightness"
CHARGING_ENABLED_PATH := "/sys/class/power_supply/battery/batt_lp_charging"

# Kernel

#BOARD_CUSTOM_BOOTIMG_MK := device/samsung/k3gxx/mkdtbhbootimg.mk
#BOARD_CUSTOM_MKBOOTIMG := mkdtbhbootimg
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x11000000 --tags_offset 0x10000100
BOARD_MKBOOTIMG_ARGS += --dt_dir $(OUT)/obj/KERNEL_OBJ/arch/arm/boot/dts/
#BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x11000000 --dt device/samsung/k3gxx/recovery/dt.img --tags_offset 0x10000100
#BOARD_KERNEL_SEPARATED_DT := true
#TARGET_PREBUILT_KERNEL := device/samsung/k3gxx/recovery/zImage
TARGET_KERNEL_SOURCE := kernel/samsung/exynos5422
TARGET_KERNEL_CONFIG := exynos5422-k3g_00_defconfig
#BOARD_KERNEL_CMDLINE := console=ram vmalloc=256m androidboot.console=null user_debug=31
#BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive user_debug=31
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# Battery
BOARD_CHARGER_ENABLE_SUSPEND := true
# Charger/Healthd
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_BATTERY_DEVICE_NAME := battery

# FIMG2D
BOARD_USES_SKIA_FIMGAPI := true
BOARD_USES_NEON_BLITANTIH := true

# GSC
BOARD_USES_ONLY_GSC0_GSC1 := true

# Include path
TARGET_SPECIFIC_HEADER_PATH := device/samsung/k3gxx/include

# Partitions
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 13631488
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2621440000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12442369024
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_FLASH_BLOCK_SIZE := 131072

# PowerHAL
TARGET_POWERHAL_VARIANT := k3gxx

# Radio
#BOARD_PROVIDES_LIBRIL := true
BOARD_MODEM_TYPE := xmm6360
# we need define it (because audio.primary.universal5422.so requires it)
COMMON_GLOBAL_CFLAGS += -DSEC_PRODUCT_FEATURE_RIL_CALL_DUALMODE_CDMAGSM
BOARD_RIL_CLASS := ../../../device/samsung/k3gxx/ril

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_RECOVERY_SWIPE := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
#BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/k3gxx/recovery/recovery_keys.c
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_RECOVERY_FSTAB := device/samsung/k3gxx/rootdir/etc/recovery.fstab

# SELinux
#BOARD_SEPOLICY_DIRS += \
#    device/samsung/k3gxx/sepolicy

#BOARD_SEPOLICY_UNION += \
#    file_contexts \
#    service_contexts \
#    device.te \
#    domain.te \
#    drmserver.te \
#    file.te \
#    gpsd.te \
#    macloader.te \
#    mediaserver.te \
#    rild.te \
#    servicemanager.te \
#    system_app.te \
#    system_server.te \
#    vold.te \
#    wpa.te

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/samsung/k3gxx/configs/egl/egl.cfg
DEFAULT_FB_NUM := 0
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 5
ENABLE_WEBGL := true

# Disable HDMI for now
BOARD_HDMI_INCAPABLE := true

# HWCServices
#BOARD_USES_HWC_SERVICES := true

# OpenMAX Video
BOARD_USE_STOREMETADATA := true
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USE_S3D_SUPPORT := true
BOARD_USE_DMA_BUF := true
BOARD_USE_ANB_OUTBUF_SHARE := true
BOARD_USE_GSC_RGB_ENCODER := true
BOARD_USE_IMPROVED_BUFFER := true
BOARD_USE_CSC_HW := false
BOARD_USE_H264_PREPEND_SPS_PPS := false
BOARD_USE_QOS_CTRL := false
BOARD_USE_VP8ENC_SUPPORT := true
BOARD_USE_ENCODER_RGBINPUT_SUPPORT := true
BOARD_USE_DUALDPB_MODE := true

# Scaler
BOARD_USES_SCALER := true

# Samsung Gralloc agregado
#TARGET_SAMSUNG_GRALLOC_EXTERNAL_USECASES := true

# WFD
BOARD_USES_WFD_SERVICE := false
BOARD_USES_WFD := false

# Wifi Macloader
BOARD_HAVE_SAMSUNG_WIFI := true

# WIFI
#BOARD_NO_WIFI_HAL := true
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_NVRAM_PATH_PARAM     := "/sys/module/dhd/parameters/nvram_path"
WIFI_DRIVER_NVRAM_PATH           := "/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wifi/bcmdhd_apsta.bin"

# CMHW
BOARD_HARDWARE_CLASS += hardware/samsung/cmhw

#Trying to get work the WIFI
-include hardware/broadcom/wlan/bcmdhd/firmware/bcm4354/device-bcm.mk
# inherit from the proprietary version
-include vendor/samsung/k3gxx/BoardConfigVendor.mk
