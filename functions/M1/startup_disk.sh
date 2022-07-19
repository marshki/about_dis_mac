#!/usr/bin/env bash

# Note: Intel, M1, post-macOS 11.x.x.

# Retrieve startup disk information
# awk to extract third field
# sed to print string to the right of ':'
# awk to extract 'Mount Point'
# head to get primary drive

startup_disk () {
  local disk  

  disk=$(system_profiler SPStorageDataType |awk 'FNR == 3 {print}'|sed 's/[[:blank:]:]*//g')
  
  printf "%s\\n" "${disk}"
}

startup_disk
