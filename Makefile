COMPOSE_PATH = srcs/docker-compose.yml
MAC_COMPOSE_PATH = srcs/docker-compose-mac.yml

all:
	docker-compose -f $(COMPOSE_PATH) up --build -d

mac:
	mkdir $(HOME)/data
	mkdir $(HOME)/data/mariadb
	mkdir $(HOME)/data/wordpress
	docker-compose -f $(MAC_COMPOSE_PATH) up --build -d

print:
	docker-compose -f $(COMPOSE_PATH) up --build

check:
	@docker ps
	@docker image ls

re:
	docker-compose -f $(COMPOSE_PATH) down
	docker-compose -f $(COMPOSE_PATH) up --build -d

clean:
	docker-compose -f $(COMPOSE_PATH) down

fclean:
	docker-compose -f $(COMPOSE_PATH) down
	docker system prune -a
	rm -rf /home/jordie/data
	docker volume rm `docker volume ls -q`

macclean:
	docker-compose -f $(MAC_COMPOSE_PATH) down
	docker system prune -a
	rm -rf $(HOME)/data
	docker volume rm `docker volume ls -q`