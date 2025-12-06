#!/bin/bash

sudo yum install -y stress
echo "Starting the test dashboard..."

# CPU
echo "CPU usage..."
top -bn1 | grep "%Cpu(s):" | cut -d ',' -f 4 | awk '{print "Usage: "100-$1"%"}'

echo "Running a stress test (CPU)"
stress --cpu 4 --timeout 60

# memory usage
echo "Memory usage..."
free | grep "Mem:" -w | awk '{printf "Total: %.1fGi\nUsed: %.1fGi (%.2f%%)\nFree: %.1fGi (%.2f%%)\n",$2/1024^2, $3/1024^2, $3/$2 * 100, $4/1024^2, $4/$2 * 100}'

echo "Running memory load test..."
stress --vm 1 --vm-bytes 256M --timeout 60

# Check the Netdata dashboard
echo "Load test complete. You can now check your Netdata dashboard at http://$(hostname -I | awk '{print $1}'):19999/"
