$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)
 
$(call inherit-product-if-exists, vendor/samsung/k3gxx/k3gxx-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/k3gxx/overlay

LOCAL_PATH := device/samsung/k3gxx


###########################################################
### AUDIO
###########################################################

#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
#    $(LOCAL_PATH)/configs/audio/audio_effects.conf:system/etc/audio_effects.conf \
#    $(LOCAL_PATH)/configs/audio/default_gain.conf:system/etc/default_gain.conf \
#    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
#    $(LOCAL_PATH)/configs/audio/tinyucm.conf:system/etc/tinyucm.conf

PRODUCT_PACKAGES += \
#	libdashplayer \
#    audio.a2dp.default \
#    audio.usb.default \
    audio.r_submix.default \
#    audio.primary.universal5422

#PRODUCT_PROPERTY_OVERRIDES += \
#    af.fast_track_multiplier=1 \
#    audio_hal.force_wideband=true

  
###########################################################
### CAMERA
###########################################################

PRODUCT_PACKAGES += \
	libhwjpeg \
    camera.universal5422

PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1


###########################################################
### FILESYSTEM MANAGEMENT
###########################################################

PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/gps.xml:system/etc/gps.xml \

###########################################################
### GRAPHICS
###########################################################

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608

PRODUCT_PACKAGES += \
    libion_exynos \
    hwcomposer.exynos5 \
    gralloc.exynos5

###########################################################
### OMX/MEDIA
###########################################################

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_ffmpeg.xml:system/etc/media_codecs_ffmpeg.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml  \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml
    
# Audio codecs
PRODUCT_PACKAGES += \
    libOMX.Exynos.AAC.Decoder \
    libOMX.Exynos.FLAC.Decoder \
    libOMX.Exynos.MP3.Decoder \
    libOMX.Exynos.WMA.Encoder

# Seiren hardware audio decoder
#PRODUCT_PACKAGES += \
#    libseirenhw

# Stagefright and device specific modules
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libExynosOMX_Core

# Video codecs
PRODUCT_PACKAGES += \
    libOMX.Exynos.AVC.Decoder \
    libOMX.Exynos.HEVC.Decoder \
    libOMX.Exynos.MPEG4.Decoder \
    libOMX.Exynos.MPEG4.Encoder \
    libOMX.Exynos.VP8.Decoder \
    libOMX.Exynos.WMV.Decoder

# H.264 encoder is broken
#PRODUCT_PACKAGES += \
#    libOMX.Exynos.AVC.Encoder


# Some Exynos HW codecs require AwesomePlayer
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.media.use-awesome=true    
    
###########################################################

# IR
PRODUCT_PACKAGES += \
    consumerir.universal5422

# Keylayouts
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/keylayout/gpio_keys_8.kl:system/usr/keylayout/gpio_keys_8.kl \
	$(LOCAL_PATH)/configs/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    
###########################################################
### KEY MANAGEMENT
###########################################################

PRODUCT_PACKAGES += \
    keystore.exynos5

###########################################################
### LIGHTS
###########################################################

PRODUCT_PACKAGES += \
    lights.universal5422

###########################################################
### PACKAGES
###########################################################

PRODUCT_PACKAGES += \
    SamsungServiceMode \
    Torch
    
###########################################################
### MTP
###########################################################

PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

###########################################################
### MOBICORE
###########################################################

PRODUCT_PACKAGES += \
    libMcClient \
    libMcRegistry \
    libPaApi \
    libgdmcprov \
    mcDriverDaemon

###########################################################
### EXYNOS 5 OMX
###########################################################

PRODUCT_PACKAGES += \
    libcsc \
    libExynosOMX_Core \
    libOMX.Exynos.MP3.Decoder \
    libstagefrighthw \	

###########################################################
### PERMISSONS
###########################################################

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

###########################################################
### POWER
###########################################################
PRODUCT_PACKAGES += \
    power.universal5422

###########################################################
### RAMDISK
###########################################################
PRODUCT_PACKAGES += \
fstab.universal5422 \
init.recovery.universal5422.rc \
init.samsung.rc \
init.universal5422.rc \
init.universal5422.usb.rc \
init.universal5422.wifi.rc \
lpm.rc \
ueventd.universal5422.rc \
init.rc \
recovery.fstab \
adb_keys \
init.sec.boot.sh \
init.exynos.cam.sh

###########################################################
### RADIO
###########################################################

# cpboot-daemon for modem
#PRODUCT_COPY_FILES += \
#   $(LOCAL_PATH)/ril/sbin/cbd:root/sbin/cbd
PRODUCT_PACKAGES += \
    cbd \

###########################################################
### WIFI
###########################################################

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/olsrd.conf:system/etc/wifi/olsrd.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

PRODUCT_PACKAGES += \
	libwifi-hal-bcm \
    libnetcmdiface \
    macloader \
    libwpa_client \
    lib_driver_cmd_bcmdhd \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    bcmdhd.cal \
    bcmdhd_sr2.cal


###########################################################
### CHARGER
###########################################################

PRODUCT_PACKAGES += \
    charger_res_images \
    charger
    

# Default.prop overrides to get adb working at boot   
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
	ro.hardware=universal5422 \
	ro.zygote=zygote32 \
    persist.service.adb.enable=1 \
	persist.service.debuggable=1 \
#	persist.sys.usb.config=mtp \

$(call inherit-product-if-exists, hardware/samsung_slsi/exynos5-insignal/exynos5.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)
$(call inherit-product-if-exists, build/target/product/full.mk)


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_k3gxx
PRODUCT_DEVICE := k3gxx
