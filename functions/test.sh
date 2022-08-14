#!/usr/bin/env bash
#
# aboutMe (cross-platform)
#
# CLI alternative to the macOS "About this Mac" feature.
#
# Author: M. Krinitz <mjk235 [at] nyu [dot] edu>
# Date: 2022.08.13
# License: MIT

# Lookup table.

RELEASE_NAME=(

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

# Display header message.

write_header() {

  local name=$1; shift;

  printf "%s\\n""--------------------\\n$name%s\\n--------------------\\n"
  printf "%s\\n" "$@"
}

# Retrieve Apple's "release" name for installed operating system.
# Parse fields -> Assign macOS release number -> Assign macOS release name.

parser() { 

  IFS=. read -r field_1 field_2 < <(sw_vers -productVersion)
}

macOS_release_number() {

  if [[ "$field_1" -gt 10 ]]; then 
    macOS_release_number=$((field_1 + 5))
  else
    macOS_release_number=$((field_2))
  fi 
}

macOS_release_name() {

  if [[ -n "${RELEASE_NAME[$macOS_release_number]}" ]]; then
    macOS_name=${RELEASE_NAME[$macOS_release_number]}
fi
    write_header "macOS" "$macOS_name"
}

# Wrapper.

release_name_wrapper() {

  parser
  macOS_release_number
  macOS_release_name
}

release_name_wrapper

# Version.

macOS_version() {

  local long_version

  long_version=$(sw_vers -productVersion)

  write_header "Version" "$long_version"
}

# Hardware_model.

hardware_model() {

  local hardware_mod

  hardware_mod=$(defaults read ~/Library/Preferences/com.apple.SystemProfiler.plist 'CPU Names' \
    | sed -E '/=/!d; s/.*= "//; s/".*//;')

  "write_header" "$hardware_mod"
}

# Intel processor.

processor() {

  local cpu

  cpu=$(system_profiler SPHardwareDataType \
  | awk '/Processor (Name|Speed):/ { sub(/^.*: /, ""); print; }'\
  | sort \
  | xargs)

  "write_header" "$write_header"
}

# M1 processor.

processor() {

  local cpu

  cpu=$(system_profiler SPHardwareDataType \
    | awk '/Chip:/{ sub(/^.*: /, ""); print; }')  

  "write_header" "$cpu"
} 

# Intel memory.

awk_memory() {

local ram

ram=$(

awk '
  $1~/Size/ && $2!~/Empty/ {size+=$2}
  $1~/Speed/ && $2!~/Empty/ {speed=$2" "$3}
  $1~/Type/ && $2!~/Empty/ {type=$2}
  END {print size " GB " speed " " type}
  ' <<< "$(system_profiler SPMemoryDataType)"
)
  write_header "$ram"
}

# M1 memory.

memory() {
  local ram 

ram=$(
awk '
  $1~/Memory/ && $2!~/Empty/ {size+=$2}
  END {print size " GB " }
  ' <<< "$(system_profiler SPMemoryDataType)"
  )

  write_header "$ram"
}

# Startup disk.

startup_disk() {

  local disk

  disk=$(system_profiler SPStorageDataType \
   |awk 'FNR == 3 {print}' |sed 's/[[:blank:]:]*//g')
  
  write_header "$disk"
}

# Graphics.

graphics() {

  local gpu    

  gpu=$(system_profiler SPDisplaysDataType 2>/dev/null \
    | awk '/(Model|Max\)|Total\)):/ { sub(/^.*: /, ""); print; }' \
    | xargs)

  write_header "$gpu"
}

# Serial number.

serial_number() {

  local serialnum

  serialnum=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')

  write_header "$serialnum"
}

# Intel wrapper.

Intel_wrapper() {

}

# M1 wrapper.

M1_wrapper() {

} 

# Note: rename processor, memory functions to reflect alt. arch.

detect_system_architecture() { 

  if [[ $(uname -m) == 'arm64' ]]; then
    printf "%s\n" "M1 architecture"

  elif [[ $(uname -m) == 'x86_64' ]]; then
    printf "%s\n" "Intel architecture"

  else 
    printf "%s\n" "Unable to detect system architecture."
fi
}  
