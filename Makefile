
all: build up

build:
	@sudo mkdir -p /home/aherrman/data/wordpress
	@sudo mkdir -p /home/aherrman/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml build
	@echo "Inception is ready for up"

up:
	@docker-compose -f ./srcs/docker-compose.yml up -d
	@echo "Inception is now up"a

down:
	@docker-compose -f ./srcs/docker-compose.yml down
	@echo "Inception is down"

logs:
	@docker-compose -f ./srcs/docker-compose.yml logs

clean: down
	@docker system prune -f -a
	@sudo rm -rf /home/aherrman/data/wordpress/*
	@sudo rm -rf /home/aherrman/data/mariadb/*
	@echo "Inception is cleaned"

re: clean build up

