#!/usr/bin/env bash

# Alternative to 'hardware_model.sh' in this directory,
# returns slighlty different hardware 'marketing' name.

# Adapted from this thread:
# https://www.reddit.com/r/macsysadmin/comments/bmycmz/submission_about_this_mac_command_line_edition/
# Shout-out to: https://reddit.com/u/Thanksagainforlunch

# Use plist buddy to extract marketing model name from .plist
# The full path of the .plist file varies by version of macOS
# Here we use: shopt -s extglob, and: @(English|en).lproj
# so that we can catch either "English" or "en".

hardware_model () {

  shopt -s extglob

  local hardware_model

  hardware_model=$(/usr/libexec/PlistBuddy -c "print :$(sysctl -n hw.model):_LOCALIZABLE_:marketingModel"\
  /System/Library/PrivateFrameworks/ServerInformation.framework/Versions/A/Resources/@(English|en).lproj/SIMachineAttributes.plist)

  printf "%s\n" "$hardware_model"
}

hardware_model
