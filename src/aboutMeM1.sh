#!/usr/bin/env bash
#
# aboutMe
#
# CLI alternative to the macOS "About This Mac" (M1)
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

# Wrapper function.

macOS_name_wrapper() {

  parse_version
  macOS_release_name
}

# macOS version info.

macOS_version() {

  local long_version
  
  long_version=$(sw_vers -productVersion)

  write_header "Version" "$long_version"
}

# Hardware model info.

hardware_model() {

  local hardware_mod

  hardware_mod=$(defaults read ~/Library/Preferences/com.apple.SystemProfiler.plist 'CPU Names' \
    | sed -E '/=/!d; s/.*= "//; s/".*//;')

  write_header "Hardware Model" "$hardware_mod"
}

processor() {

  local cpu

  cpu=$(system_profiler SPHardwareDataType \
    | awk '/Chip:/{ sub(/^.*: /, ""); print; }')

  write_header "Chip" "$cpu"

}

# Memory info.

memory() { 

  local ram

  ram=$(
  awk '
    $1~/Memory/ && $2!~/Empty/ {size+=$2}
    END {print size ' GB'}
    ' <<< "$(system_profiler SPMemoryDataType)"
  )

  write_header "Memory" "$ram"

}

# Startup disk info. 

startup_disk() {

  local disk

  disk=$(system_profiler SPStorageDataType |awk 'FNR == 3 {print}'|sed 's/[[:blank:]:]*//g')
  
  write_header "Startup disk" "$disk"
}

# Serial number.

serial_number() {

  local serialnum

  serialnum=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')

  write_header "Serial Number" "$serialnum"
} 

# Las entranas del programa.

main() {

  macOS_name_wrapper
  macOS_version
  hardware_model
  processor
  memory
  startup_disk
  serial_number
}

main "$@"
