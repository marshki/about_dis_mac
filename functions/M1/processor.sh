#!/usr/bin/env bash

# Retrieve processor information.
# awk to extract string, strip string to right of: 'Chip:' 

processor () {

  local cpu=$(system_profiler SPHardwareDataType \
  | awk '/Chip:/{ sub(/^.*: /, ""); print; }')  

  printf "%s\\n" "${cpu}"
} 

processor

# Note to self: 
# awk '/Chip/ || /Cores/ { sub(/^.*: /, ""); print; }'\
