#!/usr/bin/env bash

# Retrieve serial number 
# awk to extract `Serial` 

serial_number () { 

local serialnum 

serialnum=$(

awk '
  $1~/Serial/ {serial=$4}
  END {print serial}
  ' <<< "$(system_profiler SPHardwareDataType)"
)

printf "%s\\n" "${serialnum}"
}

serial_number
