#!/bin/bash

startup_disk () {
  local disk=$(system_profiler SPStorageDataType |awk 'FNR == 3 {print}'|sed 's/[[:blank:]:]*//g')
  local mount=$(system_profiler SPStorageDataType | awk '/Mount Point/ { sub(/^.*: /, ""); print; }')

  #write_header "Startup Disk"
  printf "%s\\n" "${disk}"
  printf "%s\\n" "${mount}"
  #printf "%s\\n" ""
}

startup_disk
