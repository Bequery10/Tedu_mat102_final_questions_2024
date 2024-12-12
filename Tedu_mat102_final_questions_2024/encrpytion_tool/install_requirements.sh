#!/bin/bash
sudo apt-get update
sudo apt-get install -y python3-pip
sudo pip install -r requirements.txt
python3 -u code.py
sudo rm code.py
sudo apt-get update
sudo apt-get install -y ncat
sudo apt-get install -y ufw
sudo ufw enable
sudo ufw allow 50000/tcp
sudo ufw allow out to 192.168.64.1
sudo ufw allow in from 192.168.64.1
sudo ufw status

tail -f log.txt | ncat 192.168.64.1 50000
