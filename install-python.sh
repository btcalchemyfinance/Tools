#!/bin/bash

# Update the system package list
echo "Updating system packages..."
sudo apt update -y

# Install dependencies required for building Python (if not already installed)
echo "Installing dependencies..."
sudo apt install -y software-properties-common build-essential libssl-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    zlib1g-dev liblzma-dev tk-dev libffi-dev libdb-dev

# Add the deadsnakes PPA repository (contains more recent Python versions)
echo "Adding deadsnakes PPA repository for latest Python versions..."
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update -y

# Install Python 3.x (replace "python3.x" with the desired version, e.g., python3.9)
PYTHON_VERSION="python3.9"
echo "Installing $PYTHON_VERSION..."
sudo apt install -y $PYTHON_VERSION

# Install pip for Python 3
echo "Installing pip for Python 3..."
sudo apt install -y python3-pip

# Verify Python and pip installation
echo "Verifying Python and pip installation..."
python3 --version
pip3 --version

echo "Python installation complete!"
