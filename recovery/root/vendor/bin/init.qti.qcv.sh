#! /system/bin/sh
#=============================================================================
# Copyright (c) 2020 Qualcomm Technologies, Inc.
# All Rights Reserved.
# Confidential and Proprietary - Qualcomm Technologies, Inc.
#=============================================================================

soc_id=`cat /sys/devices/soc0/soc_id` 2> /dev/null

# Store soc_id in ro.vendor.qti.soc_id
setprop ro.vendor.qti.soc_id $soc_id

# For chipsets in QCV family, convert soc_id to soc_name
# and store it in ro.vendor.qti.soc_name.
if [ "$soc_id" -eq 415 ] || [ "$soc_id" -eq 439 ] || [ "$soc_id" -eq 456 ] ||
   [ "$soc_id" -eq 501 ] || [ "$soc_id" -eq 502 ]; then
    setprop ro.vendor.qti.soc_name lahaina
elif [ "$soc_id" -eq 450 ]; then
    setprop ro.vendor.qti.soc_name shima
elif [ "$soc_id" -eq 356 ]; then
    setprop ro.vendor.qti.soc_name kona
elif [ "$soc_id" -eq 400 ]; then
    setprop ro.vendor.qti.soc_name lito
fi
