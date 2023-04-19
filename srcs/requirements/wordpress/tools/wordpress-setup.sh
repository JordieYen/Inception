#!/bin/sh

echo "running bash file"

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
sed 's/username_here/'$MYSQL_USER'/g' | \
sed 's/password_here/'$MYSQL_PASSWORD'/g' | \
sed 's/localhost/'db_container'/g' > wp-config.php

echo "done"

while true; do
  :
done