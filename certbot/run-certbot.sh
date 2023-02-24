#!/bin/bash

letsencrypt certonly --webroot --webroot-path /var/www/  --renew-by-default -d "$CN" --agree-tos --email "$EMAIL" --non-interactive --text

IFS=',' read -ra ADDR <<< "$CN"
cp /etc/letsencrypt/archive/"$CN"/cert1.pem /var/certs/"$CN"-cert1.pem
cp /etc/letsencrypt/archive/"$CN"/chain1.pem /var/certs/chain1.pem
cp /etc/letsencrypt/archive/"$CN"/fullchain1.pem /var/certs/fullchain1.pem
cp /etc/letsencrypt/archive/"$CN"/privkey1.pem /var/certs/"$CN"-privkey1.pem