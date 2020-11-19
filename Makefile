INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BatteryFlow-Reborn

$(TWEAK_NAME)_FILES = $(wildcard *.xm)
$(TWEAK_NAME)_FRAMEWORKS = UIKit AudioToolbox
$(TWEAK_NAME)_EXTRA_FRAMEWORKS = Cephei
$(TWEAK_NAME)_LIBRARIES = notifications
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wno-error -Wno-deprecated-declarations -Wno-nullability-completeness

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += prefs

include $(THEOS_MAKE_PATH)/aggregate.mk