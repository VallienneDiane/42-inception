FROM debian:buster

ARG MYSQL_USER
ARG MYSQL_DATABASE
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

RUN apt-get update -y
RUN apt-get upgrade -y

# INSTALL MARIADB SERVER
RUN apt-get install -y mariadb-server
RUN apt-get clean -y

# GIVE RIGHT TO MYSQL GROUP ON THE FILE
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

# START SQL && CREATE DATABASE | -e enabled settings | -u user
    # ALTER USER        : modifies the corresponding row in the mysql.user system table
    # GRANT             : assigns privileges and roles to MySQL user accounts and roles
    # FLUSH PRIVILEGES  : changes take effect immediately
RUN service mysql start \
&&  mysql -u root -e    "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; \
    ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; \
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; \
    FLUSH PRIVILEGES;"

# COPY CONTENT OF CONF FILE INTO THE CONF FILE OF THE CONTAINER
COPY ./conf/mariadb.conf ./etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT ["mysqld", "--bind-address=0.0.0.0"]

