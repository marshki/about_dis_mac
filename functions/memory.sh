#!/bin/bash

# Retrieve memory information 
# How can we print the output of both commands to a single line? 

awk_memory () { 

local ram 
ram=$(
awk '
  $1~/Size/ {size+=$2}
  $1~/Speed/ {speed=$2" "$3}
  $1~/Type/ {type=$2}
  END {print size " GB " speed " " type}
  ' <<< "$(system_profiler SPHardwareDataType; system_profiler SPMemoryDataType)"
)

printf "%s\\n" "${ram}"
}

awk_memory 
