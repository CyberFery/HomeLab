#!/bin/bash

# Pull Docker images
echo "Pulling Docker images..."
docker pull hackeracademy/metasploitable
docker pull parrotsec/security
docker pull parrotsec/nmap
docker pull parrotsec/metasploit

# Start containers using Docker Compose
echo "Starting containers..."
docker-compose up -d

# Display running containers
echo "Running containers:"
docker ps
