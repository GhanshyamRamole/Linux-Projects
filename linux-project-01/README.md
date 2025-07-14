# 🐧 Linux Mastery Project

This project is designed to help learners and engineers master Linux by exploring its command-line tools, architecture, directory structure, file permissions, process management, package handling, user management, and more.

---

## 📌 Table of Contents

1. [Project Overview](#project-overview)  
2. [Linux Architecture](#linux-architecture)  
3. [Linux Directory Structure](#linux-directory-structure)  
4. [Essential Linux Commands](#essential-linux-commands)  
5. [User and Group Management](#user-and-group-management)  
6. [File Permissions and Ownership](#file-permissions-and-ownership)  
7. [Process Management](#process-management)  
8. [Package Management](#package-management)  
9. [Shell Scripting Basics](#shell-scripting-basics)  
10. [Networking Commands](#networking-commands)  
11. [System Monitoring and Logging](#system-monitoring-and-logging)  
12. [Contributing](#contributing)  
13. [License](#license)

---

## 🧠 Project Overview

This project acts as a comprehensive reference and practice guide for mastering Linux. Whether you're a system administrator, DevOps engineer, or student, this project gives you hands-on practice with the most important Linux operations and concepts.

---

## 🖥️ Linux Architecture

![Linux Architecture](https://miro.medium.com/v2/resize:fit:720/format:webp/0*GvmKAfV-MX9ebGD_)  
*Figure: General Linux OS architecture overview.*

- **Hardware**: CPU, memory, storage, and peripherals.
- **Kernel**: Core layer, manages hardware communication.
- **System Call Interface**: Acts as a bridge between the kernel and user applications.
- **User Space**: Shells, applications, system utilities.

---

## 📁 Linux Directory Structure

![Linux File System](https://upload.wikimedia.org/wikipedia/commons/a/a2/Linux_filesystem_hierarchy_standard.png)  
*Figure: Linux Filesystem Hierarchy.*

| Directory | Purpose |
|----------|---------|
| `/`      | Root of the filesystem |
| `/home`  | User home directories |
| `/etc`   | Configuration files |
| `/var`   | Variable files like logs |
| `/bin`   | Essential binaries |
| `/sbin`  | System binaries |
| `/usr`   | Secondary hierarchy |
| `/tmp`   | Temporary files |

---

## 🔧 Essential Linux Commands

| Command | Description |
|--------|-------------|
| `ls` | List directory contents |
| `cd` | Change directory |
| `pwd` | Print current directory |
| `mkdir` | Create a directory |
| `rm` | Remove files or directories |
| `cp` | Copy files/directories |
| `mv` | Move or rename files/directories |
| `cat`, `more`, `less` | View file content |
| `man` | View manual pages |

---

## 👤 User and Group Management

- Create user: `sudo adduser username`
- Delete user: `sudo deluser username`
- Add group: `sudo groupadd groupname`
- Add user to group: `sudo usermod -aG groupname username`
- Switch user: `su - username`
- View current user: `whoami`

---

## 🔐 File Permissions and Ownership

```bash
chmod 755 file      # Set permissions
chown user:group file  # Change owner and group
ls -l               # View permissions
