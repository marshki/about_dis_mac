#!/usr/bin/env bash

# Retrieve startup disk information
# awk to extract third field
# sed to print string to the right of ':'

startup_disk () {

  local disk

  disk=$(system_profiler SPStorageDataType \
   |awk 'FNR == 3 {print}' |sed 's/[[:blank:]:]*//g')
  
  printf "%s\\n" "${disk}"
}

startup_disk
