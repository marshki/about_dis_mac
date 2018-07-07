#!/bin/bash

### Retrieve memory information ###

memory () {
  local ram=$(system_profiler SPHardwareDataType | awk '/Memory/ { sub(/^.*: /, ""); print; }')
  local type=$(system_profiler SPMemoryDataType |awk '/Type/'|sed 's/^.*: //')

  #system_profiler SPHardwareDataType   | awk '/Processor (Speed|Name):/ { sub(/^.*: /, ""); print; }q'
  #local type=$(system_profiler SPMemoryDataType |grep --extended-regexp 'Type: '\|'Speed: '|sed 's/^.*: //'|head -2)

    #write_header "Memory"
    printf "%s\\n" "${ram}"
    printf "%s\\n" "${type}"
    #printf "%s\\n" ""
} 

memory
