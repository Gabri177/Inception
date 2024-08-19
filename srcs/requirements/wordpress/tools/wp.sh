#!/bin/sh

cd /var/www/html


if [ ! -f wp-config.php ]; then
    wp core download --allow-root

    wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root

    wp core install --url=https://yugao --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root

    wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root
else
    echo "WordPress is already installed, updating user and password..."

    wp user update $WP_ADMIN_USER --user_pass=$WP_ADMIN_PASSWORD --allow-root
	
    wp user update $WP_USER --user_pass=$WP_USER_PASSWORD --allow-root
fi

/usr/sbin/php-fpm7.3 -F -R
