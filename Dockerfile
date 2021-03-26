FROM ubuntu:18.04

ENV DEBIAN_FRONTEND="noninteractive" \
  LC_ALL="en_US.UTF-8" \
  LANG="en_US.UTF-8"

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends \
    software-properties-common \
    git \
    gnupg2 \
    curl \
    zip \
    unzip

### PHP

# Install PHP 7.4 and Composer
ENV COMPOSER_ALLOW_SUPERUSER=1
COPY --from=composer:1.10.9 /usr/bin/composer /usr/local/bin/composer1
COPY --from=composer:2.0.8 /usr/bin/composer /usr/local/bin/composer
RUN add-apt-repository ppa:ondrej/php \
  && apt-get update \
  && apt-get install -y \
    php7.4 \
    php7.4-amqp \
    php7.4-apcu \
    php7.4-bcmath \
    php7.4-cli \
    php7.4-common \
    php7.4-curl \
    php7.4-gd \
    php7.4-geoip \
    php7.4-gettext \
    php7.4-gmp \
    php7.4-imagick \
    php7.4-imap \
    php7.4-intl \
    php7.4-json \
    php7.4-ldap \
    php7.4-mbstring \
    php7.4-memcached \
    php7.4-mongodb \
    php7.4-mysql \
    php7.4-redis \
    php7.4-soap \
    php7.4-sqlite3 \
    php7.4-tidy \
    php7.4-xml \
    php7.4-zip \
    php7.4-zmq
