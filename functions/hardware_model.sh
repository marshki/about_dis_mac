#!/bin/bash
# Hardware model

hardware_model () {

  local hardware_mod=$(
  defaults read ~/Library/Preferences/com.apple.SystemProfiler.plist \
  'CPU Names' |cut -sd '"' -f 4 |uniq)

  #write_header "Hardware Model"
  printf "%s\\n" "${hardware_mod}"
  #printf "%s\\n" ""
}

hardware_model
