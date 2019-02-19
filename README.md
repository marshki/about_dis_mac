# About 'Dis Mac  

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/58a75e0d2563469f8a4a9ec4ad24df5d)](https://www.codacy.com/app/marshki/about_dis_mac?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=marshki/about_dis_mac&amp;utm_campaign=Badge_Grade)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/hyperium/hyper/master/LICENSE)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity)
[![Open Source Love svg3](https://badges.frapsoft.com/os/v3/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)

Bash shell script to mimic the "About This Mac" feature in OS X from a terminal.

Tested to run on OS X:

* 10.14 Mojave
* 10.13 High Sierra
* 10.12 Sierra
* 10.11 El Capitan
* 10.10 Yosemite 

GUI Output   | CLI Output
----------   | ----------
![Alt text](https://github.com/marshki/About-Dis-Mac/blob/master/docs/about_this.png "about_this_mac")   | ![Alt text](https://github.com/marshki/About-Dis-Mac/blob/master/docs/about_dis.png "about_dis_cli")

## Getting Started 

__Liftoff:__

**For everyone:**

You can run this script with: `bash about_dis_mac.sh`

**For sysadmins:**

Make this script accessible to all users by placing it in: `/`; 

create a symbolic link for it: 

`ln -s /about_dis_mac.sh /usr/bin/sysinfo`; 

set the executable bit on the file:

`chmod +x /about_dis_mac.sh`;   

then call it:

`aboutdismac`.  

 

## TODO:

- [ ] Invetigate what creates: ` ~/Library/Preferences/com.apple.SystemProfiler.plist` --> this isn't accessible on a fresh install, e.g. 
      Script will need to generate this first for the regexp to work. Update: it is the GUI "About this Mac" that creates this plist. 
      Need to trigger it somehow. 
