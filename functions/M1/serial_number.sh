#!/usr/bin/env bash

# Retrieve serial number.
# awk to extract `Serial` row, then field 4 from system_profiler SPHardwareType

serial_number () {

  local serialnum

  serialnum=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')

  printf "%s\n" "${serialnum}"
} 

serial_number

