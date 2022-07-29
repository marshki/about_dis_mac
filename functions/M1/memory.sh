#!/usr/bin/env bash

# Note: Intel, M1, post-macOS 11.x.x.

# Extract RAM info.
# Extract size, speed, and type from SPmemoryDataType output.
# Function expects no more than four (4) DIMMS.

memory () { 

local ram=$(
awk '
  $1~/Size/ && $2!~/Empty/ {size+=$2}
  $1~/Speed/ && $2!~/Empty/ {speed=$2" "$3}
  $1~/Type/ && $2!~/Empty/ {type=$2}
  END {print size " GB " speed " " type}
  ' <<< "$(system_profiler SPMemoryDataType)"
)
printf "%s\\n" "${ram}"
}

memory
