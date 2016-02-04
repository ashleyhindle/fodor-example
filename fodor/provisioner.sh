#!/bin/bash
apt-get -y update
apt-get -y install nginx
rm /etc/nginx/sites-enabled/default

# This is run from the repo root, so must include the fodor dir even though the provisioner is in it
cp fodor/nginx/fodor-example /etc/nginx/sites-enabled/
