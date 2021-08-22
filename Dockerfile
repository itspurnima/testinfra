FROM php:apache

COPY ./src /var/www/html/index.php
EXPOSE 80
# RUN httpd
 CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
