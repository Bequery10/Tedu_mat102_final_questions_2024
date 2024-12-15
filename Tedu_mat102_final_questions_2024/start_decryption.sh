#!/bin/bash
cd encrpytion_tool
sudo apt-get install -y python3
sudo apt-get install -y python3-pip
sudo apt-get install -y python3-venv
sudo apt-get install -y python3-full
sudo apt-get install -y python3-xlib
python3 -m venv venv
source venv/bin/activate
pthon3 -u run.py
