#!/bin/bash
# mjk 2017.08.15
# CLI-based alternative to OS X's "About this Mac" feature
# Retrieve system info on: OS X "marketing" name, OS version,
# hardware model, processor, memory, startup disk, graphics, & serial number.

### Display header message ###

function write_header () {
	local h="$@"			# make header specific to local variable
	printf "%s\n" "--------------------"
	printf "%s\n" "${h}" 			# insert local variable in to header
	printf "%s\n" "--------------------"
}

### Retrieve Apple's marketing name for installed operating system ###
### Extract end of regex following match with either OS X or macOS ###
### from OSXSoftwareLicense.rtf 																	 ###

function osx_name () {

	local marketing=$(sed -nE 's/SOFTWARE LICENSE AGREEMENT FOR (OS X|macOS) ([A-Za-z ]+).*/\2/p'\
	'/System/Library/CoreServices/Setup Assistant.app/Contents/Resources/en.lproj/OSXSoftwareLicense.rtf')

  write_header "OS X Name"
  printf "%s\n" "${marketing}"
  printf "%s\n" ""
}

### Retrieve operating system version 					###
### Use system_vers to retrieve product version ###

function operating_system () {

	local os=$(sw_vers -productVersion)

	write_header "OS Version"
	printf "%s\n" "${os}"
	printf "%s\n" ""
}

### Retrieve hardware model 																 ###
### Extract 'CPU Names' from com.apple.SystemProfiler.plist, ###
### then parse content, leaving only string inside of "" 		 ###

function hardware_model () {

	local hardware_mod=$(defaults read ~/Library/Preferences/com.apple.SystemProfiler.plist 'CPU Names' |cut -sd '"' -f 4 |uniq)

	# This info is also useful, even if it isn't provided in the GUI "About this Mac feature"
	# system_profiler SPHardwareDataType |grep --extended-regexp 'Model Identifier: '|sed 's/^.*: //'

	write_header "Hardware Model"
	printf "%s\n" "${hardware_mod}"
	printf "%s\n" ""
}

### Retrieve processor information 																					 ###
### Use system_profiler to poll info, then regexp to print string following  ###
### 'Processor Name: ' & 'Processor Speed: ' from SPHardwareDataType 				 ###

function processor () {

	local cpu=$(system_profiler SPHardwareDataType |grep --extended-regexp 'Processor Name: '\|'Processor Speed: '|sed 's/^.*: //')

	write_header "Processor"
	printf "%s\n" "${cpu}"
	printf "%s\n" ""
}

 # system_profiler SPHardwareDataType   | awk '/Processor (Name|Speed):/ { sub(/^.*: /, ""); print; }'

### Retrieve memory information ###
### Use system_profiler to poll info, then regexp to print string following 'Memory: ' from SPHardwareDataType ###
### Use system_profiler to poll info, then regexp to print first two lines of strings following 'Type: ' & 'Speed: ' from SPMemoryDataType ###

function memory () {

	local ram=$(system_profiler SPHardwareDataType |grep --extended-regexp 'Memory: ' |sed 's/^.*: //')
	local type=$(system_profiler SPMemoryDataType |grep --extended-regexp 'Type: '\|'Speed: '|sed 's/^.*: //'|head -2)

	write_header "Memory"
	printf "%s\n" "${ram}"
	printf "%s\n" "${type}"
	printf "%s\n" ""
}

### Retrieve startup disk information ###
### Use system_profiler to poll info, then regexp to print name of primary storage disk, removing leading and trailing whitespace ###
### Use system_profiler to poll info, then regexp to print mount point of primary storage disk, should be: `/` ###

function startup_disk () {

	local disk=$(system_profiler SPStorageDataType|awk 'c&&c!--c;/Storage:/{c=2}'|sed 's/[[:blank:]:]*//g'|tail -1)
	local mount=$(system_profiler SPStorageDataType |grep --extended-regexp 'Mount Point: '|sed 's/^.*: //'|head -1)

	write_header "Startup Disk"
	printf "%s\n" "${disk}"
	printf "%s\n" "${mount}"
	printf "%s\n" ""
}

### Retrieve graphics information ###
### Use system_profiler to poll info, then regexp to print first two lines of strings following 'Chipset Model: ' & 'VRAM (Dynamic, Max): ' from SPDisplaysDataType ###

function graphics () {

	local gpu=$(system_profiler SPDisplaysDataType |grep --extended-regexp 'Chipset Model: '\|'VRAM \(Dynamic, Max\): '|sed 's/^.*: //'|head -2)

	write_header "Graphics"
	printf "%s\n" "${gpu}"
	printf "%s\n" ""
}

### Retrieve serial number ###
### Use system_profiler to poll info, then regexp to print string following 'Serial Number (system): ' from SPHardwareDataType ###

function serial_number () {

	local serialnum=$(system_profiler SPHardwareDataType |grep --extended-regexp 'Serial Number \(system\): '|sed 's/^.*: //')

	write_header "Serial Number"
	printf "%s\n" "${serialnum}"
	printf "%s\n" ""
}

### Main logic ###
### Las entranas del programa ###

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
