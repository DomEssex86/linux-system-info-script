#!/bin/bash

# Colors
Green='\033[0;32m'
Blue='\033[0;34m'
Red='\033[0;31m'
NC='\033[0m' # No Color

LOGFILE="HOME/sysinfo.log"

echo -e "${Blue}===== System Info Tool =====${NC}"

echo "Select an option:"
echo "1 - CPU Info"
echo "2 - Memory Info"
echo "3 - Disk Usage"
echo "4 - Logged-in Users"
echo "5 - Full Report"

read -p "Enter choice: " choice

case $choice in
	1)
		echo -e "${Green}CPU Info:${NC}"
		lscpu | grep "Model name"
		;;
	2)
		echo -e "${Green}Memory Info:${NC}"
		free -h
		;;
	3)
		echo -e "${Green}Disk Usage:${NC}"
		df -h
		;;
	4)
		echo -e "${Green}Logged-in Users:${NC}"
		who
		;;
	5)
		echo -e "${Green}Full System Report:${NC}" | tee -a $LOGFILE
		date | tee -a $LOGFILE

		lscpu | grep "Model name" | tee -a $LOGFILE
		echo | tee -a $LOGFILE
		free -h | tee -a $LOGFILE
		echo | tee -a $LOGFILE
		df -h | tee -a $LOGFILE
		echo | tee -a $LOGFILE
		who | tee -a $LOGFILE
		echo | tee -a $LOGFILE
		uptime | tee -a $LOGFILE
		;;
	*)
		echo -e "${Red}Invalid option${NC}"
		;;
esac

