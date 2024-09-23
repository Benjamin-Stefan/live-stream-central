#!/bin/bash

# Function to install a program if it's not already installed
install_if_missing() {
  if ! command -v $1 &> /dev/null
  then
    echo "Installing $1..."
    sudo apt-get install -y $1
  else
    echo "$1 is already installed."
  fi
}

# Install Node.js if it's not already installed
if ! command -v node &> /dev/null
then
    echo "Installing Node.js..."
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt-get install -y nodejs
else
    echo "Node.js is already installed."
fi

# Install git and curl if they are not already installed
install_if_missing git
install_if_missing curl

# Clone Git repository if the .git directory does not exist
REPO_URL="https://github.com/Benjamin-Stefan/live-stream-central"
if [ ! -d ".git" ]; then
    echo "No Git repository found. Cloning the repository..."
    git clone "$REPO_URL" .
else
    echo "Git repository found. Updating with 'git pull'..."
    git pull origin main
fi

# Install dependencies for the client
echo "Installing client dependencies..."
cd ../client
npm install --production

# Install dependencies for the server
echo "Installing server dependencies..."
cd ../server
npm install --production
