#!/bin/bash

echo -n "Would you like to sort the processes by memory or CPU? (m/c): "
read sortby

if [ "$sortby" = "m" ]; then
    ps aux --sort -rss | grep -i "$USER" | grep -v grep
elif [ "$sortby" = "c" ]; then
    ps aux --sort -%cpu | grep -i "$USER" | grep -v grep
else
    echo "No valid input provided. Exiting."
fi