#!/bin/bash

######################################################################
# Process maps
######################################################################
# Find names of processes which maps the first pos par
######################################################################

start=$(date +%s.%N)

adb root
for pid in `adb shell "ls /proc/" | grep '^[0-9]' | tr '\r' ' '` ; do 
	[[ `adb shell grep $1 /proc/$pid/maps` ]] && echo `adb shell cat /proc/$pid/comm`; 
done

end=$(date +%s.%N)

runtime=$(echo "$end - $start" | bc)
echo $runtime	
