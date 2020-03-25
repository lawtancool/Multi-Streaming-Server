#!/usr/bin/env bash

# Make sure Nginx configuration file is correct
/usr/sbin/nginx -t -c /usr/local/nginx/conf/nginx.conf

if [[ $? != 0 ]]; then
	echo "Error: Nginx's configuration file contains some errors."
	exit 1;
fi

#/etc/init.d/nginx-conf-watcher start

exec nginx
