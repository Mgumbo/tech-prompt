#!/bin/bash

# Ensure the user is running this script as root
if [[ $EUID > 0 ]]
then
	echo "Please run as root."
	exit
fi

# Shut down any running containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# Remove the prompt2 image
docker images | while read -a image
do
	if [[ "${image[0]}" == "prompt2" ]]
	then
		docker image rm ${image[2]}
	fi
done

