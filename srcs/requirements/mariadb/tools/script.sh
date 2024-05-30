#!/bin/bash

service mariadb start 
sleep 2
mysql -e "CREATE DATABASE IF NOT EXISTS $db_name ;"

mysql -e "CREATE USER IF NOT EXISTS '$db_user'@'locahost' IDENTIFIED BY '$db_pwd';"

mysql -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'localhost' IDENTIFIED BY '$db_pwd';"

mysql -e "FLUSH PRIVILEGES;"

service mariadb stop

exec mysqld_safe

#there may be a problem  