#!/usr/bin/env bash
#
# aboutMe
#
# CLI alternative to the macOS "About This Mac" feature.
#
# Author: M. Krinitz <mjk235 [at] nyu [dot] edu>
# Date: 2022.07.25
# License: MIT

# Lookup table. 

MARKETING_NAME=(

["11"]="Big Sur"
["12"]="Monterey"
["13"]="Ventura"
)

# Display header message.

write_header() {

  local name=$1; shift;

  printf "%s\\n""--------------------\\n$name%s\\n--------------------\\n"
  printf "%s\\n" "$@"
}

# Parse product version and assign to eponymous variable.

parse_version() {

 version=$(sw_vers -productVersion |awk -F '.' '{ print $1 }')

} 

# If $version in array, assign macOS_name to corresponding marketing name.

macOS_name () {

  if [[ -n "${MARKETING_NAME[$version]}" ]]; then
    macOS_name=${MARKETING_NAME[$version]}
fi
    write_header "macOS" "$macOS_name"
}

macOS_name_wrapper () {
  parse_version
  macOS_name
}

macOS_name_wrapper
