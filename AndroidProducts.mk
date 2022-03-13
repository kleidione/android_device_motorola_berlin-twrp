#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_berlin.mk

COMMON_LUNCH_CHOICES := \
    twrp_berlin-user \
    twrp_berlin-userdebug \
    twrp_berlin-eng
