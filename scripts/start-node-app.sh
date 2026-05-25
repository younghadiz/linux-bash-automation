#!/bin/bash

set -e

ARTIFACT_URL="https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz"
ARTIFACT_NAME="bootcamp-node-envvars-project-1.0.0.tgz"

echo "Updating package index..."
sudo apt update

echo "Installing NodeJS, NPM, curl, and wget..."
sudo apt install -y nodejs npm curl wget

echo "NodeJS version installed:"
node --version

echo "NPM version installed:"
npm --version

echo "Downloading NodeJS application artifact..."
wget -O "$ARTIFACT_NAME" "$ARTIFACT_URL"

echo "Extracting artifact..."
rm -rf package
tar zxvf "$ARTIFACT_NAME"

echo "Setting application environment variables..."
export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

echo "Changing into package directory..."
cd package

echo "Installing application dependencies..."
npm install

echo "Starting NodeJS application in background..."
nohup node server.js > app-console.log 2>&1 &

echo "NodeJS application start command executed."
echo "Check app-console.log for application output."