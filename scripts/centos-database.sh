#!/bin/bash

# Install mysql
yum install -y mysql mysql-server mysql-devel

# Adding mysqld service to start up at system boot
chkconfig --add mysqld
chkconfig mysqld on

# Allow inbound traffic on port 3306
iptables -I INPUT 3 -p tcp --dport 3306 -j ACCEPT
/etc/init.d/iptables save

# Start mysqld
service mysqld start
