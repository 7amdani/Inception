#!/bin/bash

mkdir test

openssl req -x509 -newkey rsa:4096 -keyout /test/inception.key -out /test/inception.crt -sha256 -days 3650 -nodes -subj \
 "/C=MO/L=BG/O=1337/OU=student/CN=yassine/UID=yahamdan"

nginx -g "daemon off;"