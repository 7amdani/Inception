#!/bin/bash


service mariadb start 

sleep 1

mysql -e "CREATE DATABASE IF NOT EXISTS $db_name ;"

mysql -e "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pwd';"

mysql -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' IDENTIFIED BY '$db_pwd';"

mysql -e "FLUSH PRIVILEGES;"

service mariadb stop

exec mysqld_safe

#there may be a problem  