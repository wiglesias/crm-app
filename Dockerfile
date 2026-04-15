FROM php:8.4-fpm

# Instalar dependencias
RUN apt-get update && apt-get install -y \
    git unzip libicu-dev libzip-dev libpng-dev \
    && docker-php-ext-install intl pdo pdo_mysql zip gd

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www