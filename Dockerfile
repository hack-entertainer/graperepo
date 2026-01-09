# --------------------------------------------------
# Stage 1: Composer dependencies
# --------------------------------------------------
FROM composer:2 AS vendor

WORKDIR /app

COPY composer.json composer.lock ./

RUN composer install \
    --no-dev \
    --no-interaction \
    --prefer-dist \
    --optimize-autoloader


# --------------------------------------------------
# Stage 2: FrankenPHP runtime
# --------------------------------------------------
FROM dunglas/frankenphp:latest

RUN install-php-extensions \
    pdo_mysql \
    mbstring \
    intl \
    zip \
    opcache

WORKDIR /app

# Copy app source
COPY . /app

# Copy vendor from composer stage
COPY --from=vendor /app/vendor /app/vendor

# Ensure Laravel writable dirs exist
RUN mkdir -p storage bootstrap/cache \
 && chown -R www-data:www-data storage bootstrap/cache

# Force FrankenPHP to use our Caddyfile
CMD ["frankenphp", "run", "--config", "/app/Caddyfile"]
