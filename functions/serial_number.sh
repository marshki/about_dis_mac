#!/bin/bash
# Serial number 

serial_number () {
  local serialnum=$(system_profiler SPHardwareDataType | awk '/Serial/ { sub(/^.*: /, ""); print; }')
  
  #write_header "Serial Number"
  printf "%s\\n" "${serialnum}"
  #printf "%s\\n" ""
}

serial_number
