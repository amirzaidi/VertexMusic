ifneq ($(TARGET_HAS_LOW_RAM),true)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := $(call all-java-files-under, src) \
    src/com/android/music/IMediaPlaybackService.aidl

LOCAL_STATIC_JAVA_LIBRARIES = android-support-v4
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v7-appcompat
LOCAL_STATIC_JAVA_LIBRARIES += android-support-design

LOCAL_RESOURCE_DIR = \
        $(LOCAL_PATH)/res \
        frameworks/support/v7/appcompat/res \
        frameworks/support/design/res

LOCAL_PACKAGE_NAME := SnapdragonMusic
LOCAL_OVERRIDES_PACKAGES := Music
LOCAL_CERTIFICATE := platform

LOCAL_PROGUARD_FLAG_FILES := proguard.flags

LOCAL_AAPT_FLAGS := \
        --auto-add-overlay \
        --extra-packages android.support.v7.appcompat \
        --extra-packages android.support.design

LOCAL_VENDOR_MODULE := true

include $(BUILD_PACKAGE)

# Use the folloing include to make our test apk.
#include $(call all-makefiles-under,$(LOCAL_PATH))

endif