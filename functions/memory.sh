#!/bin/bash
# RAM 

awk_memory () { 

local ram 
ram=$(

awk '
  $1~/Size/ && $2!~/Empty/ {size+=$2}
  $1~/Speed/ && $2!~/Empty/ {speed=$2" "$3}
  $1~/Type/ && $2!~/Empty/ {type=$2}
  END {print size " GB " speed " " type}
  ' <<< "$(system_profiler SPHardwareDataType; system_profiler SPMemoryDataType)"
)

printf "%s\\n" "${ram}"
}

awk_memory 
