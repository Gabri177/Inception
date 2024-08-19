DOCKER_COMPOSE = docker-compose -f srcs/docker-compose.yml

all: up
	@mkdir /home/yugao/data/mariadb
	@mkdir /home/yugao/data/wordpress
up:
	$(DOCKER_COMPOSE) up --build -d

down:
	$(DOCKER_COMPOSE) down --volumes --remove-orphans

restart: down up

clean:
	$(DOCKER_COMPOSE) down --rmi all --volumes --remove-orphans

re: clean all

.PHONY: all up down restart clean re
