#!/bin/bash 
# mjk 2017.02.04 
# Retrieve operating system, serial number, hardware model, and RAM profile in OS X. 
# Useful for determining upgradeability of RAM 

### Display header message ###

function write_header(){ 
	local h="$@"			# make header specific to local variable 
	echo "--------------------" 
	echo "${h}" 			# insert local variable in to header 
	echo "--------------------"
} 

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

### Retrieve serial number ### 

function serial_number(){
	local serialnum=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}') 
	# Use system_profiler to poll info, then print 4th column of Serial from SPHardwareDataType  
	
	write_header "Serial Number" 
	echo "${serialnum}"
	echo ""	
} 

### Retrieve RAM profile ###

function ram_profile(){
	local onboardram=$(system_profiler SPMemoryDataType)  	
	# Use system_profiler to poll info, then print output 

	write_header "RAM Profile"
	echo "${onboardram}" 
	echo "" 
}

### Main logic ### 

main(){
	operating_system 
	hardware_model
	serial_number 
	ram_profile	
}

main "$@" 
