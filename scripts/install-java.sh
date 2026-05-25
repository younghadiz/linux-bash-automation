#!/bin/bash

echo "Updating package index..."
sudo apt update

echo "Installing latest default Java runtime..."
sudo apt install -y default-jre

echo "Checking Java installation..."

java_output=$(java -version 2>&1)
java_version=$(echo "$java_output" | grep "java version\|openjdk version" | awk '{print substr($3,2,2)}')

if [ "$java_version" == "" ]; then
    echo "Java installation failed. No Java version found."
elif [ "$java_version" == "1." ]; then
    echo "An old Java version is installed. Java version is lower than 11."
elif [ "$java_version" -ge 11 ]; then
    echo "Java installation successful. Java version 11 or higher is installed."
    java -version
else
    echo "Java version detected, but could not confirm it is version 11 or higher."
    java -version
fi