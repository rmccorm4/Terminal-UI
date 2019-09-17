#!/bin/bash

function simple {
    # save, clear screen
    tput smcup
    clear

    # example "application" follows...
    read -n1 -p "Press any key to continue..."
    # example "application" ends here

    # restore
    tput rmcup
}

function no_tput {
    echo -e '\033[?47h' # save screen
    read -n1 -p "Press any key to continue..."
    echo -e '\033[?47l' # restore screen
}

simple
#no_tput
