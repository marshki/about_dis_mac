#!/bin/bash
# A lot to do on this!!!


let upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
let secs=$((${upSeconds}%60))
let mins=$((${upSeconds}/60%60))
let hours=$((${upSeconds}/3600%24))
let days=$((${upSeconds}/86400))
UPTIME=`printf "%d days, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs"`

MEMFREE=`cat /proc/meminfo | grep MemFree | awk {'print $2'}`
MEMTOTAL=`cat /proc/meminfo | grep MemTotal | awk {'print $2'}`

SDUSED=`df -h | grep 'dev/root' | awk '{print $3}'  | xargs`
SDAVAIL=`df -h | grep 'dev/root' | awk '{print $4}'  | xargs`

# get the load averages
read one five fifteen rest < /proc/loadavg

DARKGREY="$(tput sgr0 ; tput bold ; tput setaf 0)"
RED="$(tput sgr0 ; tput setaf 1)"
GREEN="$(tput sgr0 ; tput setaf 2)"
BLUE="$(tput sgr0 ; tput setaf 4)"
NC="$(tput sgr0)" # No Color

echo "${GREEN}
   .~~.   .~~.    `hostname -f`
  '. \ ' ' / .'   `date +"%A, %e %B %Y, %r"`${RED}
   .~ .~~~..~.
  : .~.'~'.~. :   ${DARKGREY}Uptime.............: ${BLUE}${UPTIME}${RED}
 ~ (   ) (   ) ~  ${DARKGREY}Memory.............: ${BLUE}${MEMFREE}kB (Free) / ${MEMTOTAL}kB (Total)${RED}
( : '~'.~.'~' : ) ${DARKGREY}Disk usage.........: ${BLUE}${SDUSED} (Used) / ${SDAVAIL} (Free)${RED}
 ~ .~ (   ) ~. ~  ${DARKGREY}Load Averages......: ${BLUE}${one}, ${five}, ${fifteen} (1, 5, 15 min)${RED}
  (  : '~' :  )   ${DARKGREY}Running Processes..: ${BLUE}`ps ax | wc -l | tr -d " "`${RED}
   '~ .~~~. ~'    ${DARKGREY}IP Addresses.......: ${BLUE}`hostname -I`${RED}
       '~'
${NC}"
