FROM	debian:buster

RUN		apt-get update && apt-get install -y mariadb-server

COPY 	tools tools
RUN 	chmod 777 tools/run.sh

CMD		["./tools/run.sh"]