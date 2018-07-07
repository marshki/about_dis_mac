#!/bin/bash
# Processor Speed & Name
# Is there a way to get awk to sort output to a single line? 

processor () {

  local cpu=$(system_profiler SPHardwareDataType |awk '/Processor (Speed|Name):/ { sub(/^.*: /, ""); print; }'|sort |xargs)

  #write_header "Processor"
  printf "%s\\n" "${cpu}"
  #printf "%s\\n" ""
} 

processor
