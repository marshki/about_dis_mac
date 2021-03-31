#!/usr/bin/env bash

# Extract macOS software version number 
# then lookup number in array and display marketing number.

# Old: 
# macOS_number=$(sw_vers -productVersion | awk -F '[.]' '{print $1, $2}') 
#printf "%s\\n" "$macOS_number"

# New:
field_1=$(sw_vers -productVersion | awk -F '[.]' '{print $1}')
field_2=$(sw_vers -productVersion | awk -F '[.]' '{print $2}')

printf "%s\\n" "$field_1" "$field_2"

# One way to deal with this: 
# extract field 1 and assign; extract field 2 and assign 
# if field #1 > 10
#   version = field #1 + 5 
# else 
#   version = field #2

# Lookup table

MACOS_MARKETING_NAME=(
["10"]="Yosemite"
["11"]="El Capitan"
["12"]="Sierra"
["13"]="High Sierra"
["14"]="Mojave"
["15"]="Catalina"
["16"]="Big Sur"
)

macOS_name () {

  if [[ -n "${MACOS_MARKETING_NAME[$macOS_number]}" ]]; then
    printf "%s\\n" "${MACOS_MARKETING_NAME[$macOS_number]}"
fi
}

#macOS_name
