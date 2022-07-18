#!/usr/bin/env bash 

# Note: two (2) strings can be extracted from this function 
# to simplify the code base.
# e.g.: 
# 11.6.7 (OS)
# 11 (for marketing name) 

# OS version 

operating_system () {
  local os 
  os=$(sw_vers -productVersion)

  printf "%s\\n" "${os}"
}

operating_system
