FROM debian:buster

RUN 	apt-get update -y \
&&		apt-get upgrade -y
	
# INSTALL Curl(Client url)
	# CURL is a way that can hit a URL from our code to get an html response from it
RUN		apt-get install wget curl less -y

# INSTALL PHP
RUN		apt-get install -y php
RUN 	apt-get install -y php-fpm
RUN		apt-get install -y php-mysql \
&&		apt-get install -y php-mysqli

# RUN		apt-get install -y sendmail
RUN		apt-get install -y mariadb-client

# DOWNLOAD WP-CLI FORM GITHUB && DEFINE WP-CLI LIKE EXECUTABLE && MOVE WP-CLI
RUN 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&&		chmod +x wp-cli.phar \
&&		mv wp-cli.phar /usr/local/bin/wp

RUN		mkdir -p /var/www/html/wordpress

# Downloads core WordPress files
RUN		wp core download  --allow-root --path="/var/www/html/wordpress"

# Give permissions to upload img when editing pagen| -R execute root
RUN		chown www-data:www-data /var/www/html/wordpress/wp-content -R

EXPOSE 	9000

# COPY	/tools/wp-config.php /tmp

COPY	/tools/entrypoint.sh /tmp
COPY	/tools/www.conf /etc/php/7.3/fpm/pool.d/www.conf
ENTRYPOINT [ "bash", "/tmp/entrypoint.sh" ]