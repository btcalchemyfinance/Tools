#!/bin/bash

# Get number of virtual CPU cores
vcpus=$(nproc)

# Get total RAM
total_ram=$(free -h | grep Mem | awk '{print $2}')

# Get used RAM
used_ram=$(free -h | grep Mem | awk '{print $3}')

# Get available RAM
available_ram=$(free -h | grep Mem | awk '{print $7}')

# Get total SSD space (for root filesystem)
total_ssd=$(df -h / | awk 'NR==2 {print $2}')

# Get used SSD space (for root filesystem)
used_ssd=$(df -h / | awk 'NR==2 {print $3}')

# Get available SSD space (for root filesystem)
available_ssd=$(df -h / | awk 'NR==2 {print $4}')

# Output the results
echo "System Information:"
echo "====================="
echo "vCPU Cores: $vcpus"
echo "Total RAM: $total_ram"
echo "Used RAM: $used_ram"
echo "Available RAM: $available_ram"
echo "Total SSD Space: $total_ssd"
echo "Used SSD Space: $used_ssd"
echo "Available SSD Space: $available_ssd"
