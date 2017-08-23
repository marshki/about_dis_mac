#!/bin/bash 
#mjk 2017.08.04 
#Text-based alternative to OS X's "About this Mac" 
#Retrieve's system info on: OS X name, OS Version, Hardware Model, Processor, memory, startupdisk, graphics, & serial number. 

### Display header message ###

function write_header(){ 
	local h="$@"			# make header specific to local variable 
	echo "--------------------" 
	echo "${h}" 			# insert local variable in to header 
	echo "--------------------"
} 

### Retrieve Apple's marketing name for operating system ### 
### grep OSXSoftwareLicense.rtf to find pattern match, then awk to find match starting with, & print last column ###    

function OS_X_name(){
        local marketing=$(grep --only-matching --extended-regexp 'SOFTWARE LICENSE AGREEMENT FOR OS X.*[A-Z]'\
        '/System/Library/CoreServices/Setup Assistant.app/Contents/Resources/en.lproj/OSXSoftwareLicense.rtf'\
        | awk -F 'OS X ' '{print $NF}')
	
        write_header "OS X Name"
        echo "${marketing}"
        echo ""
}

### Retrieve operating system version ###
### Use system_profiler to poll info, then print 3rd-6th columns of System Version from SPSoftwareDataType ###

function operating_system(){
	local os=$(system_profiler SPSoftwareDataType |awk '/System Version/ {print $3,$4,$5,$6}')
	
	write_header "OS Version" 
	echo "${os}"
	echo ""
} 

### Retrieve hardware model ###
### Use system_profiler to poll info, then print 3rd column of Model Identifier from SPHardwareDataType ### 

function hardware_model(){
	local hardwaremod=$(system_profiler SPHardwareDataType | awk '/Model Identifier/ {print $3}')

	write_header "Hardware Model"
	echo "${hardwaremod}"
	echo ""
} 

### Retrieve processor information ###
### Use system_profiler to poll info, then print 3rd-5th columns of Processor Name, Processor Speed from SPHardwareDataType ###

function processor(){ 
	local cpu=$(system_profiler SPHardwareDataType |awk '/Processor Name|Processor Speed/ {print $3,$4,$5}')

	write_header "Processor"
	echo "${cpu}"
	echo "" 
} 

### Retrieve memory information ### 
### Use system_profiler to poll info, then print 2nd-3rd column of Memory from SPHardwareDataType ### 

function memory (){
	local ram=$(system_profiler SPHardwareDataType |awk '/Memory/ {print $2,$3}')

	write_header "Memory" 
	echo "${ram}"
	echo ""
} 

### Retrieve startup disk information ### 

### Retrieve graphics information ### 

### Retrieve serial number ### 
### Use system_profiler to poll info, then print 4th column of Serial from SPHardwareDataType ###  

function serial_number(){
	local serialnum=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}') 
	
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
	serial_number 
}

main "$@" 
