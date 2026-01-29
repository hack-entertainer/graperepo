# Rebuild containers cleanly
docker compose build --no-cache
docker compose up -d

# Inside the app container
docker compose exec app php artisan key:generate --force
docker compose exec app php artisan migrate --force
docker compose exec app php artisan db:seed --force

# Optimize for production
docker compose exec app php artisan config:clear
docker compose exec app php artisan route:clear
docker compose exec app php artisan view:clear

docker compose exec app php artisan config:cache
docker compose exec app php artisan route:cache
docker compose exec app php artisan view:cache

# Final verification
docker compose exec app php artisan optimize
docker compose exec app php artisan route:list
