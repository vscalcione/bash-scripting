#!/bin/bash

# Set a logger
logger "$0"

# Set whiptail's window dimensions
VMOD=10
HMOD=70

# Ask user's proceed authorization 
whiptail --title "New CSR creation on Apache2" \
	 --yesno "This script drive you into creation of a new CSR. Do you proceed?" \
	 $VMOD $HMOD



