# Shipping / Deployment Checklist

This document defines the canonical shipping flow for RRDB.
If these steps pass locally, the Railway deployment should behave identically.

Principles:
- Docker is the source of truth
- Images are immutable artifacts
- Missing PHP extensions must fail before deploy
- Artisan must boot cleanly in the container


## 1. Verify Docker Image Parity (Required)

Run this before pushing to Railway.
This ensures required PHP extensions are present and Artisan can boot.

```zsh
docker build --no-cache -t rrdb-franken . \
&& docker run --rm rrdb-franken php -m | grep dom \
&& docker run --rm rrdb-franken php artisan optimize:clear
```

If this fails locally:
- Do not deploy
- Fix the Dockerfile
- Rebuild until this passes

If this passes:
- Railway will not fail due to missing extensions or CLI boot issues


## 2. Rebuild Containers Cleanly (Local)

Use this when system-level inputs change (Dockerfile, extensions, base image).

```zsh
docker compose build --no-cache
docker compose up -d
```


## 3. Initialize / Update Application State

Run Artisan commands inside the container, never on the host.

```zsh
docker compose exec app php artisan key:generate --force
docker compose exec app php artisan migrate --force
docker compose exec app php artisan db:seed --force
```


## 4. Clear Runtime Caches

Always clear before caching.

```zsh
docker compose exec app php artisan config:clear
docker compose exec app php artisan route:clear
docker compose exec app php artisan view:clear
```


## 5. Cache for Production

Only cache after the app boots cleanly.

```zsh
docker compose exec app php artisan config:cache
docker compose exec app php artisan route:cache
docker compose exec app php artisan view:cache
```


## 6. Final Verification

These commands must succeed without warnings or fatals.

```zsh
docker compose exec app php artisan optimize
docker compose exec app php artisan route:list
```


## Notes / Guardrails

- If Artisan fails before command logic runs, suspect missing PHP extensions
- Rebuilding without changing the Dockerfile will not fix extension issues
- If local Docker passes, Railway should pass
- Prefer failing early at build time over debugging live containers
