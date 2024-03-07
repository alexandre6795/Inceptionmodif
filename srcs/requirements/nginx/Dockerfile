FROM    debian:bullseye

RUN     apt-get update -y && apt-get install nginx -y \
    &&  mkdir --parents /etc/nginx/ssl && apt-get install openssl -y\
    &&  openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=GES/L=Mulhouse/O=42/OU=42/CN=akastler.42.fr/UID=akastler" \
    &&  chmod 755 /var/www/html \
    &&  chown -R www-data:www-data /var/www/html

COPY    conf/nginx.conf /etc/nginx/conf.d/inception.conf

CMD [ "nginx", "-g", "daemon off;" ]