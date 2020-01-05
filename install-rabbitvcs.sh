#!/bin/bash

sudo chown -R $USER:$USER ~/.config/rabbitvcs
sudo add-apt-repository -r ppa:rabbitvcs/ppa
sudo apt update
sudo apt install rabbitvcs-nautilus rabbitvcs-core
nautilus -q
sudo apt install git
