#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

# Set this up here so that BoardVendorConfig.mk can override it
BOARD_USES_GENERIC_AUDIO := false

BOARD_USES_LIBSECRIL_STUB := true

# Use the non-open-source parts, if they're present
-include vendor/samsung/vzwtab/BoardConfigVendor.mk

# ARMv7-A Cortex-A8 architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_PROVIDES_INIT := true
TARGET_RECOVERY_INITRC := device/samsung/vzwtab/recovery.rc

TARGET_BOARD_PLATFORM := s5pc110
TARGET_BOARD_PLATFORM_GPU := POWERVR_SGX540_120
TARGET_BOOTLOADER_BOARD_NAME := s5pc110

TARGET_PROVIDES_LIBAUDIO := true

# Releasetools
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/samsung/vzwtab/releasetools/vzwtab_ota_from_target_files
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/samsung/vzwtab/releasetools/vzwtab_img_from_target_files

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# WiFi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_WLAN_DEVICE := bcm4329
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/wifi/bcm4329_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt dhd_watchdog_ms=10 dhd_poll=1"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/wifi/bcm4329_aps.bin"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/wifi/bcm4329_sta.bin"
WIFI_DRIVER_MODULE_NAME := "dhd"
BOARD_WEXT_NO_COMBO_SCAN := true

USE_CAMERA_STUB := false
ifeq ($(USE_CAMERA_STUB),false)
BOARD_CAMERA_LIBRARIES := libcamera
endif
BOARD_V4L2_DEVICE := /dev/video1
BOARD_CAMERA_DEVICE := /dev/video0
BOARD_SECOND_CAMERA_DEVICE := /dev/video2

# OpenGL stuff
BOARD_EGL_CFG := device/samsung/vzwtab/prebuilt/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true

# skia
BOARD_USE_SKIA_LCDTEXT := true

# Device related defines
BOARD_NAND_PAGE_SIZE := 4096 -s 128
BOARD_KERNEL_BASE := 0x32000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := console=ttyFIQ0,115200 init=/init no_console_suspend
TARGET_PREBUILT_KERNEL := device/samsung/vzwtab/kernel

BOARD_BOOTIMAGE_PARTITION_SIZE := 7864320
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 336068608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1319108608
BOARD_FLASH_BLOCK_SIZE := 4096

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/vzwtab/shbootimg.mk
TARGET_RECOVERY_PRE_COMMAND := "echo 1 > /cache/.startrecovery; sync;"
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/aries-common/recovery/graphics.c

TARGET_OTA_ASSERT_DEVICE := vzwtab,SCH-I800,SPH-P100

