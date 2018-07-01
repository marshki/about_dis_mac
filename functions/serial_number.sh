#!/bin/bash
# Serial number 

serial_number () {

  #local serialnum=$(system_profiler SPHardwareDataType |grep --extended-regexp 'Serial Number \(system\): '|sed 's/^.*: //')
  local serialnum=$(system_profiler SPHardwareDataType| awk '/Serial/ {print $4}')

  #write_header "Serial Number"
  printf "%s\\n" "${serialnum}"
  #printf "%s\\n" ""
}

serial_number
