#!/bin/bash


SCRIPT_PATH="`dirname \"$0\"`"
LINE_LENGTH=31



stringarray=($1)

for i in "${stringarray[@]}"
do
	futureString="$newString $i"
	
	if [ ${#futureString} -ge $LINE_LENGTH ]; then
		sentences+="${newString:1};"
		newString="";
	fi

	newString="$newString $i"
done

sentences+="${newString:1};"




IFS=""

line1=`echo $sentences | awk -F ";" '{ print $1 }'`
line1=`printf "%-${LINE_LENGTH}s" $line1`

line2=`echo $sentences | awk -F ";" '{ print $2 }'`
line2=`printf "%-${LINE_LENGTH}s" $line2`

line3=`echo $sentences | awk -F ";" '{ print $3 }'`
line3=`printf "%-${LINE_LENGTH}s" $line3`

line4=`echo $sentences | awk -F ";" '{ print $4 }'`
line4=`printf "%-${LINE_LENGTH}s" $line4`





cat $SCRIPT_PATH/../art/clippy$(( RANDOM % 6 )).txt | sed -r "s|§a+§|$line1|g" | sed -r "s|§b+§|$line2|g" | sed -r "s|§c+§|$line3|g" | sed -r "s|§d+§|$line4|g"