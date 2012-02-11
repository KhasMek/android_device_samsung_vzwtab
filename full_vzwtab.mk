# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for crespo hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, device/samsung/vzwtab/vzwtab.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

# Galaxy Tab uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# Discard inherited values and use our own instead.
PRODUCT_NAME := aokp_vzwtab
PRODUCT_DEVICE := vzwtab
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SCH-I800
PRODUCT_RELEASE_NAME := VZWTab
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SCH-I800 TARGET_DEVICE=SCH-I800 BUILD_ID=GINGERBREAD BUILD_FINGERPRINT=verizon/SCH-I800/SCH-I800:2.3.4/GINGERBREAD/EF01:user/release-keys PRIVATE_BUILD_DESC="SCH-I800-user 2.3.4 GINGERBREAD EF01 release-keys"
