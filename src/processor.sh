system_profiler SPHardwareDataType \
  | sed -n -e '/Processor Name/{;s/.*: //;h;}' \
           -e '/Processor Speed/{;s/.*: //;G;s/\n/ /;p;q;}'
