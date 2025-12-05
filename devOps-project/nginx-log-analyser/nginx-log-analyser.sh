#!/bin/bash

# Nginx Log Analyser
# update

## load for website https://gist.githubusercontent.com/kamranahmedse/e66c3b9ea89a1a030d3b739eeeef22d0/raw/77fb3ac837a73c4f0206e78a236d885590b7ae35/nginx-access.log

if [ $# -eq 0 ]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

LOG_FILE="$1"

echo "Analysing Nginx log file: $LOG_FILE"

# Top 5 IP addresses with the most requests
echo -e "\nTop 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5 | awk '{print $2, "-", $1, "requests"}'

# Top 5 most requested paths
echo -e "\nTop 5 most requested paths:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5 | awk '{print $2, "-", $1, "requests"}'

# Top 5 response status codes
echo -e "\nTop 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5 | awk '{print $2, "-", $1, "requests"}'

# Top 5 user agents
echo -e "\nTop 5 user agents:"
awk -F\" '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5 | awk '{print $2, "-", $1, "requests"}'
