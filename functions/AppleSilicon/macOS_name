#!/usr/bin/env bash

# Notes: Post-macOS 11.x.x. M1 chips.

# Extract field 1 from macOS software version number,
# assign field to variable,
# run a number check, and display corresponding marketing name.

RELEASE_NAME=(

["11"]="Big Sur"
["12"]="Monterey"
["13"]="Ventura"
)

# Parse 'short' product version and assign to variable.

parse_version() {

  short_version=$(sw_vers -productVersion |awk -F '.' '{ print $1 }')
}

# If $short_version in table, assign macOS_name to corresponding marketing name.

macOS_release_name() {

  if [[ -n "${RELEASE_NAME[$short_version]}" ]]; then
    local macOS_release_name=${RELEASE_NAME[$short_version]}
fi

    printf "%s\n" "macOS" "$macOS_release_name"
}

# Wrapper function.

macOS_name_wrapper() {

  parse_version
  macOS_release_name
}

macOS_name_wrapper "$@"
