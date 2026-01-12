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

# Install Composer
RUN curl -sS https://getcomposer.org/installer \
    | php -- --install-dir=/usr/local/bin --filename=composer

# Copy composer files first (better cache behavior)
COPY . .

# Create Laravel-required directories BEFORE composer install
RUN mkdir -p \
    storage/framework/cache \
    storage/framework/views \
    storage/framework/sessions \
    bootstrap/cache

# Set safe permissions
RUN chmod -R 775 storage bootstrap/cache

# Install dependencies
RUN composer install \
    --no-dev \
    --no-interaction \
    --prefer-dist \
    --optimize-autoloader

# Copy the rest of the application
COPY . .

# Ownership for runtime (FrankenPHP runs as www-data)
RUN chown -R www-data:www-data storage bootstrap/cache

EXPOSE 8000

CMD ["frankenphp", "run", "--config", "/app/Caddyfile"]
