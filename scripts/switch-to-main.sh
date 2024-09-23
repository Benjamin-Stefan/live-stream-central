#!/bin/bash

# Name of the main branch
MAIN_BRANCH="main"

# Check if we are already on the main branch
current_branch=$(git rev-parse --abbrev-ref HEAD)
if [ "$current_branch" == "$MAIN_BRANCH" ]; then
  echo "You are already on the $MAIN_BRANCH branch."
  exit 0
fi

# Switch to the main branch
echo "Switching to the $MAIN_BRANCH branch..."
git fetch origin
git checkout $MAIN_BRANCH

# Pull the latest changes from the main branch
echo "Pulling the latest changes from $MAIN_BRANCH..."
git pull origin $MAIN_BRANCH

# Optional: Restart Docker container if using Docker
# echo "Restarting Docker container..."
# docker-compose down
# docker-compose up -d --build

echo "Branch switch complete, and $MAIN_BRANCH branch is up to date."
