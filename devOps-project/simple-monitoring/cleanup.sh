#!/bin/bash

echo "Stopping and disabling Netdata service..."
sudo systemctl stop netdata
sudo systemctl disable netdata

echo "Removing Netdata package..."
sudo yum remove -y netdata

echo "Removing Netdata configuration files..."
sudo rm -rf /etc/netdata
sudo yum remove -y netdata-repo-edge

echo "Checking if Netdata is still installed..."
rpm -qa | grep netdata

echo "Cleanup complete!"