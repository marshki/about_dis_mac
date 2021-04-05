#!/usr/bin/env bash

# Extract macOS software version number. 
# then lookup number in array and display marketing number.

macOS_version=$(sw_vers -productVersion)
printf "%s\\n" "$macOS_version"

read -r field_1 field_2 <<<"$(sw_vers -productVersion | awk -F '[.]' '{ print $1, $2 }')"
printf "%s\\n" "$field_1" "$field_2"

if [[ "$field_1" -gt 10 ]]; then 
  macOS_version=$(($field_1 + 5))

else
  macOS_version="$(field_2)"
  printf "%s\\n" "$macOS_version"
fi  

printf "%s\\n" "$macOS_version"

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
