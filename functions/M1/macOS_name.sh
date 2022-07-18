!/usr/bin/env bash
# Dev version

# Note: Post-macOS 11.x.x.
# Extract field 1 from macOS software version number,
# assign field to variable,
# run a number check, and display corresponding marketing name.

# Lookup table

MACOS_MARKETING_NAME=(

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

# Parse and assign to eponymous variable.

parser() {

 parser=$(sw_vers -productVersion |awk -F '.' '{ print $1 }')

} 

# If macOS_number in array, assign macOS_name to corresponding marketing name.

macOS_name () {

  if [[ -n "${MACOS_MARKETING_NAME[$parser]}" ]]; then
    macOS_name=${MACOS_MARKETING_NAME[$parser]}
fi
    write_header "macOS" "$macOS_name"
}

# Wrapper.

main () {
  parser
  macOS_name
}

main "$@"
