#!/bin/bash

# Server IP
ip=`ifconfig eth0 | grep 'inet addr' | awk {'print $2'} | sed s/.*://`

# Install Varnish

# Make Varnish listen to port 80
sed -i 's/6081/80/g' /etc/default/varnish

# Set Varnish default VCL to listen to Apache on port 8080
mv /etc/varnish/default.vcl /etc/varnish/default.vcl.bak
wget https://raw.githubusercontent.com/ronwl/cpanel-varnish/master/varnish-default
mv varnish-default /etc/varnish/default.vcl

# Make Apache listen to port 8080
cp /usr/local/apache/conf/httpd.conf /usr/local/apache/conf/httpd.conf.bak
sed -i 's/80/8080/g' /usr/local/apache/conf/httpd.conf

# Restart Apache & Varnish
service apache restart
service varnish restart

# Make sure Apache run on port 8080 & Varnish running on port 80
netstat -plnt | grep 8080
netstat -plnt | grep 80

exit
