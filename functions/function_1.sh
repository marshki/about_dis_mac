#!/bin/bash
# Lookup table for OS X marketing names 

OSX_MARKETING=(
["10"]="Yosemite"
["11"]="El Capitan"
["12"]="Sierra"
["13"]="High Sierra"
)

[[ -n "${OSX_MARKETING[10]}" ]] && printf '%s is in array\n' "10"

#printf "%s\\n" ${OSX_MARKETING[*]}

