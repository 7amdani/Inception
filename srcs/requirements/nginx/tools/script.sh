#!/bin/bash

mkdir test

openssl req -x509 -newkey rsa:4096 -keyout /test/inception.key \
 -out /test/inception.crt -sha256 -days 30 -nodes \
 -subj "/C=MA/ST=BG/L=1337/O=42/OU=42/CN=42"

nginx -g "daemon off;"