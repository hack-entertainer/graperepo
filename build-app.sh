#!/bin/bash
# build-app.sh - Laravel app build script for Railway

# Exit on any error
set -e

# Build assets (JS/CSS) using npm and Laravel Mix/Vite
npm run build

# Clear any old caches
php artisan optimize:clear

# Cache Laravel config, events, routes, and views for faster performance
php artisan config:cache
php artisan event:cache
php artisan route:cache
php artisan view:cache

echo "Build complete! App is production-optimized."
