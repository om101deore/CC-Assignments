#!/bin/bash
percentage_usage=$(df | grep "p5" | grep "[0-9]*%" --only-matching)
percentage_usage=$(echo "$percentage_usage" | sed s'/.$//')
echo "$percentage_usage"

if [[ $percentage_usage -gt 90 ]]; then
    # send mail
    message="Disk usage on the system has exceeded 90% threshold. Current usage is $percentage_usage %" 
    echo "$message" | mail -s "Disk usage alert" admin@email.com
fi

