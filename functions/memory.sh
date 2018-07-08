#!/bin/bash

### Retrieve memory information ###
# How can we print the output of both commands to a single line? 

memory () {
  local ram=$(system_profiler SPHardwareDataType | awk '/Memory/{ sub(/^.*: /, ""); print; }')
  local type=$(system_profiler SPMemoryDataType | awk '/(Type|Speed):/ { sub(/^.*: /, ""); print; }'|head -2|xargs)
  
  #write_header "Memory"
  printf "%s\\n" "${ram}"
  printf "%s\\n" "${type}"
  #printf "%s\\n" ""
} 

memory
