#!/bin/bash 
# mjk 2017.02.04 
# Retrieve: marketing name, operating system version, hardware model, processor, memory, startupdisk, graphics, & serial number. 
# Useful for determining upgradeability of RAM 
# Possibly more   

### Display header message ###

function write_header(){ 
	local h="$@"			# make header specific to local variable 
	echo "--------------------" 
	echo "${h}" 			# insert local variable in to header 
	echo "--------------------"
} 

### Retrieve Apple's marketing name for operating system ### 
function marketing_name(){
        local marketing=$(grep -oE 'SOFTWARE LICENSE AGREEMENT FOR OS X.*[A-Z]' '/System/Library/CoreServices/Setup Assistant.app/Contents/Resources/en.lproj/OSXSoftwareLicense.rtf' | awk -F 'OS X ' '{print $NF}')

	write_header "Marketing Name" 
	echo "${marketing}"
	echo ""

### Retrieve operating system version ###

function operating_system(){
	local os=$(system_profiler SPSoftwareDataType |awk '/System Version/ {print $3,$4,$5,$6}')
	# Use system_profiler to poll info, then print 3rd-6th columns of System Version from SPSoftwareDataType

	write_header "OS Version" 
	echo "${os}"
	echo ""
} 

### Retrieve hardware model ###

function hardware_model(){
	local hardwaremod=$(system_profiler SPHardwareDataType | awk '/Model Identifier/ {print $3}')
	# Use system_profiler to poll info, then print 3rd column of Model Identifier from SPHardwareDataType 	

	write_header "Hardware Model"
	echo "${hardwaremod}"
	echo ""
} 

### Retrieve processor information ###

### Retrieve memory information ### 

### Retrieve startup disk information ### 

### Retrieve graphics information ### 


### Retrieve serial number ### 

function serial_number(){
	local serialnum=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}') 
	# Use system_profiler to poll info, then print 4th column of Serial from SPHardwareDataType  
	
	write_header "Serial Number" 
	echo "${serialnum}"
	echo ""	
} 

### Retrieve RAM profile ###

### Main logic ### 

main(){
	marketing_name
	operating_system 
	hardware_model
	serial_number 
}

main "$@" 
