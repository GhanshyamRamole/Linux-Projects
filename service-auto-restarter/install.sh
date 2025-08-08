#!/bin/bash

chmod +x auto_restart.sh

# Install dependencies
sudo apt update
sudo apt install curl mailutils -y

# Set up cron job (every 5 minutes)
(crontab -l 2>/dev/null; echo "*/5 * * * * $(pwd)/auto_restart.sh") | crontab -

echo "✅ Service Auto-Restarter installed. Runs every 5 minutes."

