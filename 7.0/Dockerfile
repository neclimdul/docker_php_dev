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
    && docker-php-ext-install iconv mcrypt mbstring mysqli mysqlnd pdo pdo_mysql opcache gd \
    && apk add yaml-dev \
    && pecl install yaml-beta \
    && docker-php-ext-enable yaml \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && apk del autoconf file g++ gcc binutils isl libatomic libc-dev musl-dev make re2c libstdc++ libgcc binutils-libs mpc1 mpfr3 gmp libgomp \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*
