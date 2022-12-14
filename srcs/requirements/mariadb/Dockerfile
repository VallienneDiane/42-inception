FROM debian:buster

ARG DB_USER
ARG DB_DATABASE
ARG DB_USER_PASSWORD
ARG DB_ROOT_PASSWORD

RUN apt-get update -y
RUN apt-get upgrade -y

# INSTALL MARIADB SERVER
RUN apt-get install -y mariadb-server

# GIVE RIGHT TO MYSQL GROUP ON THE FILE
RUN mkdir -p /var/run/mysql
RUN chown -R mysql:mysql /var/run/mysql

# START MYSQL && CREATE DATABASE | -u user | -e enabled settings 
    # ALTER USER: allows you to change the authentication characteristics of a database user
    # GRANT: Grant user permissions to all tables in my_database from localhost
    # FLUSH PRIVILEGES: changes take effect immediately
RUN service mysql start \
&&  mysql -u root -e   "CREATE DATABASE IF NOT EXISTS $DB_DATABASE; \
                        ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD'; \
                        GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD'; \
                        FLUSH PRIVILEGES;"

# COPY CONTENT OF CONF FILE INTO THE CONF FILE OF THE CONTAINER
COPY ./conf/mariadb.conf ./etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

# INSTALL DUMB-INIT
RUN apt-get install -y dumb-init

# Entrypoint is a partial command that gets prepended to my CMD instruction
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["mysqld", "--bind-address=0.0.0.0"]
