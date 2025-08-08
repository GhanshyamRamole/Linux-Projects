#!/bin/bash
# ==========================================
# Linux System Cleanup Tool
# ==========================================
# Author: Your Name
# Date: 2025-08-08
# Description: Cleans cache, old logs, orphaned packages, large files.
# ==========================================

LOG_FILE="logs/cleanup-$(date +'%Y-%m-%d').log"
mkdir -p logs

# Function to log messages
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Show disk usage before cleanup
log "📊 Disk usage before cleanup:"
df -h | tee -a "$LOG_FILE"

# 1. Clean /tmp
log "🗑 Cleaning /tmp..."
rm -rf /tmp/*

# 2. Clean apt cache (Debian/Ubuntu)
if command -v apt >/dev/null 2>&1; then
    log "🗑 Cleaning apt cache..."
    sudo apt clean
    sudo apt autoclean
    sudo apt autoremove -y
fi

# 3. Clear system logs older than 7 days
log "🗑 Clearing logs older than 7 days..."
sudo find /var/log -type f -name "*.log" -mtime +7 -exec rm -f {} \;

# 4. Delete large files > 100MB in home directory
log "🗑 Searching and deleting large files (>100MB) in home directory..."
find $HOME -type f -size +100M -exec rm -i {} \;

# 5. Clear journal logs (systemd)
if command -v journalctl >/dev/null 2>&1; then
    log "🗑 Clearing journal logs..."
    sudo journalctl --vacuum-time=7d
fi

# Show disk usage after cleanup
log "📊 Disk usage after cleanup:"
df -h | tee -a "$LOG_FILE"

log "✅ Cleanup completed."

