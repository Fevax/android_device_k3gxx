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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
# $(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
PRODUCT_PACKAGES += \
	audio.primary.universal5422 \
	audio.primary.default\
	audio_policy.default \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    libtinyxml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/configs/firmware/florida-dsp1-edac.bin:system/etc/firmware/florida-dsp1-edac.bin \
    $(LOCAL_PATH)/configs/firmware/florida-dsp1-edac.wmfw:system/etc/firmware/florida-dsp1-edac.wmfw \
    $(LOCAL_PATH)/configs/firmware/florida-dsp2-tx-nb.wmfw:system/etc/firmware/florida-dsp2-tx-nb.wmfw \
    $(LOCAL_PATH)/configs/firmware/florida-dsp2-tx-swb.wmfw:system/etc/firmware/florida-dsp2-tx-swb.wmfw \
    $(LOCAL_PATH)/configs/firmware/florida-dsp2-tx-wb.wmfw:system/etc/firmware/florida-dsp2-tx-wb.wmfw \
    $(LOCAL_PATH)/configs/firmware/florida-dsp3-ez2-control.wmfw:system/etc/firmware/florida-dsp3-ez2-control.wmfw \
    $(LOCAL_PATH)/configs/firmware/florida-dsp3-lpsd-control.bin:system/etc/firmware/florida-dsp3-lpsd-control.bin \
    $(LOCAL_PATH)/configs/firmware/florida-dsp3-tx-nb.bin:system/etc/firmware/florida-dsp3-tx-nb.bin \
    $(LOCAL_PATH)/configs/firmware/florida-dsp3-tx-nb.wmfw:system/etc/firmware/florida-dsp3-tx-nb.wmfw \
    $(LOCAL_PATH)/configs/firmware/florida-dsp3-tx-swb.wmfw:system/etc/firmware/florida-dsp3-tx-swb.wmfw \
    $(LOCAL_PATH)/configs/firmware/florida-dsp3-tx-swb-conversation.bin:system/etc/firmware/florida-dsp3-tx-swb-conversation.bin \
    $(LOCAL_PATH)/configs/firmware/florida-dsp3-tx-swb-interview.bin:system/etc/firmware/florida-dsp3-tx-swb-interview.bin \
    $(LOCAL_PATH)/configs/firmware/florida-dsp3-tx-wb.bin:system/etc/firmware/florida-dsp3-tx-wb.bin \
    $(LOCAL_PATH)/configs/firmware/florida-dsp3-tx-wb.wmfw:system/etc/firmware/florida-dsp3-tx-wb.wmfw \
    $(LOCAL_PATH)/configs/firmware/florida-dsp4-rx-anc-nb.bin:system/etc/firmware/florida-dsp4-rx-anc-nb.bin \
    $(LOCAL_PATH)/configs/firmware/florida-dsp4-rx-anc-nb.wmfw:system/etc/firmware/florida-dsp4-rx-anc-nb.wmfw \
    $(LOCAL_PATH)/configs/firmware/florida-dsp4-rx-anc-wb.bin:system/etc/firmware/florida-dsp4-rx-anc-wb.bin \
    $(LOCAL_PATH)/configs/firmware/florida-dsp4-rx-anc-wb.wmfw:system/etc/firmware/florida-dsp4-rx-anc-wb.wmfw \
	
    
# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Camera
PRODUCT_PACKAGES += \
    libhwjpeg \
    libexynoscamera \
    camera.universal5422

# AGREGADO MIO
#PRODUCT_PACKAGES += \
#	libion_exynos   \
#	libExynosHWCService

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.cer:system/etc/gps.cer \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps.xml:system/etc/gps.xml

# HW composer
PRODUCT_PACKAGES += \
	libion \
	hwcomposer.exynos5 \
	gralloc.exynos5

# IR
PRODUCT_PACKAGES += \
    consumerir.universal5422

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/Button_Jack.kl:system/usr/keylayout/Button_Jack.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/philips_remote_ir.kl:system/usr/keylayout/philips_remote_ir.kl \
    $(LOCAL_PATH)/keylayout/samsung_remote_ir.kl:system/usr/keylayout/samsung_remote_ir.kl \
    $(LOCAL_PATH)/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    $(LOCAL_PATH)/keylayout/ue_rf4ce_remote.kl:system/usr/keylayout/ue_rf4ce_remote.kl

# Keymaster
ifeq ($(BOARD_USES_TRUST_KEYMASTER), true)
PRODUCT_PACKAGES += \
	keystore.exynos5
endif

# Lights
PRODUCT_PACKAGES += \
    lights.universal5422

# NFCEE access control + configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/nfc/nfcee_access.xml:system/etc/nfcee_access.xml \
    $(LOCAL_PATH)/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
#    $(LOCAL_PATH)/nfc/libnfc-brcm-20791b04.conf:system/etc/libnfc-brcm-20791b04.conf \
#    $(LOCAL_PATH)/nfc/libnfc-brcm-20791b05.conf:system/etc/libnfc-brcm-20791b05.conf

# Media profile
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_ffmpeg.xml:system/etc/media_codecs_ffmpeg.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml  \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Misc
#PRODUCT_PACKAGES += \
#    com.android.future.usb.accessory

# MobiCore
PRODUCT_PACKAGES += \
#    libMcClient \
#    libMcRegistry \
#    libgdmcprov \
    mcDriverDaemon

# Network tools
PRODUCT_PACKAGES += \
    libpcap \
    tcpdump

# stagefright and device specific modules
PRODUCT_PACKAGES += \
    libcsc \
    libExynosOMX_Core \
    libOMX.Exynos.MP3.Decoder \
    libstagefrighthw \	

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# CPU producer to CPU consumer not supported
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bq.gpu_to_cpu_unsupported=1

# Power
#PRODUCT_PACKAGES += \
#    power.universal5422

# Ramdisk
PRODUCT_PACKAGES += \
fstab.goldfish \
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
adb_keys

# Radio
PRODUCT_PACKAGES += \
    cbd \
    libsecril-client \
    libsecril-client-sap

# Wifi
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/wifi/olsrd.conf:system/etc/wifi/olsrd.conf \
	$(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	$(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf


PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    hostapd_default.conf \
    libwpa_client \
    wpa_supplicant \
    libnetcmdiface \
    macloader

# for off charging mode
PRODUCT_PACKAGES += \
    charger_res_images
    
#LOCAL_SHARED_LIBRARIES += libbinder

# Default.prop overrides to get adb working at boot   
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
	ro.hardware=universal5422 \
	ro.zygote=zygote32 \
    persist.service.adb.enable=1 \
	persist.service.debuggable=1 \
#	persist.sys.usb.config=mtp,adb \

# $(call inherit-product, build/target/product/full.mk)

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

$(call inherit-product-if-exists, vendor/samsung/k3gxx/k3gxx-vendor.mk)
