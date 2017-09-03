#!/bin/bash 
#mjk 2017.08.04 
#Text-based alternative to OS X's "About this Mac" 
#Retrieve system info on: OS X "marketing" name, OS version, hardware model, processor, memory, startup disk, graphics, & serial number. 

### Display header message ###

function write_header(){ 
	local h="$@"			# make header specific to local variable 
	echo "--------------------" 
	echo "${h}" 			# insert local variable in to header 
	echo "--------------------"
} 

### Retrieve Apple's marketing name for installed operating system ### 
### grep OSXSoftwareLicense.rtf for 'SOFTWARE...', then awk to find match starting with 'OS X', & print last column ###    

function OS_X_name(){
        local marketing=$(grep --only-matching --extended-regexp 'SOFTWARE LICENSE AGREEMENT FOR OS X.*[A-Z]'\
        '/System/Library/CoreServices/Setup Assistant.app/Contents/Resources/en.lproj/OSXSoftwareLicense.rtf'\
        | awk -F 'OS X ' '{print $NF}')
	
        write_header "OS X Name"
        echo "${marketing}"
        echo ""
}

### Retrieve operating system version ###
### Use system_profiler to poll info, then regexp to print string following 'System Version:  ' from SPSoftwareDataType ###

function operating_system(){
	local os=$(system_profiler SPSoftwareDataType |grep --extended-regexp 'System Version: '|sed 's/^.*: //')	
	
	write_header "OS Version" 
	echo "${os}"
	echo ""
} 

### Retrieve hardware model ###
### Use system_profiler to poll info, then regexp to print string following 'Model Identifier: ' from SPHardwareDataType ### 

function hardware_model(){
	local hardware_mod=$(system_profiler SPHardwareDataType |grep --extended-regexp 'Model Identifier: '|sed 's/^.*: //')
		
	write_header "Hardware Model"
	echo "${hardware_mod}"
	echo ""
} 

### Retrieve processor information ###
### Use system_profiler to poll info, then regexp to print string following 'Processor Name: ' & 'Processor Speed: ' from SPHardwareDataType ###

function processor(){ 
	local cpu=$(system_profiler SPHardwareDataType |grep --extended-regexp 'Processor Name: '\|'Processor Speed: '|sed 's/^.*: //')
	
	write_header "Processor"
	echo "${cpu}"
	echo "" 
} 

### Retrieve memory information ### 
### Use system_profiler to poll info, then regexp to print string following 'Memory: ' from SPHardwareDataType ### 
### Use system_profiler to poll info, then regexp to print first two lines of strings following 'Type: ' & 'Speed: ' from SPMemoryDataType ### 

function memory (){
	local ram=$(system_profiler SPHardwareDataType |grep --extended-regexp 'Memory: ' |sed 's/^.*: //')
	local type=$(system_profiler SPMemoryDataType |grep --extended-regexp 'Type: '\|'Speed: '|sed 's/^.*: //'|head -2) 	
	
	write_header "Memory" 
	echo "${ram}"
	echo "${type}"
	echo ""
} 

### Retrieve startup disk information ### 
### ### 

function startup_disk(){
	#local disk=$(system_profiler SPStorageDataType |grep --extended-regexp 'Storage:')
	
	local disk=$(system_profiler SPStorageDataType|awk 'c&&c!--c;/Storage:/{c=2}'|sed 's/^.*: //')			#<-- needs more parsing
	local mount=$(system_profiler SPStorageDataType |grep --extended-regexp 'Mount Point: '|sed 's/^.*: //')
	
	write_header "Startup Disk" 
	echo "${disk}"
	echo "${mount}"
	echo ""
}

### Retrieve graphics information ###
### Use system_profiler to poll info, then regexp to print first two lines of strings following 'Chipset Model: ' & 'VRAM (Dynamic, Max): ' from SPDisplaysDataType ### 

function graphics(){
	local gpu=$(system_profiler SPDisplaysDataType |grep --extended-regexp 'Chipset Model: '\|'VRAM \(Dynamic, Max\): '|sed 's/^.*: //'|head -2)
	
	write_header "Graphics"
	echo "${gpu}"
	echo ""	
}

### Retrieve serial number ### 
### Use system_profiler to poll info, then regexp to print string following 'Serial Number (system): ' from SPHardwareDataType ###  

function serial_number(){
	local serialnum=$(system_profiler SPHardwareDataType |grep --extended-regexp 'Serial Number \(system\): '|sed 's/^.*: //') 
	
	write_header "Serial Number" 
	echo "${serialnum}"
	echo ""	
} 

### Main logic ### 
### The guts of el programa ### 

main(){
	OS_X_name
	operating_system 
	hardware_model
	processor
	memory
	startup_disk
	graphics
	serial_number 
}

main "$@" 
