#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# Enable virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
# Inherit some common twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from oneplus8 device
$(call inherit-product, device/oneplus/oneplus8/device.mk)

PRODUCT_DEVICE := oneplus8
PRODUCT_NAME := twrp_oneplus8
PRODUCT_BRAND := oneplus
PRODUCT_MODEL := IN2013
PRODUCT_MANUFACTURER := oneplus

TW_DEVICE_VERSION := infected-b2
