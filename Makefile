COMPOSE_PATH = srcs/docker-compose.yml

all:
	docker-compose -f $(COMPOSE_PATH) up --build -d

print:
	docker-compose -f $(COMPOSE_PATH) up --build

re:
	docker-compose -f $(COMPOSE_PATH) down
	docker-compose -f $(COMPOSE_PATH) up --build -d

clean:
	docker-compose -f $(COMPOSE_PATH) down

fclean:
	docker system prune -a