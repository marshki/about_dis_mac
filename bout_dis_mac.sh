#!/bin/bash 
#mjk 2017.08.04 
#Text-based alternative to OS X's "About this Mac" 
#Retrieve's system info on: OS X "marketing" name, OS version, hardware model, processor, memory, startup disk, graphics, & serial number. 

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
	#local os=$(system_profiler SPSoftwareDataType |awk '/System Version/ {print $3,$4,$5,$6}')
	local os=$(system_profiler SPSoftwareDataType |sed -n '/System Version: /p')
	
	write_header "OS Version" 
	echo "${os}"
	echo ""
} 

### Retrieve hardware model ###
### Use system_profiler to poll info, then print 3rd column of Model Identifier from SPHardwareDataType ### 

function hardware_model(){
	#local hardware_mod=$(system_profiler SPHardwareDataType |awk '/Model Identifier/ {print $3}')
	local hardware_mod=$(system_profiler SPHardwareDataType |sed -n '/Model Identifier: /p')
	
	write_header "Hardware Model"
	echo "${hardware_mod}"
	echo ""
} 

### Retrieve processor information ###
### Use system_profiler to poll info, then print 3rd-5th columns of Processor Name, Processor Speed from SPHardwareDataType ###

function processor(){ 
	#local cpu=$(system_profiler SPHardwareDataType |awk '/Processor Name|Processor Speed/ {print $3,$4,$5}')
	# Have to combine two regexp pattern matches in sed --> local cpu=$(system_profiler SPHardwareDataType |sed -e 's/Processor Name: /;'s/Processor Speed: /" /p')
	# Or usee grep, but print text after match --> system_profiler SPHardwareDataType |grep -E 'Processor Name: '\|'Processor Speed: '
	write_header "Processor"
	echo "${cpu}"
	echo "" 
} 

### Retrieve memory information ### 
### Use system_profiler to poll info, then print 2nd-3rd column of Memory from SPHardwareDataType ### 
#TODO: Get bus speed and RAM type 
# Something like this: 
# system_profiler SPMemoryDataType |awk '/Type|Speed/ {print $2}'

function memory (){
	local ram=$(system_profiler SPHardwareDataType |awk '/Memory/ {print $2,$3}')
	local type=$(system_profiler SPMemoryDataType |awk '/Type/ {print $2}')
#This needs to be fixed -->	local type=$(awk -F: '$1=="Speed"{print $2;exit;}' system_profiler SPMemoryDataType) 
	
	
	
	write_header "Memory" 
	echo "${ram}"
	echo "${type}"
	echo ""
} 

### Retrieve startup disk information ### 
### ### 

function startup_disk(){
	#local disk=$()
	
	# Here's where disk info is coming from: 
	# system_profiler SPStorageDataType 

	write_header "Startup Disk" 
	echo "${disk}"
	echo ""
}

### Retrieve graphics information ###
### Use system_profiler to poll info, then print 3rd-5th columns of Chipset, VRAM from SPDisplaysDataType ### 

function graphics(){
	local gpu=$(system_profiler SPDisplaysDataType |awk '/Chipset|VRAM/ {print $3,$4,$5,$6}')	
	
	write_header "Graphics"
	echo "${gpu}"
	echo ""	
}

### Retrieve serial number ### 
### Use system_profiler to poll info, then print 4th column of Serial from SPHardwareDataType ###  

function serial_number(){
	local serialnum=$(system_profiler SPHardwareDataType |awk '/Serial/ {print $4}') 
	
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
