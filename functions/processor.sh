#!/bin/bash
# Processor Speed & Name

processor () {
  local cpu 
  cpu=$(system_profiler SPHardwareDataType | awk '/Processor (Speed|Name):/ { sub(/^.*: /, ""); print; }'\
  | sort | xargs)

  printf "%s\\n" "${cpu}"
} 

processor
