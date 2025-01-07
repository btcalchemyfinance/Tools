#!/bin/bash

# Update apt packages
echo "Updating apt packages..."
sudo apt-get update -y

# Install prerequisites
echo "Installing required dependencies..."
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Add Docker's official GPG key
echo "Adding Docker's official GPG key..."
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker's official repository
echo "Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update apt again
echo "Updating apt again..."
sudo apt-get update -y

# Install Docker and Docker Compose
echo "Installing Docker and Docker Compose..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Install docker-compose (in case the plugin doesn't install it)
echo "Installing Docker Compose..."
sudo apt-get install -y docker-compose

# Start and enable Docker service
echo "Starting and enabling Docker..."
sudo systemctl start docker
sudo systemctl enable docker

# Verify installation
echo "Docker and Docker Compose have been installed successfully!"
docker --version
docker-compose --version
