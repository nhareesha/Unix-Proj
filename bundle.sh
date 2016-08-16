#!/bin/sh
##############################################################
#
### Search for the given keyword in the files and bundel them with compression
##############################################################################

srchkey=$1
tarnm=$2
tarname=$tarnm".tar"
argnum=$#
echo "$tarname"

if [ $argnum -lt 2 ] || [ $argnum -gt 2 ]
then
	echo "CorrectUsage : bundle.sh <keyword> <bundle name>"
	exit #specifying the exit status 
fi

if [ "$srchkey" ] && [ "$tarname" ]
then
	v=`grep -H -r "$srchkey" /home/ubuntu/shellscripts | cut -d: -f1 | sort -u `
	
	# tar -cf "$tarname"`

	`touch readme.txt`
	if [ ! -e "$tarname" ]
	then
		`tar -cf "$tarname" readme.txt`
		`chmod +x "$tarname"`
		`chmod +w "$tarname"`
	fi

	for wrd in "$v"
	do
		echo "$wrd"
		`tar -rf $tarname $wrd`
	done
		`bzip2 $tarname`

fi
