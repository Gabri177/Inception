FROM debian:buster

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG WP_TITLE
ARG WP_ADMIN_USER
ARG WP_ADMIN_PASSWORD
ARG WP_ADMIN_EMAIL
ARG WP_USER
ARG WP_USER_EMAIL
ARG WP_USER_PASSWORD

RUN apt update -y
RUN apt install php7.3 php-mysqli php-fpm mariadb-client curl -y

RUN mkdir -p /run/php \
    && chown -R www-data:www-data /run/php
RUN mkdir -p /var/www/html \
    && chown -R www-data:www-data /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp cli update

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/wp.sh ./

RUN chmod +x ./wp.sh

EXPOSE 9000

ENTRYPOINT ["./wp.sh"]

