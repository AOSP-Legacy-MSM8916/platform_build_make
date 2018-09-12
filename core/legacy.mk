# Set all versions
LEGACY_BUILD_TYPE = LEGACY
LEGACY_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
LEGACY_PLATFORM_VERSION := 9.0

TARGET_PRODUCT_SHORT := $(subst aosp_,,$(LEGACY_BUILD))

LEGACY_VERSION := LegacyAOSP_$(LEGACY_BUILD)-$(LEGACY_PLATFORM_VERSION)-$(LEGACY_BUILD_DATE)-$(LEGACY_BUILD_TYPE)
ROM_FINGERPRINT := LegacyAOSP/$(LEGACY_PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(LEGACY_BUILD_DATE)

ro.legacyaosp.build_date := $(LEGACY_BUILD_DATE)

LEGACY_PROPERTIES := \
    org.legacyaosp.version=$(LEGACY_VERSION) \
    org.legacyaosp.build_date=$(LEGACY_BUILD_DATE) \
    org.legacyaosp.build_type=$(LEGACY_BUILD_TYPE) \
    org.legacyaosp.fingerprint=$(ROM_FINGERPRINT)

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

PRODUCT_DEFAULT_PROPERTIES += \
    dalvik.vm.debug.alloc=0 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.com.android.dateformat=MM-dd-yyyy \
    persist.sys.disable_rescue=true \
    keyguard.no_require_sim=true \
    ro.build.selinux=1 \
    ro.setupwizard.rotation_locked=true
