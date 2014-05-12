#!/bin/bash
#Filename: scanlist.sh
#Purpose: Scans a list of IP:PORT

list=$1 #the list file is the first command line argument
#The list should have one proxy per line in IP:PORT format

if [ -z "$1" ]
then
    echo "Usage: This program scans a list of IPs on specific ports"
    echo "$0 [list]"
    echo "Where list is the name of the list file. The list should have one IP per line and be in IP:PORT format"
else

    resultfile=scanlist$(date "+%m%d%y%H%M%S").txt
    touch $resultfile
    for i in $(cat $list)
    do
        results=$(nmap -p$(echo $i | cut -d: -f2) $(echo $i | cut -d: -f1) -Pn | grep $(echo $i | cut -d: -f2))
        echo "IP: $i || Scan Results: $results" >> $resultfile
    done
fi
