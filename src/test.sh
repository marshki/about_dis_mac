#!/bin/bash

# fresh and clean!
# new and improved! 

device_id () {

  d_id="$(system_profiler SPHardwareDataType \ |awk '/Identifier/{ sub(/^.*: /, ""); print; }')"
  printf "%s\n" "$d_id" 
} 

hardware_model () { 
  
  d_id="$(system_profiler SPHardwareDataType \ |awk '/Identifier/{ sub(/^.*: /, ""); print; }')"

  hardware_mod="$(/usr/libexec/PlistBuddy -c "Print $d_id" \
  /System/Library/PrivateFrameworks/ServerInformation.framework/Versions/A/Resources/English.lproj/SIMachineAttributes.plist \
  |awk '/marketingModel/{ sub(/^.*= /, ""); print; }')" 
   
  printf "%s\n" "$hardware_mod" 
} 

#device_id 
hardware_model

#Get the marketing model name from the plist!
#Bash script written quickly and poorly by https://reddit.com/u/Thanksagainforlunch
