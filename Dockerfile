FROM dunglas/frankenphp:1-php8.4

WORKDIR /app

# PHP extensions
RUN install-php-extensions \
    pdo_mysql \
    mbstring \
    intl \
    zip \
    opcache \
    exif

# Copy app
COPY . /app

# Install Composer (FrankenPHP image does NOT ship with it)
RUN curl -sS https://getcomposer.org/installer \
    | php -- --install-dir=/usr/local/bin --filename=composer

# Install dependencies
RUN composer install \
    --no-dev \
    --no-interaction \
    --prefer-dist \
    --optimize-autoloader

# Permissions (Laravel)
RUN chown -R www-data:www-data storage bootstrap/cache

EXPOSE 8000

CMD ["frankenphp", "run", "--config", "/app/Caddyfile"]
