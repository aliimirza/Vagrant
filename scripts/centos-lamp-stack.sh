# Vagrant provisioning script for LAMP installation on CentOS

# Install OS updates, exclude kernel updates
yum update -y --exclude=kerner

# Install Apache
yum install httpd httpd-devel httpd-tools -y

# Adding httpd service to start up at system boot
chkconfig --add httpd
chkconfig httpd on

# Removing 
service httpd stop
rm -rf /var/www/html

# Creating soft link of /var/www/html to /vagrant
ln -s /vagrant /var/www/html

# opening port 80 to public
iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT
/etc/init.d/iptables save

# Installing php
yum install -y php php-cli php-common php-devel php-mysql

# Install mysql
yum install -y mysql mysql-server mysql-devel

# Adding mysqld service to start up at system boot
chkconfig --add mysqld
chkconfig mysqld on

# Starting httpd
service httpd start


