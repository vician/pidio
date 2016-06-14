#!/bin/bash

ARCHIV="$1"

ARCHIV="$(echo $ARCHIV | awk -F'#' '{print $1}')"
ARCHIV="$(echo $ARCHIV | awk -F'?' '{print $1}')"

echo "cut url: $ARCHIV"

IDs=$(echo "$ARCHIV/" | grep -o '/[0-9]*/$')
echo $IDs
ID=$(echo "$IDs" | grep -o '[0-9]*')
echo $ID

download_url="http://media.rozhlas.cz/_download/$ID"
stream_url="http://media.rozhlas.cz/_audio/$ID.mp3"

echo "download_url: $download_url"
echo "stream_url: $stream_url"

#mplayer "$download_url"
mplayer "$stream_url"
