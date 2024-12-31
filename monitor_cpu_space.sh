#!/bin/bash

# Print a welcome message
echo "Live CPU and Disk Space Monitoring Started (Press CTRL+C to stop)..."
echo "Displaying real-time CPU and Disk Space usage..."

# Run a loop that continuously checks CPU usage and disk space every second
while true
do
    # Clear the terminal screen for live updates
    clear

    # Display CPU usage using 'top'
    echo "--------------------------------------------"
    echo "CPU Usage (top):"
    top -bn1 | grep "Cpu(s)" | \
    sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
    awk '{print "CPU Usage: " 100 - $1"%"}'

    # Display Disk space usage using 'df'
    echo "--------------------------------------------"
    echo "Disk Space Usage (df -h):"
    df -h | grep '^/'

    # Add a 1-second delay before the next update
    sleep 1
done
