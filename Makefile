TARGET := iphone:clang:latest:14.0
ARCHS = arm64
DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1

VERSION = 1.0
BUILD    = $(shell date +%s)
SED_VERSION := $(shell echo $(VERSION) | sed 's/[&]/\\&/g')
SED_BUILD   := $(shell echo $(BUILD)   | sed 's/[&]/\\&/g')

include $(THEOS)/makefiles/common.mk

IMGUI_SRC = $(wildcard load/*.mm) $(wildcard load/*.m)
crypto_src = $(wildcard crypto/*.c)

FRAMEWORK_NAME = Monite

$(FRAMEWORK_NAME)_FRAMEWORKS = UIKit Foundation SystemConfiguration SafariServices IOKit CoreFoundation
$(FRAMEWORK_NAME)_CCFLAGS = -std=c++14 -fno-rtti -fno-exceptions -DNDEBUG -fexceptions
$(FRAMEWORK_NAME)_CFLAGS = -fobjc-arc -Wno-return-type -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value -Wno-unused-function -I.
$(FRAMEWORK_NAME)_LDFLAGS += libdobby.a curl/curl -lz
$(FRAMEWORK_NAME)_FILES = freefire.mm Esp_Full.mm menu.mm AppLanguage.cpp AppLanguage.mm \
                          $(wildcard LIB/IMGUI/*.mm) $(wildcard LIB/IMGUI/*.cpp) $(wildcard fishhook/*.c) $(wildcard fishhook/*.mm) \
                          $(IMGUI_SRC) $(crypto_src)  RequireESP/Offsets.cpp # $(wildcard Trash/*.mm) monite_check.mm $(wildcard Hosts/*.mm) $(wildcard Hosts/*.m)
 
include $(THEOS_MAKE_PATH)/framework.mk
