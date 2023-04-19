FROM	debian:buster

RUN		apt-get update && apt-get install -y mariadb-server

COPY 	tools tools
RUN 	chmod 777 tools/mariadb-setup.sh

CMD		["./tools/mariadb-setup.sh"]