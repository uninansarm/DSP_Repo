#!/bin/bash
sed -i -e s/bind-address.*/bind-address\=\ \ 0\.\0\.\0\.0/g /etc/mysql/my.cnf
