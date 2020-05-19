#!/bin/bash

# Ensure we are being ran as root
if [ $(id -u) -ne 0 ]; then
	echo "This script must be ran as root"
	exit 1
fi

apt-get update
apt-get install -y secure-delete tor i2p i2p-router tor-geoipdb # install dependencies

# Configure and install the .deb
dpkg-deb -b anonsurf-deb-src/ anonsurf.deb # Build the deb package
dpkg -i anonsurf.deb || (apt-get -f install && dpkg -i anonsurf.deb) # this will automatically install the required packages

exit 0
