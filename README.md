# Linux Bash Automation for DevOps

Production-style Linux and Bash automation project demonstrating practical system administration, scripting, process management, application deployment, and operational automation workflows commonly used in DevOps environments.

---

# Project Overview

This project demonstrates foundational Linux and Bash scripting skills used in real-world DevOps and infrastructure operations, including:

- Linux system inspection and validation
- package manager detection
- CLI editor detection
- shell environment inspection
- Java installation automation
- Linux process inspection and filtering
- process sorting by CPU and memory usage
- limiting command output with `head`
- downloading and extracting application artifacts
- environment variable configuration
- Node.js application startup automation
- validating running processes and listening ports
- custom application log directory configuration
- running applications using dedicated Linux service users

---

# Architecture Diagram

```text
MacBook / Local Development
        |
        | git push
        v
GitHub + GitLab Remote Repositories
        |
        | git clone
        v
DigitalOcean Ubuntu Server
        |
        | execute automation scripts
        v
Linux OS + Java + Node.js + NPM
        |
        | download and extract artifacts
        v
Node.js Application Package
        |
        | environment variables + service user
        v
Running Node.js Application + Log Management
```

---

# Repository Structure

```text
linux-bash-automation/
├── README.md
├── .gitignore
├── docs/
│   └── screenshots/
├── outputs/
│   └── .gitkeep
└── scripts/
    ├── linux-mint-system-check.sh
    ├── install-java.sh
    ├── user-processes.sh
    ├── user-processes-sorted.sh
    ├── user-processes-sorted-limit.sh
    ├── start-node-app.sh
    ├── start-node-app-check-status.sh
    ├── start-node-app-with-logdir.sh
    └── start-node-app-service-user.sh
```

---

# Prerequisites

Install the following on your Linux server or local machine:

- Git
- Bash
- Java
- Node.js
- npm

---

# Clone Repository

```bash
git clone git@github.com:younghadiz/linux-bash-automation.git
cd linux-bash-automation
```

---

# Make Scripts Executable

```bash
chmod +x scripts/*.sh
```

---

# Script Execution Examples

## Linux System Validation

```bash
./scripts/linux-mint-system-check.sh
```

## Install Java

```bash
sudo ./scripts/install-java.sh
```

## Display Running Processes for Current User

```bash
./scripts/user-processes.sh
```

## Sort Processes by Resource Usage

```bash
./scripts/user-processes-sorted.sh
```

## Limit Process Output

```bash
./scripts/user-processes-sorted-limit.sh
```

## Start Node.js Application

```bash
./scripts/start-node-app.sh
```

## Validate Running Application Process

```bash
./scripts/start-node-app-check-status.sh
```

## Configure Custom Log Directory

```bash
./scripts/start-node-app-with-logdir.sh app-logs
```

## Run Application Using Dedicated Service User

```bash
sudo ./scripts/start-node-app-service-user.sh
```

---

# Environment Variables

Example environment variables used by the scripts:

```bash
APP_ENV=dev
DB_USER=myuser
DB_PWD=mysecret
LOG_DIR=/path/to/log/directory
```

---

# Security Best Practices

Sensitive files and credentials should never be committed to Git repositories.

Examples include:

- `.env` files
- SSH private keys
- API tokens
- production credentials
- cloud provider secrets

Recommended secret management solutions:

- GitHub Actions Secrets
- GitLab CI/CD Variables
- Jenkins Credentials
- AWS Secrets Manager
- HashiCorp Vault
- Kubernetes Secrets

---

# DevOps Concepts Demonstrated

- Linux system administration
- Bash scripting automation
- process management
- environment variable management
- artifact handling
- service users
- background process execution
- application log management
- Git workflows
- remote Linux server operations

---

# Future Improvements

- Docker containerization
- CI/CD pipeline integration
- Infrastructure as Code (Terraform)
- Kubernetes deployment automation
- monitoring and observability integration

---

# Author

DevOps Engineering Portfolio Project