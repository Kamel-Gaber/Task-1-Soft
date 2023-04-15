FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    build-essential \
    libzip-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git


RUN docker-php-ext-install pdo_mysql zip gd mbstring exif pcntl bcmath opcache

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html


COPY . .
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN mkdir -p /var/www/html/storage
RUN mkdir -p /var/www/html/bootstrap/cache



RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache


EXPOSE 9000


CMD ["php-fpm"]