#!/usr/bin/env bash 

# Extract macOS version no.

macOS_version() {

  local long_version=$(sw_vers -productVersion)

  printf "%s\n" "Version" "$long_version"
}

macOS_version
