#!/bin/bash
# term_size2 - Dynamically display terminal window size

redraw() {
    clear
    echo "Width = $(tput cols) Height = $(tput lines)"
    echo "Try resizing the window!"
}

trap redraw WINCH

redraw
while true; do
    : # NoOp
done
