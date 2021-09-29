# TODO: Dom note: before using, check out https://hub.docker.com/_/php for production vs development config

FROM php:7.3.30-apache

RUN a2enmod rewrite && \
    docker-php-ext-install mysqli

RUN pecl install xdebug

RUN docker-php-ext-enable xdebug

RUN echo ' \n\
    zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20180731/xdebug.so \n\
    xdebug.idekey = PHPSTORM \n\
    xdebug.mode = debug,develop \n\
    xdebug.start_upon_error = yes \n\
    xdebug.client_host = host.docker.internal \n\
    xdebug.start_with_request = yes \n\
    ' > /usr/local/etc/php/conf.d/docker-php-ext-xdebug-extra.ini
