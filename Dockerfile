FROM php:5.6-fpm-alpine

MAINTAINER angelxmoreno <angelxmoreno@gmail.com>

ENV PHALCON_VERSION 3.2.1

# Pre run
RUN docker-php-source extract \
    && apk update \
    && apk add autoconf g++ make pcre-dev

# Install mysql goodness
RUN docker-php-ext-install \
    mysqli \
    pdo_mysql

# Instaling redis
RUN apk add \
    autoconf \
    g++ \
    make \
    && pecl install redis \
    && docker-php-ext-enable redis

# Installing CakePHP deps
RUN apk add \
    icu-libs \
    icu \
    icu-dev \
    && docker-php-ext-install intl

# Post run
RUN docker-php-source delete \
    && rm -rf /tmp/pear \
    && rm -rf /var/cache/apk/*

# Installing Phalcon deps
RUN set -xe && \
    cd /usr/local/etc/php/ && \
    curl -LO https://github.com/phalcon/cphalcon/archive/v${PHALCON_VERSION}.tar.gz && \
    tar xzf v${PHALCON_VERSION}.tar.gz && \
    cd cphalcon-${PHALCON_VERSION}/build && \
    sh install && \
    echo "extension=phalcon.so" > /usr/local/etc/php/conf.d/phalcon.ini && \
    cd ../.. && rm -rf v${PHALCON_VERSION}.tar.gz cphalcon-${PHALCON_VERSION}
