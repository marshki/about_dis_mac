#!/usr/bin/env bash 
#
# aboutMe (Cross-platform)
#
# CLI alternative to the macOS "About this Mac" feature.
#
# Author: M. Krinitz <mjk235 [at] nyu [dot] edu>
# Date: 2022.08.13
# License: MIT

# Lookup table.

MARKETING_NAME=(

["10"]="Yosemite"
["11"]="El Capitan"
["12"]="Sierra"
["13"]="High Sierra"
["14"]="Mojave"
["15"]="Catalina"
["16"]="Big Sur"
["17"]="Monterey"
["18"]="Ventura"
)

# Display header message.

write_header() {

  local name=$1; shift;

  printf "%s\\n""--------------------\\n$name%s\\n--------------------\\n"
  printf "%s\\n" "$@"
}

# Retrieve Apple's marketing name for installed operating system. 

parser() { 

  IFS=. read -r field_1 field_2 < <(sw_vers -productVersion)
}

macOS_number() {

  if [[ "$field_1" -gt 10 ]]; then 
    macOS_number=$((field_1 + 5))
  else
    macOS_number=$((field_2))
  fi 
}

macOS_name() {

  if [[ -n "${MARKETING_NAME[$macOS_number]}" ]]; then
    macOS_name=${MARKETING_NAME[$macOS_number]}
fi
    write_header "macOS" "$macOS_name"
}

macOS_name_wrapper() {

  parser
  macOS_number
  macOS_name
}

detect_system_architecture() { 

  if [[ $(uname -m) == 'arm64' ]]; then
    printf "%s\n" "M1 architecture"

  elif [[ $(uname -m) == 'x86_64' ]]; then
    printf "%s\n" "Intel architecture"

  else 
    printf "%s\n" "Unable to detect system architecture."
fi
}  
