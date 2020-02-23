#! /bin/bash

# Install and start Nginx Server
sudo apt-get -y update 
sudo apt-get install -y nginx 
sudo service nginx start

# Install Python3
sudo apt install -y software-properties-common python3.7 
sudo add-apt-repository -y ppa:deadsnakes/ppa
python3 --version

# Install Pip3, Ansible and other dependencies
sudo apt install -y ansible telnetd ntp mtr tree
ansible --version
sudo systemctl status inetd
sudo apt install -y python3-pip
pip3 install flask
wget https://raw.githubusercontent.com/AfterpayTouch/recruitment-challenge-1/master/tiny_app.py
python3 ./tiny_app.py


# Run ansible script to config Nginx server
wget 
ansible-playbook ./nginx.yml



