#!/bin/sh

# bash gnuplot_script/shock_v.sh work_seminar1/45kw_01atm/output_main/
start=$2

sout=10000
press0=760

threshold=1E15
directry=$1


file1=$(printf "%s%05d.dat" $directry $start)

#ion front
p1ion=$(cat $file1 | awk -F',' '$3>1E18{print $1;exit}')

p1ion=$(echo $p1ion | sed 's/^0*//')

p1ion=$(echo $p1ion | sed 's/,//')

printf "%s\n" $p1ion