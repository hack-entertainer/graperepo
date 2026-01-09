FROM dunglas/frankenphp:latest

RUN install-php-extensions \
    pdo_mysql \
    mbstring \
    intl \
    zip \
    opcache

WORKDIR /app
COPY . /app

RUN chown -R www-data:www-data storage bootstrap/cache

CMD ["frankenphp", "run", "--config", "/app/Caddyfile"]
