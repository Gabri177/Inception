#!/bin/bash

service mysql start

until mysqladmin ping -h "localhost" --silent; do
  echo "Waiting for MariaDB to be ready..."
  sleep 2
done

mysql -e "CREATE USER 'default'@'%' IDENTIFIED BY '54321'"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'default'@'%'"
mysql -e "CREATE DATABASE ${MYSQL_DATABASE}"
mysql -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%'"
mysql -e "FLUSH PRIVILEGES"
mysql -e "USE mysql"
mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');"
mysql -e "FLUSH PRIVILEGES"
service mysql stop
exec "$@"
