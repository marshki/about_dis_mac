#!/bin/bash 
function marketing_name(){
	local marketing=$(grep -oE 'SOFTWARE LICENSE AGREEMENT FOR OS X.*[A-Z]' '/System/Library/CoreServices/Setup Assistant.app/Contents/Resources/en.lproj/OSXSoftwareLicense.rtf' | awk -F 'OS X ' '{print $NF}')

	echo "${marketing}" 
} 

marketing_name
