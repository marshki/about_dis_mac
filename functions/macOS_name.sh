#!/usr/bin/env bash

# Prior to macOS 11.x.x, this was the go to function.

# Extract macOS software version number 
# then lookup number in array and display marketing number.

macOS_number=$(sw_vers -productVersion| awk -F '[.]' '{print $2}')

MACOS_MARKETING_NAME=(
["10"]="Yosemite"
["11"]="El Capitan"
["12"]="Sierra"
["13"]="High Sierra"
["14"]="Mojave"
["15"]="Catalina"
)

macOS_name () {

  if [[ -n "${MACOS_MARKETING_NAME[$macOS_number]}" ]]; then
    printf "%s\\n" "${MACOS_MARKETING_NAME[$macOS_number]}"
fi
}

macOS_name
