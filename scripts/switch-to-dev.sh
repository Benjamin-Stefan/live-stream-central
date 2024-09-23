#!/bin/bash

# Name of the development branch
DEV_BRANCH="dev"

# Check if we are already on the development branch
current_branch=$(git rev-parse --abbrev-ref HEAD)
if [ "$current_branch" == "$DEV_BRANCH" ]; then
  echo "You are already on the $DEV_BRANCH branch."
  exit 0
fi

# Switch to the development branch
echo "Switching to the $DEV_BRANCH branch..."
git fetch origin
git checkout $DEV_BRANCH

# Pull the latest changes from the development branch
echo "Pulling the latest changes from $DEV_BRANCH..."
git pull origin $DEV_BRANCH

# Optional: Restart Docker container if using Docker
# echo "Restarting Docker container..."
# docker-compose down
# docker-compose up -d --build

echo "Branch switch complete, and $DEV_BRANCH branch is up to date."
