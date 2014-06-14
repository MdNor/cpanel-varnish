#!/bin/bash

# Stop Varnish and disable autostart at reboot
service varnish stop
chkconfig varnish off

# Restore Apache default config
cp /usr/local/apache/conf/httpd.conf.bak /usr/local/apache/conf/httpd.conf

# Restart Apache
service apache restart

# Make sure Apache run on port 80 & Varnish not running
netstat -plnt | grep 80

exit
