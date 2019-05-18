#!/bin/bash
#Get the marketing model name from the plist!
#Bash script written quickly and poorly by https://reddit.com/u/Thanksagainforlunch

uglymodel="$(system_profiler SPHardwareDataType | grep Identifier | awk -F: '{print $2}' | tr -d '[:space:]')"

/usr/libexec/PlistBuddy -c "Print $uglymodel" /System/Library/PrivateFrameworks/ServerInformation.framework/Versions/A/Resources/English.lproj/SIMachineAttributes.plist | awk -F= '/marketingModel/ {print $2}' | awk '{gsub(/^ +| +$/,"")} {print $0}'
