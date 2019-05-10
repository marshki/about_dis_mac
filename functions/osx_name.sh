#!/bin/bash
# Apple's marketing name for installed operating system 

# Take the number extracted from here (in between the "."s; use it as a reference

osx_num=$(sw_vers -productVersion| awk -F '[.]' '{print $2}')

# Lookup table for OS X marketing names 

OSX_MARKETING=(
["10"]="Yosemite"
["11"]="El Capitan"
["12"]="Sierra"
["13"]="High Sierra"
["14"]="Mojave"
)

# Check if the number extracted is in array; 
# if it is, print marketing name
 
osx_name () {
  if [[ -n "${OSX_MARKETING[$osx_num]}" ]]; then 
    printf "%s\\n" "${OSX_MARKETING[$osx_num]}"
fi
}

osx_name
