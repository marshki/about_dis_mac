#!/bin/bash
# Lookup table for OS X marketing names 

-a OSX_MARKETING=(
["10"]="Yosemite"
["11"]="El Capitan"
["12"]="Sierra"
["13"]="High Sierra"
)


operating_system () {

  local os=$(sw_vers -productVersion)

  write_header "OS Version" "$os"
}

if "10" in OSX_MARKETING
