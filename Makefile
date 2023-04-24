COMPOSE_PATH = srcs/docker-compose.yml
MAC_COMPOSE_PATH = srcs/docker-compose-mac.yml

all:
	docker-compose -f $(COMPOSE_PATH) up --build -d

mac:
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
	rm -rf data

macclean:
	docker-compose -f $(COMPOSE_PATH) down
	docker system prune -a
	rm -rf data