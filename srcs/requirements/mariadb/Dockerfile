FROM debian:buster

RUN apt-get update && apt-get install -y \

	mariadb-server \
	mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

# RUN sed -i 's/^bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld /var/lib/mysql

COPY ./tools/init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306

# VOLUME ["/var/lib/mysql"]

CMD ["mysqld", "--bind-address=0.0.0.0"]

