# About 'Dis Mac  
---

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/58a75e0d2563469f8a4a9ec4ad24df5d)](https://www.codacy.com/app/marshki/about_dis_mac?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=marshki/about_dis_mac&amp;utm_campaign=Badge_Grade)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity)
[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/hyperium/hyper/master/LICENSE)
[![Open Source Love svg3](https://badges.frapsoft.com/os/v3/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)

Bash shell script to mimic the "About This Mac" feature in macOS.

Tested to run on macOS:

* 11.1  Big Sur
* 10.15 Catalina
* 10.14 Mojave
* 10.13 High Sierra
* 10.12 Sierra
* 10.11 El Capitan
* 10.10 Yosemite 

GUI Output   | CLI Output
----------   | ----------
![Alt text](https://github.com/marshki/about_dis_mac/blob/master/docs/catalina_gui.png "about_this_mac") | ![Alt text](https://github.com/marshki/about_dis_mac/blob/master/docs/catalina_cli.png "about_dis_cli")

## Getting Started 

__Liftoff:__

Make this script accessible to all users by placing it in: `/usr/local/bin`; 

set the executable bit on the file:

`chmod +x aboutMe.sh`;   

then call it:

`bash aboutMe.sh`.  

## Acknowledgements

`hardware_model_too.sh` adpated from [this thread](https://www.reddit.com/r/macsysadmin/comments/bmycmz/submission_about_this_mac_command_line_edition/). 
 
Shout-out to: [https://reddit.com/u/Thanksagainforlunch](https://reddit.com/u/Thanksagainforlunch) for the suggestion.  
