# Inherit from AOSP Cuttlefish phone configuration
$(call inherit-product, device/google/cuttlefish/vsoc_x86_64/phone/aosp_cf.mk)

# DollOS identity
PRODUCT_NAME := dollos_cf_x86_64
PRODUCT_DEVICE := vsoc_x86_64
PRODUCT_BRAND := DollOS
PRODUCT_MODEL := DollOS on Cuttlefish
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
