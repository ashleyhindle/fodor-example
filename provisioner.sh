#!/bin/bash
apt-get -y update
apt-get -y install nginx
rm /etc/nginx/sites-enabled/default

# Having to escape bash variables isn't good enough.  Better way?
cat << EOF > /etc/nginx/sites-enabled/fodor-example
	server {
		listen 80 default_server;
                listen [::]:80 default_server ipv6only=on;
		root /var/www/fodor-example/;
		index index.html index.htm;

		server_name _;

		location / {
			try_files \$uri \$uri/ /index.html;
		}
	}
EOF
