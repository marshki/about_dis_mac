#!/bin/bash
# Hardware model
# Read preference list, extracting 'CPU Names'
# cut suppress lines w/out delimiter characters, use '"' as delimiter
# print only unique string (no dupes)

hardware_model () {

  local hardware_mod
  hardware_mod=$(defaults read /Users/$LOGNAME/Library/Preferences/com.apple.SystemProfiler.plist \
  'CPU Names' | cut -sd '"' -f 4 | uniq)

  printf "%s\\n" "${hardware_mod}"
}

hardware_model
