#!/bin/bash

set -e

ARTIFACT_URL="https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz"
ARTIFACT_NAME="bootcamp-node-envvars-project-1.0.0.tgz"

if [ -z "$1" ]; then
    echo "Usage: ./start-node-app-logdir.sh <log_directory>"
    exit 1
fi

LOG_DIRECTORY="$1"

echo "Updating package index..."
sudo apt update

echo "Installing NodeJS, NPM, wget, and net-tools..."
sudo apt install -y nodejs npm wget net-tools

echo "NodeJS version installed:"
node --version

echo "NPM version installed:"
npm --version

echo "Checking log directory..."
if [ -d "$LOG_DIRECTORY" ]; then
    echo "Log directory already exists: $LOG_DIRECTORY"
else
    echo "Creating log directory: $LOG_DIRECTORY"
    mkdir -p "$LOG_DIRECTORY"
fi

ABS_LOG_DIRECTORY=$(realpath "$LOG_DIRECTORY")

echo "LOG_DIR absolute path is: $ABS_LOG_DIRECTORY"

echo "Downloading NodeJS application artifact..."
wget -O "$ARTIFACT_NAME" "$ARTIFACT_URL"

echo "Extracting artifact..."
rm -rf package
tar zxvf "$ARTIFACT_NAME"

echo "Setting required environment variables..."
export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret
export LOG_DIR="$ABS_LOG_DIRECTORY"

echo "Changing into package directory..."
cd package

echo "Installing application dependencies..."
npm install

echo "Starting NodeJS application in background..."
nohup node server.js > "$ABS_LOG_DIRECTORY/app-console.log" 2>&1 &

sleep 5

echo "Checking running NodeJS process..."
ps aux | grep node | grep -v grep || true

echo "Checking listening port..."
netstat -ltnp | grep node || true

echo "Checking log directory contents..."
ls -l "$ABS_LOG_DIRECTORY"

echo "If the app started correctly, check:"
echo "$ABS_LOG_DIRECTORY/app.log"
echo "$ABS_LOG_DIRECTORY/app-console.log"