#!/usr/bin/env bash 

# Funtion to take values and print header. 
# OS and SN are for illustrative purposes only.

write_header() {
  local name=$1; shift;
  printf "%s\\n""--------------------\\n$name%s\\n--------------------\\n"
  printf "%s\\n" "$@"
}

operating_system () {
  local os=$(sw_vers -productVersion)
  
  write_header "OS Version" "$os" 
}

serial_number () {
  local serialnum=$(system_profiler SPHardwareDataType \
  | awk '/Serial/ { sub(/^.*: /, ""); print; }')
 
  write_header "Serial Number" "$serialnum"  
}

main () {
  operating_system
  serial_number
}

main "$@"
