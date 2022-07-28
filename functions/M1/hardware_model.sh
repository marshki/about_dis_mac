#!/usr/bin/env bash

# Extract hardware "marketing" model name.
# Read preference list, extracting 'CPU Names'
# then do `sed` vodo.
# Alternatively: sed -n 's/^.*" = "\(.*\)".*$/\1/p'

hardware_model () {

  local hardware_mod=$(defaults read ~/Library/Preferences/com.apple.SystemProfiler.plist 'CPU Names' \
  | sed -E '/=/!d; s/.*= "//; s/".*//;')

  printf "%s\\n" "${hardware_mod}"
}

hardware_model
