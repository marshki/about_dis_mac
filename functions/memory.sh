#!/usr/bin/env bash

# RAM
# Extract size, speed, and type from SPmemoryDataType output
# Function expects no more than four (4) DIMMS.
# Feature request: accommodate more DIMMS.

awk_memory () {

local ram
ram=$(

awk '
  $1~/Size/ && $2!~/Empty/ {size+=$2}
  $1~/Speed/ && $2!~/Empty/ {speed=$2" "$3}
  $1~/Type/ && $2!~/Empty/ {type=$2}
  END {print size " GB " speed " " type}
  ' <<< "$(system_profiler SPMemoryDataType)"
)
printf "%s\\n" "${ram}"
}

awk_memory


#awk_memory () { 

#local ram 
#ram=$(

#awk '
#  $1~/Memory/ && $2!~/Empty/ {Memory+=$2}
#  END {print "Memory " Memory " GB"}
#  ' <<< "$(system_profiler SPMemoryDataType)"
#)
#printf "%s\\n" "${ram}"
#}

#awk_memory 

#Memory 8 GB
