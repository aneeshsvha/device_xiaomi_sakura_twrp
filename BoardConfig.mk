#
# Copyright (C) 2021 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
SOONG_ALLOW_MISSING_DEPENDENCIES := true
ALLOW_MISSING_DEPENDENCIES := true

LOCAL_PATH := device/xiaomi/sakura

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8953
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_SUFFIX := _64

# Crypto
TW_INCLUDE_CRYPTO := true
BOARD_USES_QCOM_FBE_DECRYPTION := true
PLATFORM_VERSION := 16.1.0
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2127-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PRODUCT_ENFORCE_VINTF_MANIFEST := true

# Init
TARGET_INIT_VENDOR_LIB := //$(LOCAL_PATH):libinit_sakura
TARGET_RECOVERY_DEVICE_MODULES := libinit_sakura

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.bootdevice=7824900.sdhci androidboot.selinux=permissive audit=0
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/Image.gz-dtb

# Platform
TARGET_BOARD_PLATFORM := msm8953

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25765043200 # (25765060096 - 16384)
BOARD_VENDORIMAGE_PARTITION_SIZE := 872415232

BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

TARGET_RECOVERY_DEVICE_MODULES += \
    android.hidl.base@1.0 \
    libdrm \
    libion \
    libxml2 \
    libdrm \
    libicuuc \
    vendor.display.config@1.0 \
    vendor.display.config@2.0

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdrm.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so
    
# TWRP System Libraries
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT)/lib64/android.hidl.base@1.0.so
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libicuuc.so
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libpcrecpp.so
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libdrm.so
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libion.so
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so

# TWRP Notch handling
TW_Y_OFFSET := 89
TW_H_OFFSET := -89

# TWRP Configuration
RECOVERY_SDCARD_ON_DATA := true
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_SCREEN_BLANK_ON_BOOT := true
TW_NO_SCREEN_BLANK := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_SUPPRESS_SECURE_ERASE := true
TW_IGNORE_MISC_WIPE_DATA := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 150
TW_USE_LEGACY_BATTERY_SERVICES := true
TW_USE_TOOLBOX := true
TW_INCLUDE_FUSE_NTFS := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true

# Debugging 
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD :=  true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd
TARGET_RECOVERY_DEVICE_MODULES += strace
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/strace
