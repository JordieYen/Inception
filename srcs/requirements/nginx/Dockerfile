FROM	debian:buster

RUN		apt-get update && apt-get install -y nginx 
# RUN		apt-get -y install openssl

COPY	tools/index.html /usr/share/nginx/html
COPY	conf/nginx.conf /etc/nginx/conf.d

CMD		["nginx", "-g", "daemon off;"]