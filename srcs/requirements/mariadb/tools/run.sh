#!/bin/sh

echo "USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT PRIVILEGE ON database.table TO '$MYSQL_USER'@'localhost';
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO '$MYSQL_USER'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;" > tools/change_pword.txt

mysql_install_db --basedir=/usr --user=mysql > /dev/null
mysqld --user=mysql --bootstrap < tools/change_pword.txt
mysqld_safe