#!/usr/bin/env bash
# Hardware model, too. 
# Adapted from this thread: 
# https://www.reddit.com/r/macsysadmin/comments/bmycmz/submission_about_this_mac_command_line_edition/ 
# Shout-out to: https://reddit.com/u/Thanksagainforlunch

# Step 1: Get Apple Device ID, e.g. MacBookAir6,2
# system_profiler to extract SPHardwareDataType,
# then awk to get Identifier (stipping content to the left of the ":"
# Step 2: use PlistBuddy to search for device_id
# then awk to extract marketingModel (stripping content to the left of "="

#shopt -s extglob
#printf "%s\\n" @(English|en).lproj


hardware_model () { 
  
  shopt -s extglob

  hardware_model=$(/usr/libexec/PlistBuddy -c "print :$(sysctl -n hw.model):_LOCALIZABLE_:marketingModel" /System/Library/PrivateFrameworks/ServerInformation.framework/Versions/A/Resources/@(English|en).lproj/SIMachineAttributes.plist)
  
  printf "%s\n" "$hardware_model" 
} 

hardware_model
