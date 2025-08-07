#!/bin/bash

# Ensure script is executable
chmod +x monitor.sh

# Setup cron to run every 5 minutes
(crontab -l 2>/dev/null; echo "*/5 * * * * $(pwd)/monitor.sh") | crontab -

echo "✅ Cron job installed. Monitoring every 5 minutes."

