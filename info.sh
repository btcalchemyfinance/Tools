#!/bin/bash

# Colors for output
RESET='\033[0m'
BOLD='\033[1m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'

# Function to display headings
print_header() {
  echo -e "${CYAN}======================================"
  echo -e "    $1"
  echo -e "======================================${RESET}"
}

# Get system information
vcpus=$(nproc)
total_ram=$(free -h | grep Mem | awk '{print $2}')
used_ram=$(free -h | grep Mem | awk '{print $3}')
available_ram=$(free -h | grep Mem | awk '{print $7}')
total_ssd=$(df -h / | awk 'NR==2 {print $2}')
used_ssd=$(df -h / | awk 'NR==2 {print $3}')
available_ssd=$(df -h / | awk 'NR==2 {print $4}')

# Clear terminal screen
clear

# Display the system information
echo -e ""
echo -e '\e[34m'
echo -e ' █████╗ ██╗      ██████╗██╗  ██╗███████╗███╗   ███╗██╗   ██╗███████╗██╗███╗   ██╗ █████╗ ███╗   ██╗ ██████╗███████╗'
echo -e '██╔══██╗██║     ██╔════╝██║  ██║██╔════╝████╗ ████║╚██╗ ██╔╝██╔════╝██║████╗  ██║██╔══██╗████╗  ██║██╔════╝██╔════╝'
echo -e '███████║██║     ██║     ███████║█████╗  ██╔████╔██║ ╚████╔╝ █████╗  ██║██╔██╗ ██║███████║██╔██╗ ██║██║     █████╗  '
echo -e '██╔══██║██║     ██║     ██╔══██║██╔══╝  ██║╚██╔╝██║  ╚██╔╝  ██╔══╝  ██║██║╚██╗██║██╔══██║██║╚██╗██║██║     ██╔══╝  '
echo -e '██║  ██║███████╗╚██████╗██║  ██║███████╗██║ ╚═╝ ██║   ██║   ██║     ██║██║ ╚████║██║  ██║██║ ╚████║╚██████╗███████╗'
echo -e '╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝'
echo -e '\e[0m'
echo -e "                 \033[48;2;9;10;12m 法师/AlchemyFinance \e[0m";
echo -e "\e[0;37m 油管频道: \e[4;35mhttps://www.youtube.com/@alchemyfinance/";
echo -e "\e[0;37m 法师社群: \e[4;35mhttps://t.me/ytalchemy/";
echo -e "\e[0m"

print_header "System Information"

echo -e "${BOLD}${WHITE}vCPU Cores:${RESET} ${GREEN}$vcpus${RESET}"
echo -e "${BOLD}${WHITE}Total RAM:${RESET} ${GREEN}$total_ram${RESET}"
echo -e "${BOLD}${WHITE}Used RAM:${RESET} ${YELLOW}$used_ram${RESET}"
echo -e "${BOLD}${WHITE}Available RAM:${RESET} ${GREEN}$available_ram${RESET}"
echo -e "${BOLD}${WHITE}Total SSD Space:${RESET} ${GREEN}$total_ssd${RESET}"
echo -e "${BOLD}${WHITE}Used SSD Space:${RESET} ${YELLOW}$used_ssd${RESET}"
echo -e "${BOLD}${WHITE}Available SSD Space:${RESET} ${GREEN}$available_ssd${RESET}"

# Optional separator at the end
echo -e "${CYAN}======================================${RESET}"
