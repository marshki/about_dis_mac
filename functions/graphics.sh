#!/bin/bash
#Model and VRAM

graphics () {

  local gpu=$(system_profiler SPDisplaysDataType | awk '/(Model|Max\)):/ { sub(/^.*: /, ""); print; }'| xargs)
  #write_header "Processor"
  printf "%s\\n" "${gpu}"
  #printf "%s\\n" ""
} 

graphics
