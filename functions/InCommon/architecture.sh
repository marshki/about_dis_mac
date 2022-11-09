#!/usr/bin/env bash 

# Detect system architecture (x86_64, Apple Silicon).

architecture() { 

  if [[ $(uname -m) == 'arm64' ]]; then
    printf "%s\n" "Apple Silicon architecture"

  elif [[ $(uname -m) == 'x86_64' ]]; then
    printf "%s\n" "Intel architecture"

  else 
    printf "%s\n" "Unable to detect system architecture."
fi
}

architecture
