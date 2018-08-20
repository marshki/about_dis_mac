#!/bin/bash
# OS version 

operating_system () {
  os=$(sw_vers -productVersion)
  export os 

  #write_header "OS Version"
  printf "%s\\n" "${os}"
  #printf "%s\\n" ""
}

operating_system
