FROM debian:buster

ARG DB_USER
ARG DB_ADMIN
ARG DB_DATABASE
ARG DB_USER_PASSWORD
ARG DB_ADMIN_PASSWORD

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
&&  mysql -u root -e    "CREATE DATABASE IF NOT EXISTS $DB_DATABASE; \
                        ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ADMIN_PASSWORD'; \
                        GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_ADMIN'@'%' IDENTIFIED BY '$DB_ADMIN_PASSWORD'; \
                        FLUSH PRIVILEGES;"
                        # CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_USER_PASSWORD'; \

# COPY CONTENT OF CONF FILE INTO THE CONF FILE OF THE CONTAINER
COPY ./conf/mariadb.conf ./etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT ["mysqld", "--bind-address=0.0.0.0"]

