#!/usr/bin/env bash
# Production version.

# Extract hardware "marketing" model name.
# Read preference list, extracting 'CPU Names'
# then do `sed` vodo.
# Alternatively: sed -n 's/^.*" = "\(.*\)".*$/\1/p'

# `awk` should be able to do this cleanly, too.

hardware_model () {

  local hardware_mod

  hardware_mod=$(defaults read ~/Library/Preferences/com.apple.SystemProfiler.plist 'CPU Names' \
  | sed -E '/=/!d; s/.*= "//; s/".*//;')

  printf "%s\\n" "${hardware_mod}"
}

hardware_model
