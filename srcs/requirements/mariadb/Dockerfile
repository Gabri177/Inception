FROM debian:buster

RUN apt-get update && apt-get install -y \

	mariadb-server && \
	rm -rf /var/lib/apt/lists/*

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld /var/lib/mysql

#COPY ./conf/init.sql .

#RUN sed -i "s/NAME/${MYSQL_DATABASE}/g" ./init.sql && \
#    sed -i "s/USER/${MYSQL_USER}/g" ./init.sql && \
#    sed -i "s/PASSWD/${MYSQL_PASSWORD}/g" ./init.sql && \
#    sed -i "s/ROOTPW/${MYSQL_ROOT_PASSWORD}/g" ./init.sql

COPY ./tools/start.sh .

RUN  chmod +x ./start.sh
#RUN service mysql start && mysql < ./init.sql

EXPOSE 3306

ENTRYPOINT ["bash", "start.sh"]

# VOLUME ["/var/lib/mysql"]

CMD ["mysqld", "--bind-address=0.0.0.0"]

