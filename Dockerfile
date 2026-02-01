FROM dunglas/frankenphp:1-php8.4

ARG CACHE_BUSTER=2026-01-31-dom-3

WORKDIR /app

# PHP extensions (including GD)
RUN install-php-extensions \
    xml \
    pdo_mysql \
    mbstring \
    intl \
    zip \
    opcache \
    exif \
    gd

RUN docker-php-ext-enable dom

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

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# IMPORTANT:
# Do not run FrankenPHP directly via CMD.
# start.sh must run first (migrations, seeders, permissions).
ENTRYPOINT ["/app/start.sh"]
