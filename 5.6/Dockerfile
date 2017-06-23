FROM php:5.6-fpm-alpine
COPY config/php.ini /usr/local/etc/php/
ENV buildDeps "autoconf file g++ gcc binutils isl libatomic libc-dev musl-dev make re2c libstdc++ libgcc binutils-libs mpc1 mpfr3 gmp-dev libgomp coreutils freetype-dev libjpeg-turbo-dev libmcrypt-dev libpng-dev"
RUN apk -U add $buildDeps \
      libmcrypt \
      libjpeg-turbo \
      libpng \
      gmp \
    && docker-php-ext-install iconv mcrypt mbstring mysqli pdo pdo_mysql gd gmp bcmath zip \
    && apk add yaml-dev \
    && pecl install yaml \
    && docker-php-ext-enable yaml \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && pecl install apcu-4.0.11 \
    && docker-php-ext-enable apcu \
    && apk del $buildDeps \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*
