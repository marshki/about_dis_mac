#!/usr/local/bin/env bash

hardware_model_type () {
  local hardware_model

  hardware_model=$(system_profiler SPHardwareDataType \
    | awk '/Model Identifier:/{ sub(/^.*: /, ""); print; }')

  printf "%s\\n" "${hardware_model}"

} 

hardware_model_type
