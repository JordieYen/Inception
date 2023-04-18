#!/bin/sh

echo "USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE DATABASE $MYSQL_DATABASE_NAME;
CREATE USER '$MYSQL_ADMIN_USER'@'localhost' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_ADMIN_USER'@'localhost';
CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT PRIVILEGE ON $MYSQL_DATABASE_NAME.table TO '$MYSQL_USER'@'localhost';
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO '$MYSQL_USER'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;" > tools/change_pword.txt

mysql_install_db --basedir=/usr --user=mysql > /dev/null
mysqld --user=mysql --bootstrap < tools/change_pword.txt
mysqld_safe