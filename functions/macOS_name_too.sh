#!/usr/bin/env bash
# Production version

# Post-macOS 11.x.x.
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
)

parser() { 

  read -r field_1 field_2 <<<"$(sw_vers -productVersion | awk -F '[.]' '{ print $1, $2 }')"
}

macOS_number () {

  if [[ "$field_1" -gt 10 ]]; then 
    macOS_number=$((field_1 + 5))
  else
    macOS_number=$((field_2))
  fi 
}

macOS_name () {

  if [[ -n "${MACOS_MARKETING_NAME[$macOS_number]}" ]]; then
    printf "%s\\n" "${MACOS_MARKETING_NAME[$macOS_number]}"
fi
}

main () {
parser
macOS_number
macOS_name
}

main "$@" 
