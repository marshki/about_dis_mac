#!/bin/bash
# Serial number 

serial_number () {
  local serialnum
  serialnum=$(system_profiler SPHardwareDataType | awk '/Serial/ { sub(/^.*: /, ""); print; }')
  
  printf "%s\\n" "${serialnum}"
}

serial_number
