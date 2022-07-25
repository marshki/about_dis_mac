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

# Parse 'short' product version and assign to variable.

short_version() {

 short_version=$(sw_vers -productVersion |awk -F '.' '{ print $1 }')

}

# If $short_version in array, assign macOS_name to corresponding marketing name.

macOS_name () {

  if [[ -n "${MARKETING_NAME[$short_version]}" ]]; then
    macOS_name=${MARKETING_NAME[$short_version]}
fi
    write_header "macOS" "$macOS_name"
}

macOS_name_wrapper () {
  short_version
  macOS_name
}

macOS_name_wrapper
