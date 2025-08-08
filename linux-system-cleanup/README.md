# 🧹 Linux System Cleanup Tool

## 📌 Description
A Bash script to automate disk cleanup tasks:
- Clear `/tmp` and system cache
- Remove old logs
- Delete large files
- Clean orphaned packages
- Show disk usage before & after cleanup

---

## 🚀 Features
✅ Clean `/tmp`, `/var/cache`, old logs  
✅ Delete large files (>100MB)  
✅ Remove orphaned packages  
✅ Clear journal logs  
✅ Show disk usage summary  
✅ Log all operations in `logs/`

---

## 📦 Installation
```bash
git clone https://github.com/yourusername/linux-system-cleanup.git
cd linux-system-cleanup
chmod +x cleanup.sh

