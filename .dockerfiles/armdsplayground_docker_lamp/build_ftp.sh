#!/bin/bash
apt-get source -y pure-ftpd
apt-get build-dep -y pure-ftpd
# cp /rules /etc/pure-ftpd/pure-ftpd-1.0.36/debian/rules
cd /etc/pure-ftpd/pure-ftpd-1.0.36
dpkg-buildpackage -uc -b
dpkg -i ../pure-ftpd_1.0.1-8_i386.deb
