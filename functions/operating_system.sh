#!/bin/bash
# OS version 

operating_system () {
  local os=$(sw_vers -productVersion)

  #write_header "OS Version"
  printf "%s\\n" "${os}"
  #printf "%s\\n" ""
}

operating_system
