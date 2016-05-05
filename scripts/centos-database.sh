#!/bin/bash

# Install mysql
yum install -y mysql mysql-server mysql-devel

# Adding mysqld service to start up at system boot
chkconfig --add mysqld
chkconfig mysqld on

