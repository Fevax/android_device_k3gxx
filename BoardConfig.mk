LOCAL_PATH := device/samsung/k3gxx

# Platform
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := exynos5
TARGET_SLSI_VARIANT := cm
TARGET_SOC := exynos5422

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a15
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
# big.LITTLE load balancing
ENABLE_CPUSETS := true

#~ WITH_DEXPREOPT := true
TARGET_PROVIDES_INIT_RC := true

# Bootloader
TARGET_OTA_ASSERT_DEVICE := k3g,k3gxx
TARGET_BOOTLOADER_BOARD_NAME := universal5422
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/k3gxx/mkdtbhbootimg.mk
BOARD_CUSTOM_MKBOOTIMG := mkdtbhbootimg
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

# Partitions
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 13631488
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2621440000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12442369024
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_FLASH_BLOCK_SIZE := 131072

# PowerHAL
TARGET_POWERHAL_VARIANT := samsung

# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/recovery.fstab

# Camera
BOARD_USE_SAMSUNG_CAMERAFORMAT_NV21 := true

# Graphics
USE_OPENGL_RENDERER := true

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# frameworks/native/services/surfaceflinger
# Android keeps 2 surface buffers at all time in case the hwcomposer
# misses the time to swap buffers (in cases where it takes 16ms or
# less). Use 3 to avoid timing issues.
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Mixer
BOARD_USE_BGRA_8888 := true

# HWCServices
BOARD_USES_HWC_SERVICES := true

# Virtual Display
BOARD_USES_VIRTUAL_DISPLAY := true

# HDMI
TARGET_LINUX_KERNEL_VERSION := 3.10
BOARD_USES_GSC_VIDEO := true
BOARD_USES_CEC := true

# FIMG2D
BOARD_USES_SKIA_FIMGAPI := true

# (G)SCALER
BOARD_USES_SCALER := true
BOARD_USES_DT := true

# Samsung LSI OpenMAX
COMMON_GLOBAL_CFLAGS += -DUSE_NATIVE_SEC_NV12TILED

# Samsung OpenMAX Video
BOARD_USE_STOREMETADATA := true
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USE_DMA_BUF := true
BOARD_USE_ANB_OUTBUF_SHARE := true
BOARD_USE_IMPROVED_BUFFER := true
BOARD_USE_NON_CACHED_GRAPHICBUFFER := true
BOARD_USE_GSC_RGB_ENCODER := true
BOARD_USE_CSC_HW := false
BOARD_USE_QOS_CTRL := false
BOARD_USE_S3D_SUPPORT := true
BOARD_USE_VP8ENC_SUPPORT := true

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Hardware
BOARD_HARDWARE_CLASS += device/samsung/k3gxx/cmhw
BOARD_HARDWARE_CLASS += hardware/samsung/cmhw

# WIFI
BOARD_HAVE_SAMSUNG_WIFI          := true
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_NVRAM_PATH_PARAM     := "/sys/module/dhd/parameters/nvram_path"
WIFI_DRIVER_NVRAM_PATH           := "/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wifi/bcmdhd_apsta.bin"

# Webkit
ENABLE_WEBGL := true

# WFD
BOARD_USES_WFD := true

# HEALTH DAEMON (CHARGER) DEFINES
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
RED_LED_PATH := "/sys/devices/virtual/sec/led/led_r"
GREEN_LED_PATH := "/sys/devices/virtual/sec/led/led_g"
BLUE_LED_PATH := "/sys/devices/virtual/sec/led/led_b"
BACKLIGHT_PATH := "/sys/devices/14400000.fimd_fb/backlight/panel/brightness"
CHARGING_ENABLED_PATH := /sys/class/power_supply/battery/batt_lp_charging

# Radio
BOARD_PROVIDES_LIBRIL := true
BOARD_MODEM_TYPE := xmm6360
BOARD_MODEM_NEEDS_VIDEO_CALL_FIELD := true
TARGET_IGNORE_RO_BOOT_REVISION := true
# we need define it (because audio.primary.universal5422.so requires it)
COMMON_GLOBAL_CFLAGS += -DSEC_PRODUCT_FEATURE_RIL_CALL_DUALMODE_CDMAGSM
# RIL.java overwrite
BOARD_RIL_CLASS := ../../../$(LOCAL_PATH)/ril

# SELinux
BOARD_SEPOLICY_DIRS := \
    device/samsung/k3gxx/sepolicy
