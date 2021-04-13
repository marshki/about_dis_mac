#!/usr/bin/env bash

# Retrieve serial number 
# Pipe info from system_profiler 
# awk to extract `Serial` row, then field 4. 

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
