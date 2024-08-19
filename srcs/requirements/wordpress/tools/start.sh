#!/bin/bash

# 等待 MariaDB 容器启动和准备就绪
until mysql -h mariadb -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" -e "SHOW DATABASES;" > /dev/null 2>&1; do
  echo "Waiting for MariaDB to be ready..."
  sleep 5
done

# 执行 WordPress 安装
wp core install \
  --url="https://yugao.com" \
  --title="${WP_TITLE}" \
  --admin_user="${WP_ADMIN_USER}" \
  --admin_password="${WP_ADMIN_PASSWORD}" \
  --admin_email="${WP_ADMIN_EMAIL}" \
  --path=/var/www/html --allow-root

# 创建用户
wp user create "${WP_USER}" "${WP_USER_EMAIL}" --role=author --user_pass="${WP_USER_PASSWORD}" --path=/var/www/html --allow-root

# 启动 PHP-FPM
php-fpm7.3 --nodaemonize

