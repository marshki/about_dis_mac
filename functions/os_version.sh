#!/bin/bash
# OS version 

operating_system () {
  local os=$(sw_vers -productVersion)

  printf "%s\\n" "${os}"
}

operating_system
