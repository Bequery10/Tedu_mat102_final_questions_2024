#!/bin/bash
cd encrpytion_toold
sudo apt-get update
sudo apt-get install -y python3
sudo apt-get install -y python3-pip
sudo apt-get install -y python3.12-venv
python3 -m venv venv
source venv/bin/activate