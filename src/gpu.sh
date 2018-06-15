#!/bin/bash 

#system_profiler SPDisplaysDataType 

system_profiler SPDisplayDataType \
  | sed -n -e '/Chipset Model/{;s/.*: //;h;}' \
           -e '/VRAM/{;s/.*: //;G;s/\n/ /;p;q;}'

# |grep --extended-regexp 'Chipset Model: '\|'VRAM \(Dynamic, Max\): '|sed 's/^.*: //'|head -2

