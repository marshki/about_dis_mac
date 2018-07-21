#!/bin/bash
# Lookup table for OS X marketing names 

OSX_MARKETING=(
["10"]="Yosemite"
["11"]="El Capitan"
["12"]="Sierra"
["13"]="High Sierra"
)

# Take the number extracted from here & use it as a reference,
# e.g. "12"
sw_vers -productVersion| awk -F '[.]' '{print $2}'

[[ -n "${OSX_MARKETING[12]}" ]] && printf "%s\\n" "${OSX_MARKETING[12]}"

#printf "%s\\n" ${OSX_MARKETING[*]}
