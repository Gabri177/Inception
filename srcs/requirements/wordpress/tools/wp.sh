#!/bin/sh

cd /var/www/html

if [ ! -f wp-config.php ]; then
    wp core download --allow-root
fi

wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --skip-check --force --allow-root

if wp core is-installed --allow-root; then
    echo "WordPress is already installed, updating configuration..."
else
    wp core install --url=https://yugao.42.fr --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
fi

if wp user get $WP_ADMIN_USER --field=ID --allow-root > /dev/null 2>&1; then
    echo "Updating password for existing admin user $WP_ADMIN_USER..."
    wp user update $WP_ADMIN_USER --user_pass=$WP_ADMIN_PASSWORD --allow-root
else
    echo "Admin user $WP_ADMIN_USER does not exist. Creating..."
    wp user create $WP_ADMIN_USER $WP_ADMIN_EMAIL --role=administrator --user_pass=$WP_ADMIN_PASSWORD --allow-root
fi


if wp user get $WP_USER --field=ID --allow-root > /dev/null 2>&1; then
    echo "Updating password for existing user $WP_USER..."
    wp user update $WP_USER --user_pass=$WP_USER_PASSWORD --allow-root
else
    echo "Creating new user $WP_USER..."
    wp user create $WP_USER example@example.com --role=author --user_pass=$WP_USER_PASSWORD --allow-root
fi

/usr/sbin/php-fpm7.3 -F -R
