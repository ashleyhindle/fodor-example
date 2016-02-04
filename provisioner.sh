#!/bin/bash
apt-get -y update
apt-get -y install nginx
rm /etc/nginx/sites-enabled/default

cat << EOF > /etc/nginx/sites-enabled/fodor-example.conf
	server {
		listen 80 default_server;
		root /var/www/fodor-example/;
		index index.html;

		server_name _;

		location / {
			try_files $uri $uri/ =404;
		}
	}
EOF
