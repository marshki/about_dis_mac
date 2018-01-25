#!/bin/bash
# Run as root

# Retrieve Matlab installer, unpack, install, and sym link

# Root user check
# Disk space check
#

MATLAB_INSTALLER="http://localweb.cns.nyu.edu/unixadmin/mat-distro-12-2014/linux/matlab9.3.tgz"

MATLAB_LICENSES="http://localweb.cns.nyu.edu/unixadmin/mat-distro-12-2014/linux/licenses.zip"

function get_matlab(){
  printf "%s\n" "------------------------------"
  curl --progress-bar --retry 3 --retry-delay 5 "$MATLAB_INSTALLER" --output matlab.tgz
}

function untar_matlab(){
  printf "%s\n" "------------------------------"
  tar --extract --gzip --file=matlab.tgz --directory=/usr/local
}

function symlink_matlab(){}
  printf "%s\n" "------------------------------"
  ln --symbolic /usr/local/matlab9.3/bin/matlab /usr/local/bin/matlab9.3
}

function confirm_matlab(){
  printf "%s\n" "------------------------------"
}

function launch_matlab(){
  printf "%s\n" "------------------------------"
  matlab
}
