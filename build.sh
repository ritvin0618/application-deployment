#!/bin/bash
# build.sh - Script to build Docker image

# Step 1: Print starting message
echo "Building Docker image..."

# Step 2: Build the Docker image
docker-compose build

# Step 3: Print success message
echo "Docker image built successfully!"

