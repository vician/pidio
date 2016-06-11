#!/bin/bash

dirname=$(dirname $0)

INDEX_FILE="$dirname/index.txt"
RADIO_FILE="$dirname/radio.txt"

INDEX=$(cat $INDEX_FILE)

LINE=$(sed -n ${INDEX}p $RADIO_FILE)

NAME="$(echo $LINE | awk -F'|' '{print $1}')"
URL="$(echo $LINE | awk -F'|' '{print $2}')"

echo "Playing $NAME -> $URL"

mplayer $URL
