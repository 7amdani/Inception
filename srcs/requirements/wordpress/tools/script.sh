#!/bin/bash

sleep 8
cd /var/www/html

wp core download --allow-root

# mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
wp config create --dbname=$db_name --dbuser=$db_user --dbpass=$db_pwd --dbhost=$db_host --allow-root
wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root


# uses the sed command to modify the www.conf file in the /etc/php/7.4/fpm/pool.d directory. The s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g command substitutes the value 9000 for /run/php/php7.4-fpm.sock throughout the file. This changes the socket that PHP-FPM listens on from a Unix domain socket to a TCP port.
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

# creates the /run/php directory, which is used by PHP-FPM to store Unix domain sockets.
mkdir /run/php

php-fpm7.4 -F