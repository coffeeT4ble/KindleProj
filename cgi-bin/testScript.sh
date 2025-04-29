#!/bin/bash
echo "Content-type: text/html"
echo ""
# Function to display CPU usage
cpu_usage() {
    echo "CPU Usage:"
    # Using top command to get CPU usage in a brief format
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "CPU usage: " 100 - $1 "%"}'
}

# Function to display memory usage
memory_usage() {
    echo "Memory Usage:"
    # Using free command to get memory stats
    free -h | grep Mem | awk '{print "Used: " $3 " / Total: " $2 " (" $3/$2*100 "%)" }'
}

# Function to display disk usage
disk_usage() {
    echo "Disk Usage:"
    # Using df command to check disk space usage
    df -h --total | grep total | awk '{print "Used: " $3 " / Total: " $2 " (" $5 ")"}'
}

# Run the resource monitor every 5 seconds
while true; do
    clear
    cpu_usage
    memory_usage
    disk_usage
    sleep 2
done

