#!/bin/sh

if [ -d "/var/www/html/jking-ye.com" ]
then
  echo "/var/www/html/jking-ye filled"
else
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
  cd var && mkdir -p www
  cd www && mkdir -p html
  cd html && mkdir jking-ye.com
  cd jking-ye.com
  wp core download --allow-root
  wp config create --dbname=$MYSQL_DATABASE_NAME --dbuser=$MYSQL_ADMIN_USER --dbpass=$MYSQL_ADMIN_PASSWORD --dbhost=db_container --allow-root
  wp core install --url=jking-ye.42.fr --title=bruh --admin_user=$MYSQL_ADMIN_USER --admin_password=$MYSQL_ADMIN_PASSWORD --admin_email=$MYSQL_ADMIN_USER@example.com --allow-root
  wp user create jking-ye jking-ye@example.com --role=subscriber --allow-root
fi

cd /
chown -R www-data:www-data /var/www/html/jking-ye.com
chmod -R 755 /var/www/html/jking-ye.com
sed -i s/\\/run\\/php\\/php7\\.3-fpm\\.sock/9000/g /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /run/php

/usr/sbin/php-fpm7.3 -F