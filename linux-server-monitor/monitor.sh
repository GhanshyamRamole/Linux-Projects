#!/bin/bash

# Load config variables
source ./config.env

LOG_DIR="./logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/monitor-$(date +%F).log"

# Get system metrics
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
memory_usage=$(free | grep Mem | awk '{printf("%.2f", $3/$2 * 100)}')
disk_usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//g')
uptime_info=$(uptime -p)

# Create log entry
log_entry="$(date): CPU=${cpu_usage}%, MEM=${memory_usage}%, DISK=${disk_usage}%, UPTIME=${uptime_info}"
echo "$log_entry" >> "$LOG_FILE"

# Send alerts if any threshold is crossed
if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )); then
  echo "High CPU usage: $cpu_usage%" | mail -s "⚠️ CPU Alert" "$ALERT_EMAIL"
fi

if (( $(echo "$memory_usage > $MEMORY_THRESHOLD" | bc -l) )); then
  echo "High Memory usage: $memory_usage%" | mail -s "⚠️ Memory Alert" "$ALERT_EMAIL"
fi

if [ "$disk_usage" -gt "$DISK_THRESHOLD" ]; then
  echo "High Disk usage: $disk_usage%" | mail -s "⚠️ Disk Alert" "$ALERT_EMAIL"
fi

# Optional: Check if service is running
for service in ${SERVICES[@]}; do
  if ! systemctl is-active --quiet "$service"; then
    echo "Service $service is down" | mail -s "⚠️ Service Alert: $service" "$ALERT_EMAIL"
  fi
done

