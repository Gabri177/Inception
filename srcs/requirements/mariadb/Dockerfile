FROM debian:buster

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD


RUN apt update -y && apt install -y \
	mariadb-server

# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld /var/lib/mysql
RUN chmod 777 /var/run/mysqld

RUN service mysql start && mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" \
&& mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" \
&& mysql -e "SET PASSWORD FOR '${MYSQL_USER}'@'%'=PASSWORD('${MYSQL_PASSWORD}');" \
&& mysql -e "FLUSH PRIVILEGES;"

#COPY ./conf/init.sql .

#RUN sed -i "s/NAME/${MYSQL_DATABASE}/g" ./init.sql && \
#    sed -i "s/USER/${MYSQL_USER}/g" ./init.sql && \
#    sed -i "s/PASSWD/${MYSQL_PASSWORD}/g" ./init.sql && \
#    sed -i "s/ROOTPW/${MYSQL_ROOT_PASSWORD}/g" ./init.sql

# COPY ./tools/start.sh .

# RUN  chmod +x ./start.sh
#RUN service mysql start && mysql < ./init.sql

EXPOSE 3306

# ENTRYPOINT ["bash", "start.sh"]

# VOLUME ["/var/lib/mysql"]

CMD ["mysqld", "--bind-address=0.0.0.0"]

