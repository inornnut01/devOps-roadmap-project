#!/bin/bash

# Update System
echo "Updating system..."
sudo yum update -y

# Install required dependencies
echo "Installing required dependencies..."
sudo yum install -y curl bash

# Download and run Netdata's installer script
echo "Installing Netdata..."
curl https://get.netdata.cloud/kickstart.sh > /tmp/netdata-kickstart.sh && sh /tmp/netdata-kickstart.sh -y

# Start and enable the Netdata service
echo "Starting and enabling Netdata service..."
sudo systemctl start netdata
sudo systemctl enable netdata

echo "Checking Netdata service status..."
sudo systemctl status netdata --no-pager

echo "Netdata installation complete!"