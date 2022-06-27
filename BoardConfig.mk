#
# Copyright (C) 2015 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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

DEVICE_PATH := device/xiaomi/cancro

# Audio
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/diracmobile.config:system/vendor/etc/diracmobile.config \
    $(DEVICE_PATH)/audio/diracmobile_4.config:system/vendor/etc/diracmobile_4.config \
    $(DEVICE_PATH)/audio/mixer_paths.xml:system/vendor/etc/mixer_paths.xml \
    $(DEVICE_PATH)/audio/mixer_paths_4.xml:system/vendor/etc/mixer_paths_4.xml \
    $(DEVICE_PATH)/audio/acdb/MTP/MTP_Bluetooth_cal.acdb:system/etc/acdbdata/MTP/MTP_Bluetooth_cal.acdb \
    $(DEVICE_PATH)/audio/acdb/MTP/MTP_General_cal.acdb:system/etc/acdbdata/MTP/MTP_General_cal.acdb \
    $(DEVICE_PATH)/audio/acdb/MTP/MTP_Global_cal.acdb:system/etc/acdbdata/MTP/MTP_Global_cal.acdb \
    $(DEVICE_PATH)/audio/acdb/MTP/MTP_Handset_cal.acdb:system/etc/acdbdata/MTP/MTP_Handset_cal.acdb \
    $(DEVICE_PATH)/audio/acdb/MTP/MTP_Hdmi_cal.acdb:system/etc/acdbdata/MTP/MTP_Hdmi_cal.acdb \
    $(DEVICE_PATH)/audio/acdb/MTP/MTP_Headset_cal.acdb:system/etc/acdbdata/MTP/MTP_Headset_cal.acdb \
    $(DEVICE_PATH)/audio/acdb/MTP/MTP_Speaker_cal.acdb:system/etc/acdbdata/MTP/MTP_Speaker_cal.acdb \
    $(DEVICE_PATH)/audio/acdb/MTP/MTP_Speaker_cal_4.acdb:system/etc/acdbdata/MTP/MTP_Speaker_cal_4.acdb

# Device check
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/releasetools/device_check.sh:install/bin/device_check.sh

# FM Radio
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni
BOARD_HAVE_QCOM_FM := true
TARGET_FM_LEGACY_PATCHLOADER := true

PRODUCT_PACKAGES += \
    init.qcom.fm.sh

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0-impl-bcm \
    nfc_nci.bcm2079x.default \
    NfcNci \
    Tag

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/vendor/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/vendor/etc/permissions/android.hardware.nfc.xml \
    $(DEVICE_PATH)/nfc/libnfc-nci.conf:system/etc/libnfc-nci.conf \
    $(DEVICE_PATH)/nfc/libnfc-nci-20791b05.conf:system/etc/libnfc-nci-20791b05.conf \
    $(DEVICE_PATH)/nfc/nfcee_access_debug.xml:system/etc/nfcee_access.xml

# IR
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-service.cancro

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/vendor/etc/permissions/android.hardware.consumerir.xml

# KeyLayout
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/keylayout/gpio-keys.kl:system/vendor/usr/keylayout/gpio-keys.kl \
    $(DEVICE_PATH)/keylayout/synaptics_dsx.kl:system/vendor/usr/keylayout/synaptics_dsx.kl

# Ramdisk
PRODUCT_PACKAGES += \
    ueventd.qcom.rc

# ReleaseTools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)/releasetools

# Sensor
PRODUCT_PACKAGES += \
    sensors.msm8974

# Vendor Init
TARGET_INIT_VENDOR_LIB      := libinit_cancro
TARGET_LIBINIT_DEFINES_FILE := $(DEVICE_PATH)/init/init_cancro.cpp

# WiFi
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/vendor/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(DEVICE_PATH)/wifi/WCNSS_qcom_wlan_nv_x4.bin:system/vendor/firmware/wlan/prima/WCNSS_qcom_wlan_nv_x4.bin \
    $(DEVICE_PATH)/wifi/WCNSS_qcom_wlan_nv_x4lte.bin:system/vendor/firmware/wlan/prima/WCNSS_qcom_wlan_nv_x4lte.bin



# Inherit from the common version
-include device/xiaomi/msm8974-common/BoardConfigCommon.mk

# Inherit from the proprietary version
-include vendor/xiaomi/cancro/BoardConfigVendor.mk
