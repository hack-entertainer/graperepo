FROM dunglas/frankenphp:latest

RUN install-php-extensions \
    pdo_mysql \
    mbstring \
    intl \
    zip \
    opcache

WORKDIR /app
COPY . /app

# Laravel writable dirs
RUN mkdir -p storage bootstrap/cache \
    && chown -R www-data:www-data storage bootstrap/cache

# FrankenPHP image entrypoint will run Caddy/FrankenPHP.
# It will automatically read /app/Caddyfile if that's what you used locally.
