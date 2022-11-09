#!/usr/local/bin/env bash
# Alt approach to retrieve hardware model
# if preference list from other function is not present.


hardware_model_type () {
  local hardware_model

  hardware_model=$(system_profiler SPHardwareDataType \
    | awk '/Model Identifier:/{ sub(/^.*: /, ""); print; }')

  printf "%s\\n" "${hardware_model}"

} 

hardware_model_type
