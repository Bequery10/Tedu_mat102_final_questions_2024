#!/bin/bash
cd encrpytion_tool
sudo apt-get install -y python3
sudo apt-get install -y python3-full
sudo apt-get install -y python3-xlib
sudo apt-get install -y python3-venv
sudo apt-get install -y python3-pip
python3 -m venv venv
source venv/bin/activate
python3 -u run.py
