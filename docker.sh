#!/usr/bin/env bash
echo "Updating"
sudo apt-get -qq update
sudo apt-get -qq install curl
echo "Docker installation"
sudo apt-get -y -qq install docker.io
echo "Docker compose installation"
sudo curl -s -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo service docker start
sudo chmod +x /usr/local/bin/docker-compose
sudo groupadd docker
sudo usermod -aG docker vagrant
sudo docker --version
sudo docker-compose --version
sudo docker run hello-world
echo "Docker and docker compose are installed"