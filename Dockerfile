FROM dunglas/frankenphp:latest

# Install PHP extensions required by Laravel
RUN install-php-extensions \
    pdo_mysql \
    mbstring \
    intl \
    zip \
    opcache

WORKDIR /app

COPY . /app
