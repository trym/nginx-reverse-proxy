#!/bin/bash

echo "Configuring Nginx Reverse Proxy..."
sed -i "s/_REPLACE_ME_/$REVERSE_DOMAIN/g" /etc/nginx/nginx.conf

echo "Starting Nginx Reverse Proxy..."
exec /usr/sbin/nginx & tail -F /var/log/nginx/*