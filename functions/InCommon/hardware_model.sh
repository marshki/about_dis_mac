#!/usr/bin/env bash

# Extract hardware "marketing" model name.
# Read preference list, extracting 'CPU Names'
# then do `sed` vodo.
# Alternatively: sed -n 's/^.*" = "\(.*\)".*$/\1/p'

# Preference list did not appear in some Apple Silicon-based machines
# may need to look here: system_profiler SPHardwareDataType as an alternative. 
# Of possible interest: 
# https://apple.stackexchange.com/questions/98080/can-a-macs-model-year-be-determined-with-a-terminal-command

hardware_model () {

  local hardware_mod

  hardware_mod=$(defaults read ~/Library/Preferences/com.apple.SystemProfiler.plist 'CPU Names' \
    | sed -E '/=/!d; s/.*= "//; s/".*//;')

  printf "%s\\n" "${hardware_mod}"
}

hardware_model
