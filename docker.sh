#!/bin/sh

sudo apt update && sudo apt upgrade -y
sudo apt install -y docker.io docker-compose
sudo systemctl start docker && sudo systemctl enable docker
git clone https://github.com/conecta-sptech/Docker.git
sudo docker-compose up