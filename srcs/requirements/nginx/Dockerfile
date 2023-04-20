FROM	debian:buster

RUN		apt-get update && apt-get install -y nginx 
RUN		apt-get -y install openssl

COPY	tools/index.html /usr/share/nginx/html
COPY	conf/nginx.conf /conf/

WORKDIR /etc/nginx/certs/
RUN		openssl genrsa 2048 > host.key
RUN		openssl req -batch -new -x509 -nodes -sha256 -days 365 -key host.key -out host.cert

CMD		["nginx", "-c", "/conf/nginx.conf", "-g", "daemon off;"]