#!/usr/bin/env bash

# Still WIP.

# Extract RAM info.
# Extract Memory from SPmemoryDataType output.
# Function expects no more than four (4) DIMMS.

memory () {

local ram=$(
awk '
  $1~/Size/ && $2!~/Empty/ {size+=$2}
  END {print size " GB " }
  ' <<< "$(system_profiler SPMemoryDataType)"
  )

printf "%s\\n" "${ram}"
}

memory


# system_profiler SPMemoryDataType |awk -F ' ' /Memory:/
# system_profiler SPMemoryDataType |awk 'FNR ==3'
