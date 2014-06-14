#!/bin/bash

# Install Varnish
# If its not available by default, install EPEL repository
## su -c 'rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm'
yum install -y varnish

# Make Varnish listen to port 80
cp /etc/sysconfig/varnish /etc/sysconfig/varnish.bak # Always make backup
sed -i 's/VARNISH_LISTEN_PORT=6081/VARNISH_LISTEN_PORT=80/g' /etc/sysconfig/varnish

# Set Varnish default VCL to listen to Apache on port 8080
mv /etc/varnish/default.vcl /etc/varnish/default.vcl.bak # Always make backup
wget https://raw.githubusercontent.com/ronwl/cpanel-varnish/master/varnish-default
mv varnish-default /etc/varnish/default.vcl

# Make Apache listen to port 8080
cp /usr/local/apache/conf/httpd.conf /usr/local/apache/conf/httpd.conf.bak # Always make backup
sed -i 's/:80/:8080/g' /usr/local/apache/conf/httpd.conf

# Start Apache & Varnish
service apache restart
chkconfig varnish on # Set Varnish to run automatically after reboot
service varnish start

# Make sure Apache run on port 8080 & Varnish running on port 80
netstat -plnt | grep 80

exit
