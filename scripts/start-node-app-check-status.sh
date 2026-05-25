#!/bin/bash

set -e

ARTIFACT_URL="https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz"
ARTIFACT_NAME="bootcamp-node-envvars-project-1.0.0.tgz"

echo "Updating package index..."
sudo apt update

echo "Installing NodeJS, NPM, wget, and net-tools..."
sudo apt install -y nodejs npm wget net-tools

echo "NodeJS version installed:"
node --version

echo "NPM version installed:"
npm --version

echo "Downloading NodeJS application artifact..."
wget -O "$ARTIFACT_NAME" "$ARTIFACT_URL"

echo "Extracting artifact..."
rm -rf package
tar zxvf "$ARTIFACT_NAME"

echo "Setting required environment variables..."
export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

echo "Changing into package directory..."
cd package

echo "Installing application dependencies..."
npm install

echo "Starting NodeJS application in background..."
nohup node server.js > app-console.log 2>&1 &

sleep 5

echo "Checking running NodeJS process..."
ps aux | grep node | grep -v grep || true

echo "Checking listening port..."
netstat -ltnp | grep node || true

echo "Application status check completed." 