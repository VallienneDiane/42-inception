FROM debian:buster

RUN 	apt-get update -y \
&&		apt-get upgrade -y
	
# INSTALL Curl(Client url): hit an URL from our code
RUN		apt-get install curl less -y

# INSTALL PHP
RUN		apt-get install -y php

# INSTALL PHP-FPM (FastCgi process manager)
	# protocol that define how my web server (nginx) communicates 
	# with my CGI programm (php) about the received request
RUN 	apt-get install -y php-fpm

# INSTALL MYSQL (old db driver) && MYSQLI (improved driver)
RUN		apt-get install -y php-mysql \
&&		apt-get install -y php-mysqli

# INSTALL MARIADB-CLIENT TO CONNECT TO THE DATABASE 
RUN		apt-get install -y mariadb-client


# DOWNLOAD WP-CLI FROM GITHUB && DEFINE WP-CLI TO EXECUTABLE
RUN 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&&		chmod +x wp-cli.phar \
&&		mv wp-cli.phar /usr/local/bin/wp

# CREATE DIRECTORY TO INSTALL WORDPRESS
RUN		mkdir -p /var/www/html/wordpress

EXPOSE 	9000

# COPY SH FILE IN TMP DIRECTORY
COPY	/tools/entrypoint.sh /tmp

# COPY OUR CONF FILE IN OUR CONTAINER
COPY	/tools/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# INSTALL DUMB-INIT
RUN apt-get install -y dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["sh", "/tmp/entrypoint.sh" ]