#!/usr/bin/env bash
#
# aboutMe
#
# CLI alternative to the macOS "About this Mac" feature.
#
# Author: M. Krinitz <mjk235 [at] nyu [dot] edu>
# Date: 2021.04.22
# License: MIT

# Lookup table. 

MARKETING_NAME=(

["16"]="Big Sur"
["17"]="Monterey"
)

# Display header message.

write_header() {

  local name=$1; shift;

  printf "%s\\n""--------------------\\n$name%s\\n--------------------\\n"
  printf "%s\\n" "$@"
}

# Retrieve Apple's marketing name for installed operating system. 

parser() { 

  IFS=. read -r field_1 field_2 field_3 < <(sw_vers -productVersion)
}

macOS_number () {

  if [[ "$field_1" -gt 10 ]]; then 
    macOS_number=$((field_1 + 5))
  else
    macOS_number=$((field_2))
  fi 
}

macOS_name () {

  if [[ -n "${MARKETING_NAME[$macOS_number]}" ]]; then
    macOS_name=${MARKETING_NAME[$macOS_number]}
fi
    write_header "macOS" "$macOS_name"
}

macOS_name_wrapper () {

  parser
  macOS_number
  macOS_name
}
