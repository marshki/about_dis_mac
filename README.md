# about_dis_mac

Bash shell script to mimic the "About This Mac" feature in OS X from a terminal.

GUI Output   | CLI Output
----------   | ----------
![Alt text](https://github.com/marshki/About-Dis-Mac/blob/master/docs/about_this.png "about_this_mac")   | ![Alt text](https://github.com/marshki/About-Dis-Mac/blob/master/docs/about_dis.png "about_dis_cli")

Tested on OS X:

* 10.13 High Sierra
* 10.12 Sierra
* 10.11 El Capitan
* 10.10 Yosemite

# TODO:

- [ ] Invetigate what creates: ` ~/Library/Preferences/com.apple.SystemProfiler.plist` --> this isn't accessible on a fresh install, e.g. 
      Script will need to generate this first for the regexp to work. Update: it is the GUI "About this Mac" that creates this plist. 
      Need to trigger it somehow. 
- [ ] Test on 10.14 Mojave 
- [x] Create a lookup table of OS X Versions/Names  (e.g. 10.12 --> Sierra) rather than iextract via regexp (Apple moved stuff).  
- [x] Code review and general clean up, esp. regexp (`awk` can do a lot on its own, e.g.)
