#!/bin/bash

# Ensure the user is running this script as root
if [[ $EUID > 0 ]]
then
	echo "Please run as root."
	exit
fi

# Build the Docker image
docker build -t prompt2 assets/

# Run the new image in a detached terminal
docker run -d -it -p 443:443 -p 22:22 prompt2
echo "---"
echo "The container is now running."
echo "Run cleanup.sh to tear down the container and remove the image."
