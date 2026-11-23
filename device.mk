# Copyright (C) 2024 The Android Open Source Project
# SPDX-License-Identifier: Apache-2.0

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Configure launch_with_vendor_ramdisk.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

DEVICE_PATH := device/Blackview/MEGA_3

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 34
PRODUCT_FIRST_API_LEVEL := 34
PRODUCT_SHIPPING_API_LEVEL := 34

# Virtual_ab_ota
AB_OTA_UPDATER := true
ENABLE_VIRTUAL_AB := true
#TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock
    
# Health Hal
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Kernel
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false
PRODUCT_ENABLE_UFFD_GC := true

# A/B
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor \
    vendor_boot

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/mtk_plpath_utils \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Mtk plpath utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery \

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libion \
    
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \

# snapuserd
PRODUCT_PACKAGES += snapuserd
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/snapuserd

# Если нужно добавить бинарники, которые должны быть доступны ДО монтирования /system
PRODUCT_PACKAGES += \
    linker64.vendor_ramdisk \
    libc.so.vendor_ramdisk \
    snapuserd.vendor_ramdisk

# Vendor ramdisk
PRODUCT_COPY_FILES += \
     device/Blackview/MEGA_3/avb/q-gsi.avbpubkey:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/avb/q-gsi.avbpubkey \
     device/Blackview/MEGA_3/avb/r-gsi.avbpubkey:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/avb/r-gsi.avbpubkey \
     device/Blackview/MEGA_3/avb/s-gsi.avbpubkey:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/avb/s-gsi.avbpubkey \
     device/Blackview/MEGA_3/fstab.emmc:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.emmc \
     device/Blackview/MEGA_3/fstab.mt6789:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.mt6789

# OEM otacerts
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(DEVICE_PATH)/security/releasekey
