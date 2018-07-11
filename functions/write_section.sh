#!/bin/bash 
# Funtion to take values and print header 

write_section() {
  local name=$1; shift;
  printf "%s\\n" "$name"
  #printf "-----\\n%s\\n-----\\n" "$name" # <-- FIX ME! -->
  printf "%s\\n" "$@"
  printf "\\n"
}

operating_system () {
  local os=$(sw_vers -productVersion)
  
  write_section "OS Version" "$os" 
}

serial_number () {
  local serialnum=$(system_profiler SPHardwareDataType \
  | awk '/Serial/ { sub(/^.*: /, ""); print; }')
 
  write_section "Serial Number" "$serialnum"  
  }

main () {
  operating_system
  serial_number
}

main "$@"
