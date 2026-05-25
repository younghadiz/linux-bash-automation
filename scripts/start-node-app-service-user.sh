#!/bin/bash

set -e

APP_USER="myapp"
ARTIFACT_URL="https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz"
ARTIFACT_NAME="bootcamp-node-envvars-project-1.0.0.tgz"

if [ -z "$1" ]; then
    echo "Usage: sudo ./start-node-app-service-user.sh <log_directory>"
    exit 1
fi

LOG_DIRECTORY="$1"

echo "Updating package index..."
apt update

echo "Installing nodejs, npm, curl, wget, and net-tools..."
apt install -y nodejs npm curl wget net-tools

echo "NodeJS version installed:"
node --version

echo "NPM version installed:"
npm --version

if id "$APP_USER" >/dev/null 2>&1; then
    echo "Service user $APP_USER already exists."
else
    echo "Creating service user $APP_USER..."
    useradd "$APP_USER" -m -s /bin/bash
fi

if [ -d "$LOG_DIRECTORY" ]; then
    echo "$LOG_DIRECTORY already exists."
else
    echo "Creating log directory $LOG_DIRECTORY..."
    mkdir -p "$LOG_DIRECTORY"
fi

ABS_LOG_DIRECTORY=$(realpath "$LOG_DIRECTORY")
chown "$APP_USER":"$APP_USER" "$ABS_LOG_DIRECTORY"

echo "Downloading application artifact as $APP_USER..."
runuser -l "$APP_USER" -c "wget -O $ARTIFACT_NAME $ARTIFACT_URL"

echo "Extracting application artifact..."
runuser -l "$APP_USER" -c "rm -rf package && tar zxvf $ARTIFACT_NAME"

echo "Starting NodeJS application as $APP_USER..."
runuser -l "$APP_USER" -c "
export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret
export LOG_DIR=$ABS_LOG_DIRECTORY
cd package
npm install
nohup node server.js > $ABS_LOG_DIRECTORY/app-console.log 2>&1 &
"

sleep 5

echo "Checking NodeJS process..."
ps aux | grep node | grep -v grep || true

echo "Checking listening port..."
netstat -ltnp | grep :3000 || true

echo "Checking app log file..."
ls -l "$ABS_LOG_DIRECTORY" || true