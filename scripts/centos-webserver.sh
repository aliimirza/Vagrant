#!/bin/bash

# Install Apache
yum install httpd httpd-devel httpd-tools -y

# Adding httpd service to start up at system boot
chkconfig --add httpd
chkconfig httpd on

# Removing html folder from DocumentRoot to recreate as symlink to /vagrant shared folder
service httpd stop
rm -rf /var/www/html

# Creating soft link to /var/www/html of /vagrant
ln -s /vagrant /var/www/html

# Adding index.html and phpinfo.php files from GitHub
cd /vagrant
sudo -u vagrant wget https://raw.githubusercontent.com/aliimirza/Vagrant/master/files/index.html
sudo -u vagrant wget https://raw.githubusercontent.com/aliimirza/Vagrant/master/files/phpinfo.php

# opening port 80 to public
iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT
/etc/init.d/iptables save

# Installing php
yum install -y php php-cli php-common php-devel php-mysql
# Adding httpd service to start up at system boot

# Starting httpd
service httpd start
