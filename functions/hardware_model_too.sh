#!/bin/bash

# Hardware model, too. 

# Step 1: Get Apple Device ID, e.g. MacBookAir6,2
# system_profiler to extract SPHardwareDataType,
# then awk to get Identifier (stipping content to the left of the ":"
# Step 2: use PlistBuddy to search for device_id
# then awk to extract marketingModel (stripping content to the left of "="

device_id () {

  d_id="$(system_profiler SPHardwareDataType \ |awk '/Identifier/{ sub(/^.*: /, ""); print; }')"
  printf "%s\n" "$d_id" 
} 

hardware_model () { 
  
  device_id="$(system_profiler SPHardwareDataType \ |awk '/Identifier/{ sub(/^.*: /, ""); print; }')"

  hardware_mod="$(/usr/libexec/PlistBuddy -c "Print $device_id" \
  /System/Library/PrivateFrameworks/ServerInformation.framework/Versions/A/Resources/English.lproj/SIMachineAttributes.plist \
  |awk '/marketingModel/{ sub(/^.*= /, ""); print; }')" 
   
  printf "%s\n" "$hardware_mod" 
} 

#device_id 
hardware_model

#Get the marketing model name from the plist!
#Bash script written quickly and poorly by https://reddit.com/u/Thanksagainforlunch
