#!/bin/bash
sudo apt update
curl -sL https://deb.nodesource.com/setup_14.x | bash -
sudo apt install nodejs git nginx ruby build-essential apache2-utils redis-server awscli -y
sudo apt-get install ca-certificates curl gnupg lsb-release -y
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update
sudo apt-get install waypoint
sudo wget https://aws-codedeploy-ap-southeast-1.s3.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent start
sudo service codedeploy-agent status
sudo apt update
sudo waypoint install --platform=docker -accept-tos