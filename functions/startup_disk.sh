#!/bin/bash
# Can `disk` be done purely `awk`? 
# Output of both functions on single line? Does 'ATM' show both? Do we need `Mount Point`?   
 
startup_disk () {
  local disk  
  disk=$(system_profiler SPStorageDataType |awk 'FNR == 3 {print}'|sed 's/[[:blank:]:]*//g')
  
  local mount  
  mount=$(system_profiler SPStorageDataType | awk '/Mount Point/ { sub(/^.*: /, ""); print; }')

  printf "%s\\n" "${disk}"
  printf "%s\\n" "${mount}"
}

startup_disk
