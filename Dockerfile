FROM ghcr.io/savioruz/pehape:main-php8.2

COPY . /var/www/html

WORKDIR /var/www/html

RUN composer install

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 777 /var/www/html/storage

RUN echo $':80 {\n\
    root * /var/www/html\n\
    php_server\n\
    file_server\n\
    encode gzip\n\
}\n' > /etc/frankenphp/Caddyfile
