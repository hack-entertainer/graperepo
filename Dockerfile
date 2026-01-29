FROM dunglas/frankenphp:1-php8.4

WORKDIR /app

# PHP extensions (including GD)
RUN install-php-extensions \
    pdo_mysql \
    mbstring \
    intl \
    zip \
    opcache \
    exif \
    gd

# Install Composer
RUN curl -sS https://getcomposer.org/installer \
    | php -- --install-dir=/usr/local/bin --filename=composer

# Copy application files
COPY . .

# Create Laravel-required directories BEFORE composer install
RUN mkdir -p \
    storage/logs \
    storage/framework/cache \
    storage/framework/views \
    storage/framework/sessions \
    bootstrap/cache

# Set permissions (group-writable)
RUN chmod -R 775 storage bootstrap/cache

# Install dependencies
RUN composer install \
    --no-dev \
    --no-interaction \
    --prefer-dist \
    --optimize-autoloader

# Ensure correct ownership for Railway / FrankenPHP runtime (numeric UID)
RUN chown -R 1000:1000 /app/storage /app/bootstrap/cache

EXPOSE 8000

CMD ["frankenphp", "run", "--config", "/app/Caddyfile"]
