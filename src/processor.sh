#!/bin/bash
# Get CPU Name, Speed

function processor () {
	local cpu=$(system_profiler SPHardwareDataType| sed -n -e '/Processor Name/{;s/.*: //;h;}' -e '/Processor Speed/{;s/.*: //;G;s/\n/ /;p;q;}')
	printf "%s\n" "${cpu}"
}

processor
