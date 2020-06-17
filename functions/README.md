### NOTES TO SELF 
---

This script frequently calls macOS's system_profiler to poll a data type, 
e.g.: `system_profiler SP_Some_DataType \ 
| awk '/string_to_extract/{ sub(/^.*: /, ""); print; }'`
where the output of the profiler is piped to `awk`;
a search string is extracted;
and characters to the right of `:` are printed. 

---

The output of this preference list ('plist'): 
`com.apple.SystemProfiler.plist` 
is parsed in the `hardware_model.sh` function located in the `PWD`

To trigger this list, one needs to click on the "About This Mac" GUI in macOS,
(at least as far as I can tell). If that triggering event has not happened,
you'll receive an error re: the plist not being found.   

If there's a way to trigger this from a terminal, it should be part of the
script, else there should be a check for the file which if not found, calls the function in hardware_model_too.sh 

For reference:
`hardware_mod=$(defaults read ~/Library/Preferences/com.apple.SystemProfiler.plist \)`
