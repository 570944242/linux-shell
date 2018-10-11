#!/bin/bash
if [ $# == 0 ]
then
    echo "[error] please input args for wants who killed..."
    exit 1
fi
p=$(sudo netstat -nap |grep $1 | awk '{print $7}' | awk -F"/" '{ print $1 }' | sort | uniq)
netstat -nap | grep $1
read -r -p "Are you Sure Kill?[Y/n]" input
case $input in 
	[yY])
		kill -9 $p
		echo "killd process:" $p
		;;
	[nN])
		;;
	*)
		exit 1
		;;
esac


