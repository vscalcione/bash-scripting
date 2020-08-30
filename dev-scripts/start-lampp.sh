#!/bin/bash

# This script allows the lampp's server to run correctly
sudo service apache2 stop
echo "Apache2 service stopped"
sudo /opt/lampp/lampp start
echo "Lampp Server started successfully"
