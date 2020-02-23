#! /bin/bash

# Install and start Nginx Server
sudo apt-get -y update 
sudo apt-get install -y nginx 
sudo service nginx start

# Install Python3
sudo apt install -y software-properties-common python3.7 
sudo add-apt-repository -y ppa:deadsnakes/ppa
python3 --version

# Install Pip3 and Ansible
sudo apt install -y python3-pip ansible
sudo pip3 install flask
wget https://raw.githubusercontent.com/AfterpayTouch/recruitment-challenge-1/master/tiny_app.py



