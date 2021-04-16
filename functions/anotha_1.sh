#!/usr/bin/env bash
# Production version

# Post-macOS 11.x.x.
# Extract fields 1 and 2 from macOS software version number,
# assign those fields to variables, 
# run a number check, and display corresponding marketing name.

# Lookup table

MACOS_MARKETING_NAMES=(
["10"]="Yosemite"
["11"]="El Capitan"
["12"]="Sierra"
["13"]="High Sierra"
["14"]="Mojave"
["15"]="Catalina"
["16"]="Big Sur"
)

parser() { 
  IFS=. read -r field_1 field_2 field_3 < <(sw_vers -productVersion)

  printf "%s\\n" "$field_1" "$field_2" "$field_3"
}

macOS_number () {

  local macOS_number

  if [[ "$field_1" -gt 10 ]]; then 
    local macOS_number=$((field_1 + 5))
    printf "%s\\n" "$macOS_number"

  else
    local macOS_number=$((field_2))
    printf "%s\\n" "$macOS_number"
  fi 

}

macOS_name () {

  local marketing_name

  if [[ -n "${MACOS_MARKETING_NAMES[$macOS_number]}" ]]; then
    local marketing_name
    marketing_name="${MACOS_MARKETING_NAMES[$macOS_number]}"
    printf "%s\\n" "$marketing_name"
fi
}

main () {
  parser
  macOS_number
  macOS_name
}

main "$@" 
