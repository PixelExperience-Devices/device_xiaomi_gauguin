#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from gauguin device
$(call inherit-product, device/xiaomi/gauguin/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_gauguin
PRODUCT_DEVICE := gauguin
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Mi 10i
PRODUCT_MANUFACTURER := Xiaomi

# Build info
BUILD_FINGERPRINT := "Redmi/gauguinin/gauguin:10/QKQ1.200628.002/V12.0.3.0.QJSINXM:user/release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=gauguin \
    PRODUCT_NAME=gauguin \
    PRIVATE_BUILD_DESC="gauguin-user 10 QKQ1.200628.002 V12.0.3.0.QJSINXM release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
