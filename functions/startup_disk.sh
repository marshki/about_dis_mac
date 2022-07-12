#!/usr/bin/env bash

# Retrieve startup disk information
# awk to extract third field
# sed to print string to the right of ':'
# awk to extract 'Mount Point'
# head to get primary drive

startup_disk () {
  local disk

  disk=$(system_profiler SPStorageDataType |awk 'FNR == 3 {print}'|sed 's/[[:blank:]:]*//g')

  local mount
  mount=$(system_profiler SPStorageDataType | awk '/Mount Point/ { sub(/^.*: /, ""); print; }')

  printf "%s\\n" "${disk}"
  printf "%s\\n" "${mount}"
}

startup_disk
