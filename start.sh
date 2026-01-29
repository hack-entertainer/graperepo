#!/usr/bin/env bash
set -euo pipefail

echo "Booting application with FrankenPHP"

# Ensure correct working directory
cd "$(dirname "$0")"

# Ensure storage directories exist
mkdir -p storage/framework/{cache,data,sessions,testing,views}
mkdir -p storage/logs
mkdir -p bootstrap/cache
chmod -R 775 storage bootstrap/cache || true

# Optional: quick visibility in Railway logs
php -r 'echo "PHP version: " . PHP_VERSION . PHP_EOL;'

# Hard sanity check: PDO must exist
php -r 'if (!class_exists("PDO")) { fwrite(STDERR, "PDO missing\n"); exit(1); }'

# -----------------------------
# Database lifecycle (canonical)
# -----------------------------

echo "Running migrations"
php artisan migrate --force

echo "Running seeders (env-gated)"
php artisan db:seed --force

# -----------------------------
# Launch application
# -----------------------------

exec frankenphp run --config Caddyfile
