#!/usr/bin/env bash

# Retrieve graphics information
# awk to extract 'Model', 'Max', 'Total'
# xargs to print output to single line

# In macOS 10.10, 10.11 --> VRAM(Total):
# In macOS 10.12, 10.13 --> VRAM(Dynamic, Max):
# regexp for `awk` should match Model AND either Max OR Total

graphics () {

  local gpu    

  gpu=$(system_profiler SPDisplaysDataType 2>/dev/null \
    | awk '/(Model|Max\)|Total\)):/ { sub(/^.*: /, ""); print; }' \
    | xargs)

  printf "%s\\n" "${gpu}"
}

graphics
