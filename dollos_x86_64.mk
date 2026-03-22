# Inherit from AOSP x86_64 emulator configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_system.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_product.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/board/generic_x86_64/device.mk)

PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := relaxed

# DollOS identity
PRODUCT_NAME := dollos_x86_64
PRODUCT_DEVICE := generic_x86_64
PRODUCT_BRAND := DollOS
PRODUCT_MODEL := DollOS on Emulator
PRODUCT_MANUFACTURER := DollOS

# DollOS version
DOLLOS_VERSION := 0.1.0
PRODUCT_SYSTEM_PROPERTIES += \
    ro.dollos.version=$(DOLLOS_VERSION)

# DollOS packages (installed to system_ext partition)
PRODUCT_PACKAGES += \
    DollOSService \
    DollOSSetupWizard

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.dollos.enabled=true

# DollOS framework overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/dollos/overlay

# DollOS SELinux policy
BOARD_VENDOR_SEPOLICY_DIRS += vendor/dollos/sepolicy

# Privapp permissions (in system_ext)
PRODUCT_COPY_FILES += \
    packages/apps/DollOSService/privapp-permissions-dollos-service.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-dollos-service.xml \
    packages/apps/DollOSSetupWizard/privapp-permissions-dollos-setup.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-dollos-setup.xml
