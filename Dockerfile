FROM php:7.2-apache

# PHP
COPY conf/php.ini $PHP_INI_DIR/php.ini

# Apache
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
COPY conf/apache2.conf /etc/apache2/apache2.conf
COPY conf/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite && a2enmod headers

# Directory Lister
COPY --chown=www-data:www-data src/ /var/www/html/public/

EXPOSE 80