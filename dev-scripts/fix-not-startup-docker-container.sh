#!/bin/bash

sudo service docker stop
sudo cd /var/run/docker/libcontainerd
sudo rm -rf containerd/*
sudo rm -rf docker-container.pid
sudo service docker start
