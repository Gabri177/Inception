DOCKER_COMPOSE = docker-compose -f srcs/docker-compose.yml

all: up
	@if [ ! -d /home/yugao/data/mariadb ]; then mkdir -p /home/yugao/data/mariadb; fi
	@if [ ! -d /home/yugao/data/wordpress ]; then mkdir -p /home/yugao/data/wordpress; fi

up:
	$(DOCKER_COMPOSE) up --build -d

down:
	$(DOCKER_COMPOSE) down --volumes --remove-orphans

restart: down up

clean:
	$(DOCKER_COMPOSE) down --rmi all --volumes --remove-orphans

re: clean all

.PHONY: all up down restart clean re
