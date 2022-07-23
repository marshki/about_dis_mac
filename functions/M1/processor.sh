#!/usr/bin/env bash

# Retrieve processor information
# awk to extract Processor{Name,Speed}
# sort so numeric comes first
# xargs to print to single line

processor () {

  local cpu

  cpu=$(system_profiler SPHardwareDataType \
  | awk '/Chip:/{ sub(/^.*: /, ""); print; }'\
  | sort \
  | xargs)

  printf "%s\\n" "${cpu}"
}

processor
