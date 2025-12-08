#!/bin/bash
# deploy.sh - Script to deploy Docker image

# Step 1: Print starting message
echo "Deploying Docker container..."

# Step 2: Run the Docker container using docker-compose
docker-compose up -d

# Step 3: Print success message
echo "Docker container deployed successfully!"

