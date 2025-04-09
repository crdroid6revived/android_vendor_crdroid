# Product version should match Android version
PRODUCT_VERSION_MAJOR = 10
PRODUCT_VERSION_MINOR = 0

# Increase CR Version with each major release.
CR_VERSION := 6.28

LINEAGE_VERSION := crDroid-rev-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date +%Y%m%d)-$(LINEAGE_BUILD)-v$(CR_VERSION)
LINEAGE_DISPLAY_VERSION := crDroid-rev-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(LINEAGE_BUILD)-v$(CR_VERSION)

ifneq ($(PRODUCT_DEFAULT_DEV_CERTIFICATE),)
ifneq ($(PRODUCT_DEFAULT_DEV_CERTIFICATE),build/target/product/security/testkey)
    ifneq ($(LINEAGE_BUILDTYPE), UNOFFICIAL)
        ifndef TARGET_VENDOR_RELEASE_BUILD_ID
            ifneq ($(LINEAGE_EXTRAVERSION),)
                # Remove leading dash from LINEAGE_EXTRAVERSION
                LINEAGE_EXTRAVERSION := $(shell echo $(LINEAGE_EXTRAVERSION) | sed 's/-//')
                TARGET_VENDOR_RELEASE_BUILD_ID := $(LINEAGE_EXTRAVERSION)
            else
                TARGET_VENDOR_RELEASE_BUILD_ID := $(shell date -u +%Y%m%d)
            endif
        else
            TARGET_VENDOR_RELEASE_BUILD_ID := $(TARGET_VENDOR_RELEASE_BUILD_ID)
        endif
    endif
endif
endif
