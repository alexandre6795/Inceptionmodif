WORD_DIR = /home/akastler/data/wordpress
MARIA_DIR = /home/akastler/data/mariadb


all: build up

build:
	@sudo mkdir -p $(WORD_DIR)
	@sudo mkdir -p $(MARIA_DIR)
	@docker-compose -f ./srcs/docker-compose.yml build
	@echo "Inception is ready for up"

up:
	@docker-compose -f ./srcs/docker-compose.yml up -d
	@echo "Inception is now up"

down:
	@docker-compose -f ./srcs/docker-compose.yml down
	@echo "Inception is down"

logs:
	@docker-compose -f ./srcs/docker-compose.yml logs

clean: down
	@docker system prune -f
	@docker volume rm srcs_mariadb
	@docker volume rm srcs_wordpress
	@sudo rm -rf /home/akastler/data/wordpress/*
	@sudo rm -rf /home/akastler/data/mariadb/*
	@echo "Inception is cleaned"

fclean: clean
	@docker image rm srcs_wordpress
	@docker image rm srcs_nginx
	@docker image rm srcs_mariadb
	@echo "Inception is fcleaned"

re: clean build up

fre:fclean build up
