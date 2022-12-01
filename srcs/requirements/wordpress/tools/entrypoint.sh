cd /var/www/html/wordpress

FILE=/var/www/html/wordpress/wp-config.php
if test -f "$FILE"; then
	rm $FILE
fi

# if ! wp core is-installed --allow-root; then	
	# Generates a wp-config.php file. && CONFIGURE FILE WP-CONFIG.PHP  	
	wp config create --path="/var/www/html/wordpress" --allow-root --dbname=$DB_DATABASE --dbuser=$DB_ADMIN --dbpass=$DB_ADMIN_PASSWORD --dbhost=$DB_HOST --dbprefix=wp_

	# Runs the standard WordPress installation process - Create the wp tables in database
	wp core install --path="/var/www/html/wordpress" --allow-root --url=$DOMAIN_NAME --title="$DB_SITE_TITLE" --admin_user=$DB_ADMIN --admin_password=$DB_ADMIN_PASSWORD --admin_email=$DB_ADMIN_EMAIL
	
	# Create database, user and admin 
	# wp db create --allow-root
	wp user create --allow-root $DB_USER $DB_USER_EMAIL --user_pass=$DB_USER_PASSWORD
	
	# &&  mysql -u root -e    "CREATE DATABASE IF NOT EXISTS $DB_DATABASE; \
    #                     ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ADMIN_PASSWORD'; \
    #                     GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_ADMIN'@'%' IDENTIFIED BY '$DB_ADMIN_PASSWORD'; \
    #                     FLUSH PRIVILEGES;"
	# wp theme install neve --activate --allow-root
# fi

mkdir -p /run/php/
php-fpm7.3 -F 