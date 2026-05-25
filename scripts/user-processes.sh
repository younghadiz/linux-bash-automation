#!/bin/bash

echo "Processes running for current user: $USER"
ps aux | grep -i "$USER" | grep -v grep