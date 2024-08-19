FROM debian:buster

RUN apt-get update && apt-get install -y \
    php \
    php-fpm \
    php-mysql \
    curl \
    wget \
    unzip \
    mariadb-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php \
    && chown -R www-data:www-data /run/php
RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp cli update

RUN chown -R www-data:www-data /var/www/html

COPY ./conf/wp-config.php /var/www/html/wp-config.php
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/wp.sh ./

RUN chmod +x ./wp.sh

EXPOSE 9000

ENTRYPOINT ["./wp.sh"]

