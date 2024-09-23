#!/bin/bash

# Update the project repository
echo "Updating project repository..."
git pull origin main

# Install/update dependencies for the client
echo "Updating dependencies for client..."
cd ../client
npm install --production

# Install/update dependencies for the server
echo "Updating dependencies for server..."
cd ../server
npm install --production

# Confirm update completion
echo "Update complete!"
