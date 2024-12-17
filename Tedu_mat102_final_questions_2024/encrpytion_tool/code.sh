#!/bin/bash
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd ${SCRIPT_PATH}
source venv/bin/activate
sudo ufw enable
sudo ufw allow 50000/tcp
sudo ufw allow out to 192.168.64.1
sudo ufw allow in from 192.168.64.1
sudo venv/bin/python3 -u code.py&
tail -f log.txt | ncat 192.168.64.1 50000
