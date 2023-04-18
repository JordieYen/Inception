FROM	debian:buster

RUN		apt-get update && apt-get install -y wget unzip

COPY 	tools tools
RUN 	chmod 777 tools/wordpress-setup.sh

CMD		["./tools/wordpress-setup.sh"]