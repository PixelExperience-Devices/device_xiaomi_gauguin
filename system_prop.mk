#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.media_vol_steps=25 \
    ro.config.vc_call_vol_steps=7

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.btstack.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aptxadaptive-aac-ldac \
    persist.vendor.btstack.enable.splita2dp=true \
    vendor.bluetooth.soc=cherokee

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=440

# Enable blurs, hidden under dev option
PRODUCT_PRODUCT_PROPERTIES += \
    ro.surface_flinger.supports_background_blur=1 \
    persist.sys.sf.disable_blurs=1 \
    ro.sf.blurs_are_expensive=1  

# Fingerprint Payment for China apps
PRODUCT_PRODUCT_PROPERTIES += \
    persist.vendor.sys.pay.ifaa=1

# Refresh Rate
PRODUCT_PRODUCT_PROPERTIES += \
    ro.surface_flinger.use_content_detection_for_refresh_rate=true \
    ro.surface_flinger.set_display_power_timer_ms=1000 \
    ro.surface_flinger.set_idle_timer_ms=200 \
    ro.surface_flinger.set_touch_timer_ms=200

# Netflix
PRODUCT_PROPERTY_OVERRIDES += \
    ro.netflix.bsp_rev=Q7250-19133-1

# RIL
PRODUCT_PRODUCTY_OVERRIDES += \
    ro.telephony.default_network=33,22

