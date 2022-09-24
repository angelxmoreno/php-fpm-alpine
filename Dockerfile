FROM php:7.4-fpm-alpine3.16

LABEL maintainer="angelxmoreno@gmail.com"

# Install Dependencies
RUN set -x \
 && docker-php-source extract \
 && apk add --no-cache --virtual .buildPacks autoconf g++ make \
 && apk add --no-cache icu-dev tidyhtml-dev \
 && pecl install redis \
 && pecl install xdebug \
 && docker-php-ext-enable redis \
 && docker-php-ext-enable xdebug \
 && docker-php-ext-install intl \
 && docker-php-ext-install mysqli \
 && docker-php-ext-install pdo \
 && docker-php-ext-install pdo_mysql \
 && docker-php-ext-install tokenizer \
 && docker-php-ext-install tidy

# Installing Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install GIT
RUN apk --no-cache add git openssh

# Install NPM
RUN apk --no-cache add nodejs npm yarn

# Clean up \
RUN docker-php-source delete \
  && apk del --purge .buildPacks \
  && rm -rf /tmp/pear \
  && rm -rf /var/cache/apk/*

# File copies
COPY php.ini /usr/local/etc/php

# Expose new ports
EXPOSE 9001

WORKDIR /var/www/html
