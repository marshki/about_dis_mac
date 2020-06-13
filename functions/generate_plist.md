### NOTE TO SELF 
---

The output of this preference list ('plist'): 
`com.apple.SystemProfiler.plist` 
is parsed in the `hardware_model.sh` function located in the `PWD`

To trigger this list, one needs to click on the "About This Mac" GUI in macOS,
(at least as far as I can tell). If that triggering event has not happened,
you'll receive an error re: the plist not being found.   

If there's a way to trigger this from a terminal, it should be part of the
script, else there should be check for the file which if not found, throws
a warning.

For reference:
`hardware_mod=$(defaults read ~/Library/Preferences/com.apple.SystemProfiler.plist \)`
