LOCAL_PATH := $(call my-dir)
RUBY_ROOT  := $(LOCAL_PATH)/../mruby

include $(CLEAR_VARS)

LOCAL_MODULE    := andruboid
LOCAL_SRC_FILES := andruboid.c
LOCAL_C_INCLUDES:= $(RUBY_ROOT)/include $(RUBY_ROOT)/src
LOCAL_CFLAGS    := -Wall -Wno-switch -Werror -Wno-error=switch
LOCAL_LDFLAGS   := -L$(LOCAL_PATH) -lmruby

include $(BUILD_SHARED_LIBRARY)
