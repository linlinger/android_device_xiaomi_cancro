DEVICE_PATH := device/xiaomi/cancro

$(call inherit-product, device/xiaomi/msm8974-common/msm8974-common.mk)
$(call inherit-product, vendor/xiaomi/cancro/cancro-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# System properties
-include $(DEVICE_PATH)/system_prop.mk


#Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080