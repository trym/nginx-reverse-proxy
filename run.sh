#!/bin/bash

echo "Configuring Nginx Reverse Proxy..."
sed -i "s/_REPLACE_ME_HOST_/$REVERSE_DOMAIN/g" /etc/nginx/nginx.conf
sed -i "s/_REPLACE_ME_PROTO_/$REVERSE_PROTO/g" /etc/nginx/nginx.conf

echo "Starting Nginx Reverse Proxy..."
exec /usr/sbin/nginx & tail -F /var/log/nginx/*