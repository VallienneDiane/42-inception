cd /var/www/html/wordpress

# DOWNLOAD WORDPRESS FILES
wp core download  --path="/var/www/html/wordpress" --allow-root

# GENERATE AND CONFIGURE THE WP-CONFIG.PHP FILE
wp config create --path="/var/www/html/wordpress" --allow-root --dbname=$DB_DATABASE --dbuser=$DB_USER --dbpass=$DB_USER_PASSWORD --dbhost=$DB_HOST --dbprefix=wp_

# RUNS THE STANDARD WORDPRESS INSTALLATION PROCESS - CREATE THE WORDPRESS TABLES IN DB 
wp core install --path="/var/www/html/wordpress" --allow-root --url=$DOMAIN_NAME --title="$WP_SITE_TITLE" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL

# CREATE USER IN WORDPRESS
wp plugin update --allow-root --all
wp user create --path="/var/www/html/wordpress" --allow-root $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD

# CHOOSE THEME
# wp theme install neve --activate --allow-root

# GIVE PERMISSIONS TO GROUP AND USER WWW-DATA TO UPLOADS | -R EXECUTE ROOT
chown www-data:www-data /var/www/html/wordpress/wp-content/uploads -R

# LAUNCH PHP-FPM
mkdir -p /run/php/
php-fpm7.3 -F 