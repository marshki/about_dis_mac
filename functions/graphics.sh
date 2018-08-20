#!/bin/bash
# Model and VRAM
# In OS X 10.10, 10.11 --> VRAM(Total):
# In OS X 10.12, 10.13 --> VRAM(Dynamic, Max):
# regexp for `awk` should match Model AND either Max OR Total
  
graphics () {

  local gpu 
  gpu=$(system_profiler SPDisplaysDataType \
  | awk '/(Model|Max\)|Total\)):/ { sub(/^.*: /, ""); print; }' \
  | xargs)
  
  printf "%s\\n" "${gpu}"
} 

graphics
