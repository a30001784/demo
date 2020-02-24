#!/usr/bin/env bash

# Install basic applications
sudo apt-get -y update 
sudo apt-get install -y ntp telnetd mtr tree 

# Install and start Nginx Server
sudo apt-get -y update 
sudo apt-get install -y nginx 
sudo service nginx start

# Download Nginx configuration file 
curl -L "https://raw.githubusercontent.com/a30001784/demo/master/scripts/nginx.yml" -o /home/ubuntu/nginx.yml
curl -L "https://raw.githubusercontent.com/a30001784/demo/master/scripts/nginx.conf" -o /home/ubuntu/nginx.conf
#curl -L "https://raw.githubusercontent.com/AfterpayTouch/recruitment-challenge-1/master/tiny_app.py" -o /home/ubuntu/tiny_app.py

# Install Python3 
sudo apt install -y software-properties-common python3.7 wget
sudo add-apt-repository -y ppa:deadsnakes/ppa
python3 --version

# Config Nginx Server
sudo cp -rf ./home/ubuntu/nginx.conf /etc/nginx/nginx.conf
sudo service nginx stop
sudo service nginx start

# Install ansible and modify configuration file of Nginx server
sudo apt install -y software-properties-common
sudo apt-add-repository -y --update ppa:ansible/ansible
sudo apt install -y ansible 
ansible --version
/usr/bin/ansible-playbook ./nginx.yml 

# Set System wide File Descriptors Limits to 65535
sudo sysctl -w fs.file-max=65535

# Set User Level Open File limits
/usr/bin/ansible-playbook ./ulimit.yml


# Install Pip3, Flask and other dependencies
sudo apt install -y python3-pip
pip3 install flask
wget  "https://raw.githubusercontent.com/AfterpayTouch/recruitment-challenge-1/master/tiny_app.py"
python3 ./tiny_app.py   

# sudo cp -rf ./home/ubuntu/nginx.conf /etc/nginx/nginx.conf
# sudo service nginx stop
# sudo service nginx start

# Install ansible and modify configuration file of Nginx server
sudo apt install -y ansible 
ansible --version
/usr/bin/ansible-playbook ./nginx.yml
