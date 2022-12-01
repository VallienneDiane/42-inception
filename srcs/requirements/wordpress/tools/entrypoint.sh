cd /var/www/html/wordpress

FILE=/var/www/html/wordpress/wp-config.php
if test -f "$FILE"; then
	rm $FILE
fi

# CONFIGURE FILE WP-CONFIG.PHP
wp core config  --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --dbprefix=wp_

# CREATE THE WP TABLES IN THE DATABASE
wp core install --allow-root --url=$DOMAIN_NAME --title="$WP_SITE_TITLE" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL

mkdir -p /run/php/
php-fpm7.3 -F 