FROM	debian:buster

RUN		apt-get update && apt-get install -y wget unzip
RUN		apt-get -y install php
RUN		apt-get install -y php7.3-fpm php-mysql

COPY 	tools tools
RUN 	chmod 777 tools/wordpress-setup.sh

CMD		["./tools/wordpress-setup.sh"]