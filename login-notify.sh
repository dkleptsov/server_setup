#!/bin/bash
    
# prepare any message you want
hostname="$(hostname)"
login_name="$(whoami)"
login_ip="$(echo $SSH_CONNECTION | cut -d " " -f 1)"
login_date="$(date +"%e %b %Y, %a %r")"

# For new line I use $'\n' here
message="ssh login to "$'\n'"$hostname"$'\n'"$login_name"$'\n'"$login_ip"$'\n'"$login_date"

#send it to telegram
telegram-send "$message"