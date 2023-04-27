#!/bin/sh

if [ -d "/var/lib/mysql" ]
then
	# if [ "$(ls -A /var/lib/mysql)" ]; then
    # 	echo "/var/lib/mysql filled"
	# else
    	echo "USE mysql;
		FLUSH PRIVILEGES;
		ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
		CREATE DATABASE $MYSQL_DATABASE_NAME;
		CREATE USER '$MYSQL_ADMIN_USER'@'localhost' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
		GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_ADMIN_USER'@'localhost' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
		GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_ADMIN_USER'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
		CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
		GRANT PRIVILEGE ON $MYSQL_DATABASE_NAME.table TO '$MYSQL_USER'@'localhost';
		GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO '$MYSQL_USER'@'localhost' WITH GRANT OPTION;
		FLUSH PRIVILEGES;" > tools/change_pword.txt

		mysql_install_db --user=mysql > /dev/null
		mysqld --user=mysql --bootstrap < tools/change_pword.txt
	# fi
else
	echo "/var/lib/mysql not found"
fi

cd ~/..
sed 's/127.0.0.1/db_container/g' /etc/mysql/mariadb.conf.d/50-server.cnf > /etc/mysql/mariadb.conf.d/50-server.cn
rm /etc/mysql/mariadb.conf.d/50-server.cnf && mv /etc/mysql/mariadb.conf.d/50-server.cn /etc/mysql/mariadb.conf.d/50-server.cnf

mysqld_safe
