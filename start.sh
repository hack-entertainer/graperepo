#!/bin/bash
set -e

# Ensure storage directories exist
mkdir -p storage/framework/{cache,data,sessions,testing,views}
chmod -R 775 storage bootstrap/cache

# Start Laravel
php artisan serve --host=0.0.0.0 --port=$PORT
