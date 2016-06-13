#!/bin/bash

dirname=$(dirname $0)

INDEX_FILE="$dirname/index.txt"
if [ ! -f $INDEX_FILE ] ; then
	echo "1" > $INDEX_FILE
	if [ $? -ne 0 ]; then
		echo "ERROR: Cannot create $INDEX_FILE"
		exit 1
	fi
fi
RADIO_FILE="$dirname/radio.txt"

INDEX=$(cat $INDEX_FILE)

LINE=$(sed -n ${INDEX}p $RADIO_FILE)

NAME="$(echo $LINE | awk -F'|' '{print $1}')"
URL="$(echo $LINE | awk -F'|' '{print $2}')"

echo "Playing $NAME -> $URL"

mplayer $URL
