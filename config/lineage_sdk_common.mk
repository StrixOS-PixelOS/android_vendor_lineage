# Permissions for lineage sdk services
PRODUCT_COPY_FILES += \
    vendor/lineage/config/permissions/org.lineageos.globalactions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.los.globalactions.xml \
    vendor/lineage/config/permissions/org.lineageos.hardware.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.los.hardware.xml \
    vendor/lineage/config/permissions/org.lineageos.health.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.los.health.xml \
    vendor/lineage/config/permissions/org.lineageos.livedisplay.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.los.livedisplay.xml \
    vendor/lineage/config/permissions/org.lineageos.profiles.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.los.profiles.xml \
    vendor/lineage/config/permissions/org.lineageos.settings.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.los.settings.xml \
    vendor/lineage/config/permissions/org.lineageos.trust.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.los.trust.xml

# Lineage Platform Library
PRODUCT_PACKAGES += \
    org.los.platform-res \
    org.los.platform

# AOSP has no support of loading framework resources from /system_ext
# so the SDK has to stay in /system for now
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/framework/org.los.platform-res.apk \
    system/framework/org.los.platform.jar

# Allow-list odex and vdex when OVERRIDE_DISABLE_DEXOPT_ALL isn't set.
# OVERRIDE_DISABLE_DEXOPT_ALL is usually set to true for eng builds. We allow-list the below mainly for user and userdebug builds.
# Refer build/target/product/runtime_libart.mk.
ifneq ($(OVERRIDE_DISABLE_DEXOPT_ALL),true)
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/framework/oat/%/org.los.platform.odex \
    system/framework/oat/%/org.los.platform.vdex
endif
