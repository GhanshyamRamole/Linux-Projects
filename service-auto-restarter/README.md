# 🛠️ Service Auto-Restarter

A Bash-based tool to monitor and automatically restart critical Linux services like NGINX, PostgreSQL, etc. Sends alerts via Email or Slack when a restart occurs.

## 🚀 Features
- Monitor services with `systemctl`
- Auto-restart on failure
- Slack + Email alerts
- Logs every action
- Easy cron setup

## 📦 Installation
```bash
git clone https://github.com/yourusername/service-auto-restarter.git
cd service-auto-restarter
chmod +x install.sh
./install.sh

