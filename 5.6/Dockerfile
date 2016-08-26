FROM php:5.6-fpm-alpine
COPY config/php.ini /usr/local/etc/php/
RUN apk -U upgrade && apk add \
	  autoconf file g++ gcc binutils isl libatomic libc-dev musl-dev make re2c libstdc++ libgcc binutils-libs mpc1 mpfr3 gmp libgomp \
	  coreutils \
	  freetype-dev \
	  libjpeg-turbo-dev \
	  libltdl \
	  libmcrypt-dev \
	  libpng-dev \
    && docker-php-ext-install iconv mcrypt mbstring mysqli pdo pdo_mysql gd \
    && apk add yaml-dev \
    && pecl install yaml \
    && docker-php-ext-enable yaml \
    && pecl install apcu-4.0.11 \
    && docker-php-ext-enable apcu \
    && apk del autoconf file g++ gcc binutils isl libatomic libc-dev musl-dev make re2c libstdc++ libgcc binutils-libs mpc1 mpfr3 gmp libgomp \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*
