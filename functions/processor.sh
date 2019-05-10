#!/bin/bash
# Retrieve processor information 
# awk to extract Processor{Name,Speed}
# sort so numeric comes first
# xargs to print to single line

awk_memory () { 

local cpu 
cpu=$(

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








processor () {
  local cpu 
  cpu=$(system_profiler SPHardwareDataType | awk '/Processor (Speed|Name):/ { sub(/^.*: /, ""); print; }'\
  | sort | xargs)

  printf "%s\\n" "${cpu}"
} 

processor
