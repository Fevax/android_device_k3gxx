# Release name
PRODUCT_RELEASE_NAME := k3gxx

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/k3gxx/device_k3gxx.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_k3gxx
PRODUCT_DEVICE := k3gxx
PRODUCT_BRAND := samsung
PRODUCT_MODEL=SM-G900H
PRODUCT_MANUFACTURER := samsung
