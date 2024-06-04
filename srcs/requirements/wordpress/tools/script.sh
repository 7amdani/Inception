#!/bin/bash

sleep 3

wp core download --allow-root

wp config create --dbname=$db_name --dbuser=$db_user --dbpass=$db_pwd --dbhost=$db_host --allow-root

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --allow-root

wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

mkdir /run/php

/usr/sbin/php-fpm7.4 -F