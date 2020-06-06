#!/bin/bash
# Hardware model, too. 
# Adapted from this thread: 
# https://www.reddit.com/r/macsysadmin/comments/bmycmz/submission_about_this_mac_command_line_edition/ 
# Shout-out to: https://reddit.com/u/Thanksagainforlunch

# Step 1: Get Apple Device ID, e.g. MacBookAir6,2
# system_profiler to extract SPHardwareDataType,
# then awk to get Identifier (stipping content to the left of the ":"
# Step 2: use PlistBuddy to search for device_id
# then awk to extract marketingModel (stripping content to the left of "="


# This works ---> 

#hardware_model () { 
  
#  device_id="$(system_profiler SPHardwareDataType \ |awk '/Identifier/{ sub(/^.*: /, ""); print; }')"

#  hardware_mod="$(/usr/libexec/PlistBuddy -c "Print $device_id" \
#  /System/Library/PrivateFrameworks/ServerInformation.framework/Versions/A/Resources/English.lproj/SIMachineAttributes.plist \
#  |awk '/marketingModel/{ sub(/^.*= /, ""); print; }')" 
   
#  printf "%s\n" "$hardware_mod" 
#} 


### Testing this ---> 
### For example: 
#shopt -s extglob
#printf "%s\\n" @(English|en).lproj


hardware_model () { 

  shopt -s extglob
  
  device_id="$(system_profiler SPHardwareDataType \ |awk '/Identifier/{ sub(/^.*: /, ""); print; }')"

  hardware_mod="$(/usr/libexec/PlistBuddy -c "Print $device_id" \
  /System/Library/PrivateFrameworks/ServerInformation.framework/Versions/A/Resources/@(English|en).lproj/SIMachineAttributes.plist \
  |awk '/marketingModel/{ sub(/^.*= /, ""); print; }')" 
   
  printf "%s\n" "$hardware_mod" 
} 

hardware_model
