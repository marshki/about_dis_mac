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

RELEASE_NAME=(

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

parse_version() {

  short_version=$(sw_vers -productVersion |awk -F '.' '{ print $1 }')
}

# If $short_version in table, assign macOS_name to corresponding marketing name.

macOS_release_name() {

  local macOS_release_name

  if [[ -n "${RELEASE_NAME[$short_version]}" ]]; then
    macOS_release_name=${RELEASE_NAME[$short_version]}
fi
    write_header "macOS" "$macOS_release_name"
}

# macOS Version No.

macOS_version () { 

  local long_version

  long_version=$(sw_vers -productVersion) 
  write_header "Version" "$long_version"
}

macOS_name_wrapper() {
  parse_version
  macOS_release_name
}
 
