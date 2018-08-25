#!/bin/bash
# Retrieve memory information 

gpu () { 

local gpu 
gpu=$(
awk '
  $2~/Model/ {metal=$3" "$4" "$5" "$6" "$7}
  END {print metal}
  ' <<< "$(system_profiler SPDisplaysDataType)"
)

printf "%s\\n" "${gpu}"
}

gpu 
