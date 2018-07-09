#!/bin/bash
# Hardware model
# On some test installs OS X didn't have "com.apple.SystemProfiler.plist" -->
# What generates this preference list? 

hardware_model () {

  local hardware_mod=$(defaults read ~/Library/Preferences/com.apple.SystemProfiler.plist \
  'CPU Names' | cut -sd '"' -f 4 | uniq)

  printf "%s\\n" "${hardware_mod}"
}

hardware_model
