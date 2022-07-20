#!/usr/bin/env bash

# Note: Intel, M1, post-macOS 11.x.x.

# Testing!!!

# RAM
# Extract size, speed, and type from SPmemoryDataType output
# Function expects no more than four (4) DIMMS.
# Feature request: accommodate more DIMMS.

awk_memory () { 

local ram 
ram=$(

awk '
  $1~/Memory/ && $2!~/Empty/ {Memory+=$2}
  END {print "Memory " Memory " GB"}
  ' <<< "$(system_profiler SPMemoryDataType)"
)
printf "%s\\n" "${ram}"
}

awk_memory 

# Memory 8 GB
