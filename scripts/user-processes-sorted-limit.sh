#!/bin/bash

echo -n "Would you like to sort the processes by memory or CPU? (m/c): "
read sortby

echo -n "How many results do you want to display?: "
read lines

if [ "$sortby" = "m" ]; then
    ps aux --sort -rss | grep -i "$USER" | grep -v grep | head -n "$lines"
elif [ "$sortby" = "c" ]; then
    ps aux --sort -%cpu | grep -i "$USER" | grep -v grep | head -n "$lines"
else
    echo "No valid input provided. Exiting."
fi