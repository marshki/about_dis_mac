#!/bin/bash
#Model and VRAM
# VRAM(Total):
# VRAM(Dynamic, Max):
 
graphics () {

  local gpu=$(system_profiler SPDisplaysDataType | awk '/(Model|Max\)|Total\)):/ { sub(/^.*: /, ""); print; }'| xargs)
  #write_header "Processor"
  printf "%s\\n" "${gpu}"
  #printf "%s\\n" ""
} 

graphics
