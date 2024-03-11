echo "running wp-autoconfig.sh script..."
sleep 10

if [ -f /var/www/html/wp-config.php ]; then
	echo "wordpress is already configured."
	echo "done."
	/usr/sbin/php-fpm7.4 -F
fi

wp config create --allow-root --dbname=${DATABASE} --dbuser=${USER} --dbpass=${USER_PASSWORD} --dbhost=mariadb
wp core install --allow-root --url=${HOSTNAME} --title="Inception" --admin_user=${ROOT_NAME} --admin_password=${ROOT_PASSWORD} --admin_email=${ROOT_NAME}.r@${HOSTNAME}
wp user create --allow-root ${USER} ${USER}@${HOSTNAME} --role=author --user_pass=${USER_PASSWORD}
wp theme activate --allow-root twentytwentytwo	
wp plugin update --allow-root --all

echo "done."

/usr/sbin/php-fpm7.4 -F