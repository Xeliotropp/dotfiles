#!/bin/bash
# Your script logic here
result=$(asusctl profile -p)

if [ $? -eq 0 ]; then
    notify-send "Success" "Command completed successfully"
else
    notify-send -u critical "Error" "Command failed"
fi
