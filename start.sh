#!/usr/bin/env bash
set -euo pipefail

echo "Booting application with FrankenPHP"

# Ensure correct working directory
cd "$(dirname "$0")"

# Ensure storage directories exist (same intent as before)
mkdir -p storage/framework/{cache,data,sessions,testing,views}
mkdir -p bootstrap/cache
chmod -R 775 storage bootstrap/cache || true

# Optional: quick visibility in Railway logs
php -r 'echo "PHP version: " . PHP_VERSION . PHP_EOL;'

# Hard sanity check: PDO must exist
php -r 'if (!class_exists("PDO")) { fwrite(STDERR, "PDO missing\n"); exit(1); }'

# Launch FrankenPHP as PID 1
exec frankenphp run --config Caddyfile
