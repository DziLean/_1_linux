#!/bin/bash

exec 2> error8.txt
IFS=$'\n'
let count=0;
for i in $(find "$1" -type f)
do
   let "count=count+1"
   readlink -f -n $i
   ls -l "$i"| awk '{print "  ", $1,"  ", $5}'
done

echo $count;

 sed -i "s,find,$(basename $0 -a)," /dev/stderr
 cat /dev/stderr > error8.txt

