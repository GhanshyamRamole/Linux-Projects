#!/bin/bash

# Load config
source ./config.env

mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/restart-$(date +%F).log"

send_slack_alert() {
    if [ -n "$SLACK_WEBHOOK" ]; then
        curl -X POST -H 'Content-type: application/json' \
        --data "{\"text\":\":rotating_light: Service *$1* was down and restarted on $(hostname) at $(date)\"}" \
        "$SLACK_WEBHOOK"
    fi
}

send_email_alert() {
    if [ -n "$ALERT_EMAIL" ]; then
        echo "Service $1 was down and restarted on $(hostname) at $(date)" \
        | mail -s "Service Restart Alert: $1" "$ALERT_EMAIL"
    fi
}

for service in "${SERVICES[@]}"; do
    if ! systemctl is-active --quiet "$service"; then
        echo "$(date) - $service is DOWN. Restarting..." | tee -a "$LOG_FILE"
        systemctl restart "$service"
        if systemctl is-active --quiet "$service"; then
            echo "$(date) - $service restarted successfully." | tee -a "$LOG_FILE"
            send_slack_alert "$service"
            send_email_alert "$service"
        else
            echo "$(date) - Failed to restart $service." | tee -a "$LOG_FILE"
        fi
    else
        echo "$(date) - $service is running fine." >> "$LOG_FILE"
    fi
done

