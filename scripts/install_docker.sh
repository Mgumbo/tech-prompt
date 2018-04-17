#!/bin/bash

# Ensure the user is running this script as root
if [[ $EUID > 0 ]]
then
	echo "Please run as root."
	exit
fi

# Set up the Docker repository
apt-get update
apt-get install --assume-yes apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Install Docker CE
apt-get update
apt-get install --assume-yes docker-ce
