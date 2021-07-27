FROM php:apache

COPY ./ /var/www/html/index.php
EXPOSE 80
# RUN httpd
 CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]