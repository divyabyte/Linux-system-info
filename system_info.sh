#!/bin/bash

# Function to display a horizontal line for better formatting
display_line() {
    echo "--------------------------------------------------------"
}

# Display system information
echo "System Information:"
display_line

# Display CPU information
echo "CPU Information:"
display_line
cpu_info=$(lscpu | grep -E 'Architecture|Model name|CPU(s)|Thread(s) per core|Core(s) per socket|Socket(s)')
echo "$cpu_info"

# Display Memory information
echo -e "\nMemory Information:"
display_line
free -h

# Display Disk space information
echo -e "\nDisk Space Information:"
display_line
df -h

# Display Network information
echo -e "\nNetwork Information:"
display_line
if command -v ip &> /dev/null; then
    ip -br addr
else
    if command -v ifconfig &> /dev/null; then
        ifconfig -a
    else
        echo "Neither 'ip' nor 'ifconfig' command found. Please install one of them."
    fi
fi

# End of script
