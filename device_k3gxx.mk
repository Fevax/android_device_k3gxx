DEVICE_PACKAGE_OVERLAYS += device/samsung/k3gxx/overlay

LOCAL_PATH := device/samsung/k3gxx


###########################################################
### AUDIO
###########################################################

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio/default_gain.conf:system/etc/default_gain.conf \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/tinyucm.conf:system/etc/tinyucm.conf

PRODUCT_PACKAGES += \
	libdashplayer \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.universal5422

###########################################################
### CAMERA
###########################################################

# Camera
PRODUCT_PACKAGES += \
    camera.universal5422

PRODUCT_PACKAGES += \
    Snap


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
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 560dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

PRODUCT_PACKAGES += \
    gralloc.exynos5

PRODUCT_PACKAGES += \
    libion \
    libfimg

PRODUCT_PACKAGES += \
    libstlport
    
# Hardware/Samsung/AdvancedDisplay (MDNIE)
PRODUCT_PACKAGES += \
    AdvancedDisplay    

###########################################################
### OMX/MEDIA
###########################################################

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml  \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml   
    
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
### Fingerprint
###########################################################

PRODUCT_PACKAGES += \
    fingerprintd \
    fingerprint.exynos5 \
    ValidityService	

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

PRODUCT_PACKAGES += \
    libxml2 \
    libprotobuf-cpp-full

PRODUCT_PACKAGES += \
	cbd \
    libsecril-client \
    libsecril-client-sap \
    modemloader
    
###########################################################
### WIFI
###########################################################

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    macloader \
    wifiloader \
    hostapd \
    libwpa_client \
    wpa_supplicant

# hardware/broadcom/wlan/bcmdhd/config/Android.mk
PRODUCT_PACKAGES += \
    dhcpcd.conf

# external/wpa_supplicant_8/wpa_supplicant/wpa_supplicant_conf.mk
PRODUCT_PACKAGES += \
    wpa_supplicant.conf

###########################################################
### NFC
###########################################################    
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-sec-hal.conf:system/etc/libnfc-sec-hal.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-sec.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/configs/nfc/nfcee_access.xml:system/etc/nfcee_access.xml

PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    Tag    

###########################################################
### CHARGER
###########################################################

PRODUCT_PACKAGES += \
    charger_res_images \
    cm_charger_res_images
    
# Default.prop overrides to get adb working at boot   
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
	ro.hardware=universal5422 \
	ro.zygote=zygote32 \
    persist.service.adb.enable=1 \
	persist.service.debuggable=1 \
    ro.debug_level=0x4948

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# Call Samsung LSI board support package
$(call inherit-product, hardware/samsung_slsi-cm/exynos5/exynos5.mk)
$(call inherit-product, hardware/samsung_slsi-cm/exynos5422/exynos5422.mk)

# Call vendor
$(call inherit-product-if-exists, vendor/samsung/k3gxx/k3gxx-vendor.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_k3gxx
PRODUCT_DEVICE := k3gxx
