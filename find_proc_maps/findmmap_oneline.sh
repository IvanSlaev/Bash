#!/bin/bash

######################################################################
# Process maps
######################################################################
# Find names of processes which maps the first pos par
######################################################################


adb root

start=$(date +%s.%N)
EOF=','
for var in $(adb shell 'ps' | awk '{ print $2","$9 }') ; do
    pid=$( echo $var | cut -d',' -f1 )

    name=$( echo $var | cut -d',' -f2 )

    [[ `adb shell grep $1 /proc/$pid/maps` ]] && echo $name 
done


#while read var ; do
 #   pid=$( echo $var | cut -d' ' -f1 )
  #  name=$( echo $var | cut -d' ' -f2 )
   # [[ `adb shell "cat /proc/$pid/maps" | grep $1` ]] && echo $name 
#done < buffer_file_unique_name

end=$(date +%s.%N)

runtime=$(echo "$end - $start" | bc)
echo $runtime	
