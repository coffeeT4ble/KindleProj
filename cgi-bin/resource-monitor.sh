#!/bin/bash

echo "Content-type: text/html"
echo ""
# CPU Usage
echo "<p><b>CPU Usage: $(top -bn1 | grep "Cpu(s)" | sed -r "s/.*, *([0-9.]*)%* id.*/\1/" | awk '{print 100 - $1 "%"}')</b></p>"
# Memory Usage
echo "<p><b>Memory Usage:"
echo "$(free -h | grep -E '^Mem' | awk '{print "  Used: " $3 " / Total: " $2 " (" $3/$2*100 "%)"}')</b></p>"
# Disk Usage
echo "<p><b>Disk Usage:<br>"
echo "$(df -h | grep -E '^/dev' | awk '{print "  " $1 ": " $3 " / " $2 " (" $5 ")<br>"}')</b></p>"

# Top 5 Processes
echo "<p><b>Top 5 Processes by CPU Usage:"
echo -e "$(ps -eo pid,%cpu,%mem,cmd --sort=-%cpu | head -n 6 | awk '{print $0 "<br>"}') </b></p>"


#clear_screen() {
 	#clear
	#echo "Resource Monitor - $(date)"
	#echo "--------------------------------"
	#get_cpu_usage
	#get_memory_usage
	#get_disk_usage
	#get_top_processes
	#echo "--------------------------------"
#}

