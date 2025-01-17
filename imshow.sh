#!/bin/bash
#
# z3bra -- 2014-01-21

test -z "$1" && echo "Usage: ./imshow.sh <file>"; exit

W3MIMGDISPLAY="/usr/lib/w3m/w3mimgdisplay"
FILENAME=$1
FONTH=14 # Size of one terminal row
FONTW=8  # Size of one terminal column
COLUMNS=`tput cols`
LINES=`tput lines`

read width height <<< `echo -e "5;$FILENAME" | $W3MIMGDISPLAY`

max_width=$(($FONTW * $COLUMNS))
max_height=$(($FONTH * $(($LINES - 2)))) # substract one line for prompt

if [[ -z "$width" ]]; then
    width=$max_width
fi

if [[ -z "$height" ]]; then
    height=$max_height
fi

if [[ "$width" -gt "$max_width" ]]; then
    height=$(($height * $max_width / $width))
    width=$max_width
fi
if [[ "$height" -gt "$max_height" ]]; then
    width=$(($width * $max_height / $height))
    height=$max_height
fi

w3m_command="0;1;0;0;$width;$height;;;;;$FILENAME\n4;\n3;"

tput cup $(($height/$FONTH)) 0
echo -e $w3m_command|$W3MIMGDISPLAY

#echo "w3m_command: $w3m_command"
#echo "w3mimgdisplay: $W3MIMGDISPLAY"
#echo "FILENAME: $FILENAME"
#echo "Columns: $COLUMNS"
#echo "Rows: $LINES"
#echo "Height: $height"
#echo "Width: $width"
#echo "Max Height: $max_height"
#echo "Max Width: $max_width"
