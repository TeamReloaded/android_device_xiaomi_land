LOCAL_PATH := $(call my-dir)

ifeq ($(call is-vendor-board-platform,QCOM),true)

# HAL module implemenation stored in
# hw/<POWERS_HARDWARE_MODULE_ID>.<ro.hardware>.so
include $(CLEAR_VARS)

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SHARED_LIBRARIES := liblog libcutils libdl libxml2
LOCAL_SRC_FILES := power.c metadata-parser.c utils.c list.c hint-data.c powerhintparser.c power-8937.c
LOCAL_C_INCLUDES := external/libxml2/include \
                    external/icu/icu4c/source/common

ifeq ($(TARGET_USES_INTERACTION_BOOST),true)
    LOCAL_CFLAGS += -DINTERACTION_BOOST
endif

LOCAL_MODULE := power.qcom
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -Wno-unused-parameter -Wno-unused-variable
LOCAL_VENDOR_MODULE := true
<<<<<<< HEAD
include $(BUILD_SHARED_LIBRARY)
=======
LOCAL_HEADER_LIBRARIES := libhardware_headers
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_PROPRIETARY_MODULE := true
LOCAL_SHARED_LIBRARIES := libhardware libhidlbase libhwbinder liblog libutils android.hardware.power@1.0
LOCAL_SRC_FILES := power_shim.cpp
LOCAL_MODULE := power.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

endif
>>>>>>> afb9130... land: power: Support legacy powerHAL methods

endif
