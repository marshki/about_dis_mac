#!/usr/bin/env bash
# Production version

# Notes: Post-macOS 11.x.x. Intel, M1 chips.

# Extract fields 1 and 2 from macOS software version number,
# assign those fields to variables,
# run a number check, and display corresponding marketing name.

# Lookup table

MACOS_MARKETING_NAME=(

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

# Parse field 1, field 2, and assign to eponymous variables.

parser() {

  IFS=. read -r field_1 field_2 < <(sw_vers -productVersion)
}

# If field_1 greater than 10, add five (5) to variable
# else use field_2.

macOS_number () {

  if [[ "$field_1" -gt 10 ]]; then
    macOS_number=$((field_1 + 5))
  else
    macOS_number=$((field_2))
  fi
}

# If macOS_number in array, assign macOS_name to corresponding marketing name.

macOS_name () {

  if [[ -n "${MACOS_MARKETING_NAME[$macOS_number]}" ]]; then
    macOS_name=${MACOS_MARKETING_NAME[$macOS_number]}
fi
    printf "%s\n" "macOS" "$macOS_name"
}

# Wrapper.

main () {
  parser
  macOS_number
  macOS_name
}

main "$@"
