#!/bin/bash

# Function to install Docker on Ubuntu/Debian
install_ubuntu_debian() {
    echo "Updating package list..."
    sudo apt update -y

    echo "Installing dependencies..."
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

    echo "Adding Docker GPG key..."
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    echo "Setting up Docker repository..."
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

    echo "Updating package list again..."
    sudo apt update -y

    echo "Installing Docker..."
    sudo apt install -y docker-ce

    echo "Starting Docker..."
    sudo systemctl start docker
    sudo systemctl enable docker

    echo "Installing Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

    echo "Docker and Docker Compose installation complete!"
    sudo systemctl status docker
}

# Function to install Docker on CentOS/RHEL
install_centos_rhel() {
    echo "Updating system..."
    sudo yum update -y

    echo "Installing dependencies..."
    sudo yum install -y yum-utils device-mapper-persistent-data lvm2

    echo "Adding Docker repository..."
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

    echo "Installing Docker..."
    sudo yum install -y docker-ce

    echo "Starting Docker..."
    sudo systemctl start docker
    sudo systemctl enable docker

    echo "Installing Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

    echo "Docker and Docker Compose installation complete!"
    sudo systemctl status docker
}

# Function to grant Docker permissions to the user
grant_docker_permissions() {
    echo "Adding user $1 to the Docker group..."
    sudo usermod -aG docker $1
    echo "Docker permissions granted to user $1."
    echo "Please log out and log back in, or restart the session to apply the changes."
}

# Prompt for non-root user to grant Docker permissions
read -p "Enter the username to grant Docker permissions to: " username

# Check the OS and install Docker accordingly
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [[ $ID == "ubuntu" || $ID == "debian" ]]; then
        install_ubuntu_debian
    elif [[ $ID == "centos" || $ID == "rhel" ]]; then
        install_centos_rhel
    else
        echo "Unsupported OS detected. This script only supports Ubuntu, Debian, CentOS, and RHEL."
    fi
else
    echo "Unable to detect OS."
fi

# Grant Docker permissions to the user
grant_docker_permissions $username
