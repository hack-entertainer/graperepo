FROM dunglas/frankenphp:latest

# Install PHP extensions
RUN install-php-extensions \
    pdo_mysql \
    mbstring \
    intl \
    zip \
    opcache

WORKDIR /app

# Copy composer files first (for layer caching)
COPY composer.json composer.lock ./

# Install dependencies (no dev, optimized)
RUN composer install \
    --no-dev \
    --no-interaction \
    --prefer-dist \
    --optimize-autoloader

# Copy the rest of the application
COPY . /app

# Ensure Laravel writable directories exist
RUN mkdir -p storage bootstrap/cache \
    && chown -R www-data:www-data storage bootstrap/cache
