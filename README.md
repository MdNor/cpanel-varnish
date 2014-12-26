## cpanel-varnish

Install Varnish on cPanel server to serve static files.

---

#### Installation

````bash
wget https://raw.githubusercontent.com/MdNor/cpanel-varnish/master/install.sh
````

````bash
sh install.sh
````

---

#### Get The Setting Right

You can play around with Varnish setting to get best result based on your preferences
````bash
nano /etc/varnish/default.vcl
````

You can validate the setting before applying
````bash
varnishd -C -f /etc/varnish/default.vcl
````

To apply the setting, restart Varnish
````bash
service Varnish restart
````

---

#### Uninstall

In case you want to reverse the setting and uninstall Varnish

````bash
wget https://raw.githubusercontent.com/ronwl/cpanel-varnish/master/uninstall.sh
````

````bash
sh uninstall.sh
````
