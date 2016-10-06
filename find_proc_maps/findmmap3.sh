#!/bin/bash

######################################################################
# Process maps
######################################################################
# Find names of processes which maps the first pos par
######################################################################


adb root
start=$(date +%s.%N)	
for var in $(adb shell 'ps' | awk '{ print $2","$9 }' | tail -n +2 -) ; do
    pid=$( echo $var | cut -d',' -f1 )
    name=$( echo $var | cut -d',' -f2 )
    [[ `adb shell grep $1 /proc/$pid/maps` ]] && echo $name 
done

end=$(date +%s.%N)

runtime=$(echo "$end - $start" | bc)
echo $runtime	
