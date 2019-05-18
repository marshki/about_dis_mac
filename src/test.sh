#!/bin/bash
#Get the marketing model name from the plist!
#Bash script written quickly and poorly by https://reddit.com/u/Thanksagainforlunch

device_id () {

  d_id="$(system_profiler SPHardwareDataType \ |awk '/Identifier/{ sub(/^.*: /, ""); print; }')"
  printf "%s\n" "$d_id" 
} 

hardware_model () { 

  hardware_mod="$(/usr/libexec/PlistBuddy -c "Print $d_id" /System/Library/PrivateFrameworks/ServerInformation.framework/Versions/A/Resources/English.lproj/SIMachineAttributes.plist |awk '/marketingModel/{ sub(/^.*= /, ""); print; }')" 
   
  printf "%s\n" "$hardware_mod" 
} 

device_id 
hardware_model

#hardware_model 
#uglymodel="$(system_profiler SPHardwareDataType | grep Identifier | awk -F: '{print $2}' | tr -d '[:space:]')"
#/usr/libexec/PlistBuddy -c "Print $uglymodel" /System/Library/PrivateFrameworks/ServerInformation.framework/Versions/A/Resources/English.lproj/SIMachineAttributes.plist | awk -F= '/marketingModel/ {print $2}' | awk '{gsub(/^ +| +$/,"")} {print $0}'
