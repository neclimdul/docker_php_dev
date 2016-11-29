FROM php:7.0-fpm-alpine
COPY config/php.ini /usr/local/etc/php/
RUN apk -U upgrade && apk add \
	  autoconf file g++ gcc binutils isl libatomic libc-dev musl-dev make re2c libstdc++ libgcc binutils-libs mpc1 mpfr3 gmp libgomp \
	  coreutils \
	  freetype-dev \
	  libjpeg-turbo-dev \
	  libltdl \
	  libmcrypt-dev \
	  libpng-dev \
    && docker-php-ext-install iconv mcrypt mbstring mysqli mysqlnd pdo pdo_mysql opcache gd bcmath zip \
    && apk add yaml-dev \
    && pecl install yaml-2.0.0 \
    && docker-php-ext-enable yaml \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && apk del autoconf file g++ gcc binutils isl libatomic libc-dev musl-dev make re2c libstdc++ libgcc binutils-libs mpc1 mpfr3 gmp libgomp \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*
