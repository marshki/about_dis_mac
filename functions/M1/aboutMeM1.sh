#!/usr/bin/env bash
#
# aboutMe
#
# CLI alternative to the macOS "About This Mac" (M1 & ↑)
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

  if [[ -n "${RELEASE_NAME[$short_version]}" ]]; then
    local macOS_release_name=${RELEASE_NAME[$short_version]}
fi
    write_header "macOS" "$macOS_release_name"
}

macOS_name_wrapper() {

  parse_version
  macOS_release_name
}

# macOS Version No.

macOS_version () { 

  local long_version=$(sw_vers -productVersion) 

  write_header "Version" "$long_version"
}

hardware_model () {

  local hardware_mod=$(defaults read ~/Library/Preferences/com.apple.SystemProfiler.plist 'CPU Names' \
  | sed -E '/=/!d; s/.*= "//; s/".*//;')

  write_header "Hardware Model" "$hardware_mod"
}

# Las entranas del programa.

main () {

  macOS_name_wrapper
  macOS_version
  hardware_model
}

main "$@"
