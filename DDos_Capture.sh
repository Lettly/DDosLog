#!/bin/bash
#https://stackoverflow.com/questions/28130330/bash-script-to-ping-a-ip-and-if-the-ms-is-over-100-print-a-echo-msg



clear
while sleep 10; do
  NOW=$(date +"%d-%m-%y_%T")
  echo 
  echo
  echo -e "\e[39m------------------------------------------------------------------"
  echo -e "\e[34m[$NOW]\e[33m Ping test is in progress."
  t="$(ping -c 1 8.8.8.8 | sed -ne '/.*time=/{;s///;s/\..*//;p;}')"
  echo -e "\e[34m[$NOW]\e[33m Ping is\e[39m $t."
  if [ "$t" -gt 50 ]; then
    # do somethin
	echo -e "\e[34m[$NOW]\e[91m Ping test failed."
	NOW=$(date +"%d-%m-%y_%T")
	echo -e "\e[34m[$NOW]\e[4m\e[31m Start packet capture."
	tcpdump -nnpvvi ens3 -w capture_$NOW.cap -c 100000
	echo -e "\e[34m[$NOW]\e[4m\e[31m Capture log finish."
	echo -e "\e[39m------------------------------------------------------------------"
  else
	if [ -z "$t" ]; then
		# do somethin
		echo -e "\e[34m[$NOW]\e[91m Ping test failed."
		NOW=$(date +"%d-%m-%y_%T")
		echo -e "\e[34m[$NOW]\e[4m\e[31m Start packet capture."
		tcpdump -nnpvvi ens3 -w capture_$NOW.cap -c 100000
		echo -e "\e[34m[$NOW]\e[4m\e[31m Capture log finish."
		echo -e "\e[39m------------------------------------------------------------------"		
	else
		# do something else
		echo -e "\e[34m[$NOW]\e[32m Ping test successful"
		echo -e "\e[39m------------------------------------------------------------------"
	fi
  fi
done