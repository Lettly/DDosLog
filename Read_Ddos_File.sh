#!/bin/bash

##################################################
#
# -s Save file
# -nv No visualize file
#
##################################################

if echo "-s" | grep -q "$*"; then ## se attivato fai:
	tcpdump -qns 0 -X -r $1 > $1.txt
fi

if ! echo "-nv" | grep -q "$*"; then ## se non attivato fai:
	tcpdump -qns 0 -X -r $1 
  else
  tcpdump -qns 0 -X -r $1
fi

echo 
echo 
echo END
