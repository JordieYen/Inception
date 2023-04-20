#!/bin/sh

if [ -d "/var/www/html/jking-ye.com" ]
then
  echo "/var/www/html/jking-ye filled"
else
  cd var
  mkdir www
  cd www
  mkdir html
  cd html
  wget https://wordpress.org/latest.zip 
  unzip latest.zip
  mv wordpress jking-ye.com
  rm latest.zip
  cd jking-ye.com
  sed 's/database_name_here/'$MYSQL_DATABASE_NAME'/g' wp-config-sample.php | \
  sed 's/username_here/'$MYSQL_ADMIN_USER'/g' | \
  sed 's/password_here/'$MYSQL_ADMIN_PASSWORD'/g' | \
  sed 's/localhost/'db_container'/g' > wp-config.php
fi

cd ~/..
chown -R www-data:www-data /var/www/html/jking-ye.com
chmod -R 755 /var/www/html/jking-ye.com
sed -i s/\\/run\\/php\\/php7\\.3-fpm\\.sock/9000/g /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /run/php

/usr/sbin/php-fpm7.3 -F