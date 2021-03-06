LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libcyanogen-dsp

LOCAL_CFLAGS := -O3 \
                -fomit-frame-pointer \
                -funswitch-loops \
                -pipe \
                -Wstrict-aliasing=2 \
                -Werror=strict-aliasing

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/soundfx

LOCAL_PRELINK_MODULE := false

LOCAL_ARM_MODE := arm

LOCAL_SRC_FILES := \
	cyanogen-dsp.cpp \
	Biquad.cpp \
	Delay.cpp \
        Dither.cpp \
	Effect.cpp \
	EffectBassBoost.cpp \
	EffectCompression.cpp \
	EffectEqualizer.cpp \
	EffectVirtualizer.cpp \
	FIR16.cpp \
# terminator

LOCAL_C_INCLUDES += \
	frameworks/base/include \
	hardware/libhardware/include \
	system/core/include \
	system/media/audio_effects/include \
# terminator

LOCAL_SHARED_LIBRARIES := \
	libcutils

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := audio_effects.conf

LOCAL_SRC_FILES := $(LOCAL_MODULE)

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE_CLASS := ETC

LOCAL_MODULE_PATH := $(TARGET_OUT)/vendor/etc

include $(BUILD_PREBUILT)
