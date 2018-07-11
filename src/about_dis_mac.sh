#!/bin/bash
# mjk 2018.07.09

######################################################################
#   Command line alternative to OS X's "About this Mac" feature.     #
#   Retrieve information about: OS X "marketing" name; 		     #
#   OS version number; hardware model; processor; memory;	     #
#   startup disk; graphics; and serial number .			     #
######################################################################

# TODO: 
# Re-work `osx_name` using, possibly, an array.
# Refactoring where appropriate. 


#### Display header message ####

write_header () {
  local h="$@"			          # make header specific to local variable
  printf "%s\\n" "--------------------"
  printf "%s\\n" "${h}" 		  # insert local variable in to header
  printf "%s\\n" "--------------------"
}

#### Retrieve Apple's marketing name for installed operating system. #####
#### Extract end of regex following match with either OS X or macOS  ####
#### from OSXSoftwareLicense.rtf.:wq                                 ####

osx_name () {

  local marketing=$(
    sed -nE 's/SOFTWARE LICENSE AGREEMENT FOR (OS X|macOS) ([A-Za-z ]+).*/\2/p' \
    '/System/Library/CoreServices/Setup Assistant.app/Contents/Resources/en.lproj/OSXSoftwareLicense.rtf')

  write_header "OS X Name"
  printf "%s\\n" "${marketing}"
  printf "%s\\n" ""
}

#### Retrieve operating system version ####		

operating_system () {

  local os=$(sw_vers -productVersion)

  write_header "OS Version"
  printf "%s\\n" "${os}"
  printf "%s\\n" ""
}

##### Retrieve hardware model				       ####
##### Extract 'CPU Names' from com.apple.SystemProfiler.plist; ####
##### extract string inside quotes ("); 		       ####
##### print 4th field        				       ####

hardware_model () {

  local hardware_mod=$(defaults read ~/Library/Preferences/com.apple.SystemProfiler.plist \
  'CPU Names' |cut -sd '"' -f 4 |uniq)

  write_header "Hardware Model"
  printf "%s\\n" "${hardware_mod}"
  printf "%s\\n" ""
}

#### Retrieve processor information        ####
#### Use system_profiler to poll info; 	   ####
#### awk to extract 'Processor Name/Speed; ####
#### print characters to the right of `:`  ####

processor () {

local cpu=$(system_profiler SPHardwareDataType | awk '/Processor (Name|Speed):/ { sub(/^.*: /, ""); print; }'\
  | sort | xargs)

  write_header "Processor"
  printf "%s\\n" "${cpu}"
  printf "%s\\n" ""
}

#### Retrieve memory information 	  ####
#### Use system_profiler to poll info;    ####
#### awk to extract 'Memory';  		  ####
#### print characters to the right of `:` #### 
#### Use system_profiler to poll info;    ####
#### awk to extract 'Type' & 'Speed';     ####
#### print characters to the right of `:` ####
#### take top 2 lines; output to one line ####


memory () {

  local ram=$(system_profiler SPHardwareDataType | awk '/Memory/{ sub(/^.*: /, ""); print; }')
  local type=$(system_profiler SPMemoryDataType | awk '/(Type|Speed):/ { sub(/^.*: /, ""); print; }'|head -2|xargs)

  write_header "Memory"
  printf "%s\\n" "${ram}"
  printf "%s\\n" "${type}"
  printf "%s\\n" ""
}

#### Retrieve startup disk information 	     ####
#### Use system_profiler to poll info;       ####
#### awk to extract third field;  	     ####
#### sed to print string to the right of ':' ####
#### Use system_profiler to poll info;	     #### 
#### awk to extract 'Mount Point; 	     ####
#### print characters to the right of `:`    ####

startup_disk () {

  local disk=$(system_profiler SPStorageDataType |awk 'FNR == 3 {print}'|sed 's/[[:blank:]:]*//g')
  local mount=$(system_profiler SPStorageDataType | awk '/Mount Point/ { sub(/^.*: /, ""); print; }')

  write_header "Startup Disk"
  printf "%s\\n" "${disk}"
  printf "%s\\n" "${mount}"
  printf "%s\\n" ""
}

#### Retrieve graphics information 			             ####
#### Use system_profiler to poll info; 			 	     ####
#### awk to extract 'Model', 'Max', 'Total' from SPDisplaysDataType; ####
#### print characters to the right of `:`			     ####

graphics () {

  local gpu=$(system_profiler SPDisplaysDataType \
  | awk '/(Model|Max\)|Total\)):/ { sub(/^.*: /, ""); print; }' \
  | xargs)  

  write_header "Graphics"
  printf "%s\\n" "${gpu}"
  printf "%s\\n" ""
}

#### Retrieve serial number 	          ####
#### Use system_profiler to poll info; 	  ####
#### awk to extract 'Serial' 	          ####
#### print characters to the right of `:` ####

serial_number () {

	local serialnum=$(system_profiler SPHardwareDataType | awk '/Serial/ { sub(/^.*: /, ""); print; }')

	write_header "Serial Number"
	printf "%s\\n" "${serialnum}"
	printf "%s\\n" ""
}

#### Main logic ####
#### Las entranas del programa ####

main () {

	osx_name
	operating_system
	hardware_model
	processor
	memory
	startup_disk
	graphics
	serial_number

}

main "$@"
