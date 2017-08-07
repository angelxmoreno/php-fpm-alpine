FROM php:5.6-fpm-alpine

LABEL maintainer="angelxmoreno@gmail.com"

# @TODO use ARG to take in the version of Phalcon on build time
ENV PHALCON_VERSION 3.2.1

# Pre run
RUN docker-php-source extract \
    && apk add --update --virtual .build-deps autoconf g++ make pcre-dev icu-dev openssl-dev \

# Install mysql goodness
    && docker-php-ext-install mysqli pdo_mysql \

# Instaling redis
# @TODO define redis version
    && pecl install redis \

# Installing mongo
# @TODO define mongodb version
    && pecl install mongo \

# enable pecl modules
    && docker-php-ext-enable redis mongo \

# Installing CakePHP deps
    && apk add icu-libs icu \
    && docker-php-ext-install intl \

# Installing Phalcon deps
    && cd /usr/local/etc/php/ \
    && curl -LO https://github.com/phalcon/cphalcon/archive/v${PHALCON_VERSION}.tar.gz \
    && tar xzf v${PHALCON_VERSION}.tar.gz \
    && cd cphalcon-${PHALCON_VERSION}/build \
    && sh install \
    && echo "extension=phalcon.so" > /usr/local/etc/php/conf.d/phalcon.ini \

# Post run
    && docker-php-source delete \
    && apk del --purge .build-deps \
    && rm -rf /tmp/pear \
    && rm -rf /var/cache/apk/* \
    && rm -rf /usr/local/etc/php/cphalcon-${PHALCON_VERSION} \
    && rm /usr/local/etc/php/v${PHALCON_VERSION}.tar.gz
