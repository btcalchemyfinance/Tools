#!/bin/bash

# Update the system
sudo apt update

# Install dependencies
sudo apt install -y curl software-properties-common

# Install Node.js from NodeSource (LTS version)
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

# Verify installation
node -v
npm -v

echo "Node.js installation complete!"
