#!usr/bin/bash
publicip=`curl ifconfig.co`
echo "<p1>My Public IP is $publicip</p1>" >/usr/share/httpd/noindex/index.html
