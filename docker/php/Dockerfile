FROM php:${PHP_VERSION:-7.4-fpm-alpine}

LABEL maintainer="Aloïs Micard <a.micard@vold.lu>"

# Setup user for PHP-FPM with ID 1000
RUN adduser --uid 1000 --disabled-password --no-create-home dolibarr

RUN apk add --no-cache \
      freetype \
      libjpeg-turbo \
      libpng \
      zip \
      freetype-dev \
      libjpeg-turbo-dev \
      libpng-dev \
      icu-dev \
      libzip-dev \
      imap-dev \
      krb5-dev \
      libressl-dev \
    && docker-php-ext-configure gd \
      --with-freetype=/usr/include/ \
      --with-jpeg=/usr/include/ \
    && docker-php-ext-configure intl \
    && docker-php-ext-configure imap  \
      --with-kerberos  \
      --with-imap-ssl \
    && docker-php-ext-install -j$(nproc) gd calendar intl zip imap mysqli pdo_mysql \
    && docker-php-ext-enable gd calendar intl zip imap \
    && apk del --no-cache \
      freetype-dev \
      libjpeg-turbo-dev \
      libpng-dev \
      krb5-dev \
      libressl-dev \
    && rm -rf /tmp/*

COPY docker/php/www.conf /usr/local/etc/php-fpm.d/www.conf

# Bundle Dolibarr
RUN mkdir -p /var/lib/dolibarr
RUN chown -R dolibarr:dolibarr /var/lib/dolibarr

RUN rm -rf /var/www/html
COPY ./dolibarr /var/www/html
RUN chown -R dolibarr:dolibarr /var/www/html

# Bundle entrypoint
COPY docker/php/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["php-fpm"]
