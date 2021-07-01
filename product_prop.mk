#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Adb
ifeq ($(TARGET_BUILD_VARIANT),eng)
# /vendor/default.prop is force-setting ro.adb.secure=1
# Get rid of that by overriding it in /product on eng builds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0
endif

# Audio
PRODUCT_PRODUCT_PROPERTIES += \
    ro.bluetooth.a2dp_offload.supported=false \
    persist.bluetooth.a2dp_offload.disabled=true \
    persist.bluetooth.bluetooth_audio_hal.disabled=true \
    persist.vendor.qcom.bluetooth.enable.splita2d=false \
    vendor.audio.feature.a2dp_offload.enable = false

# Camera
PRODUCT_PRODUCT_PROPERTIES += \
    vendor.camera.aux.packagelist=org.lineageos.snap,net.sourceforge.opencamera,org.codeaurora.snapcam
    media.settings.xml=/vendor/etc/media_profiles_vendor.xml

# Dex2oat
PRODUCT_PRODUCT_PROPERTIES += \
    dalvik.vm.dex2oat64.enabled=true

# Charger
PRODUCT_PRODUCT_PROPERTIES += \
    ro.charger.enable_suspend=true

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.disable_backpressure=1 \
    debug.sf.latch_unsignaled=1 \
    debug.sf.enable_hwc_vds=1 \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3

# LMKD
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.low_ram=false \
    ro.lmk.log_stats=true

# Priv-app permission
PRODUCT_PRODUCT_PROPERTIES += \
    ro.control_privapp_permissions=log

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1 \
    persist.radio.NO_STAPA=1 \
    persist.vendor.data.iwlan.enable=true \
    persist.vendor.ims.disableADBLogs=1 \
    persist.vendor.ims.disableIMSLogs=1 \
    persist.vendor.radio.report_codec=1 \
	persist.sys.fflag.override.settings_provider_model=false

# Telephony
PRODUCT_PRODUCT_PROPERTIES += \
    ro.telephony.default_network=33,22 \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1

