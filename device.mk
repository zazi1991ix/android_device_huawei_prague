#
# Copyright 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

# Android Open Source Project Common Stuff
PRODUCT_PACKAGES += \
	Launcher3

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
PRODUCT_PACKAGES += \
    	audio.a2dp.default \
    	audio.primary.default \
    	audio.r_submix.default \
    	audio.usb.default \
    	libaudioroute \
    	libaudioutils \
    	libtinyalsa \
    	tinycap \
    	tinymix \
    	tinypcminfo \
    	tinyplay \

# Blobs
$(call inherit-product-if-exists, vendor/huawei/prague/prague-vendor.mk)

# Camera
PRODUCT_PACKAGES += \
    	Snap

# Codecs
PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/prebuilts/media_codecs.xml:system/etc/media_codecs.xml \
    	$(LOCAL_PATH)/prebuilts/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    	$(LOCAL_PATH)/prebuilts/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_COPY_FILES += \
    	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Dalvik
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PROPERTY_OVERRIDES += \
    	dalvik.vm.heapstartsize=8m \
    	dalvik.vm.heapgrowthlimit=288m \
    	dalvik.vm.heapsize=768m \
    	dalvik.vm.heaptargetutilization=0.75 \
    	dalvik.vm.heapminfree=512k \
    	dalvik.vm.heapmaxfree=8m

PRODUCT_PROPERTY_OVERRIDES += \
    	ro.hwui.texture_cache_size=72 \
    	ro.hwui.layer_cache_size=48 \
    	ro.hwui.path_cache_size=32 \
    	ro.hwui.gradient_cache_size=1 \
    	ro.hwui.drop_shadow_cache_size=6 \
    	ro.hwui.r_buffer_cache_size=8 \
    	ro.hwui.texture_cache_flushrate=0.4 \
    	ro.hwui.text_small_cache_width=1024 \
    	ro.hwui.text_small_cache_height=1024 \
    	ro.hwui.text_large_cache_width=2048 \
    	ro.hwui.text_large_cache_height=1024

# Fingerprint
PRODUCT_COPY_FILES += \
    	frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

# GPS
PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/prebuilts/clatd.conf:system/etc/clatd.conf \
    	$(LOCAL_PATH)/prebuilts/geoloc.conf:system/etc/geoloc.conf

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    	debug.hwui.render_dirty_regions=false \
    	persist.sys.strictmode.disable=1 \
    	persist.sys.use_dithering=2 \

# Huawei P8 Lite 2017 Components
PRODUCT_PACKAGES += \
	hwcomposer.hi6250 \
    	libshim_stagefright

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    	persist.sys.usb.config=manufacture,adb \
    	ro.build.subproduct=F2FS \
    	ro.magic.api.version=0.1 \
    	sys.usb.configfs=1 \
    	sys.usb.controller=hisi-usb-otg

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.audio.pro.xml:system/etc/permissions/android.hardware.audio.pro.xml \
        frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
        frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
	frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:system/etc/permissions/android.hardware.sensor.ambient_temperature.xml \
	frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:system/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.relative_humidity.xml:system/etc/permissions/android.hardware.sensor.relative_humidity.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
        frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Ramdisk
PRODUCT_PACKAGES += \
    	fstab.hi6250 \
    	fstab.zram1280m \
    	fstab.zram1536m \
    	init.charger.rc \
    	init.chip.charger.rc \
    	init.chip.usb.rc \
    	init.hi6250.power.rc \
    	init.hi6250.rc \
    	init.hi6250.usb.configfs.rc \
    	init.hi6250.usb.rc \
    	ueventd.hi6250.rc

# USB
PRODUCT_PACKAGES += \
    	com.android.future.usb.accessory

# Wifi
PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/wifi/hostapd_hisi.conf:system/etc/wifi/hostapd_hisi.conf \
    	$(LOCAL_PATH)/wifi/p2p_supplicant.conf:system/etc/wifi/p2p_supplicant.conf \
    	$(LOCAL_PATH)/wifi/p2p_supplicant_hisi.conf:system/etc/wifi/p2p_supplicant_hisi.conf \
    	$(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    	$(LOCAL_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    	$(LOCAL_PATH)/wifi/wpa_supplicant_hisi.conf:system/etc/wifi/wpa_supplicant_hisi.conf \
    	$(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    	hostapd \
    	libwpa_client \
   	wpa_supplicant

PRODUCT_PROPERTY_OVERRIDES += \
    	dalvik.vm.heapgrowthlimit=384m \
    	dalvik.vm.heapsize=512m \
    	dalvik.vm.heaptargetutilization=0.75 \
    	dalvik.vm.heapstartsize=8m \

# Zygote
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.zygote=zygote64_32

PRODUCT_COPY_FILES += \
	system/core/rootdir/init.zygote64_32.rc:root/init.zygote64_32.rc

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.zygote=zygote64_32
