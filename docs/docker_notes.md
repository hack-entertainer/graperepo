# Docker Notes — RRDB Containerization (Linux Mint)

This document describes the Docker and FrankenPHP setup for RRDB,
including Linux-specific behavior and Railway deployment realities.

## Architecture
- Runtime: Docker (FrankenPHP + Caddy)
- PHP: 8.4 (pinned via base image)
- App root: /app
- Database: External MySQL (Railway in staging/prod, host DB in local dev)
- Dockerfile is the source of truth for staging/production
- Docker Compose is local-development-only


## Images vs Bind Mounts

Dockerfile:
- Copies application code into the image
- Used by Railway
- Immutable, production-parity runtime

docker-compose.override.yml (local only):
- Bind-mounts host repo to /app
- Enables fast iteration without rebuilds
- Never used by Railway or CI


## Docker Compose Files

docker-compose.yml:
- Base definition
- No bind mounts
- Safe for prod-parity testing

docker-compose.override.yml:
- Local dev only
- Adds bind mount and user mapping
- Auto-loaded by Docker Compose locally


## UID/GID and File Ownership (Linux)

On Linux, bind-mounted files retain host ownership.

Problem:
- Containers writing files as root/www-data break editor workflows

Correct solution:
- Run container processes as host UID/GID
- Never put UID/GID in Laravel .env

docker-compose.override.yml:
user: "${UID}:${GID}"
volumes:
  - .:/app

Shell (not .env):
export UID=$(id -u)
export GID=$(id -g)

These exports belong in ~/.zshrc.


## .env Rules

- .env is for Laravel only
- Static values only
- No shell syntax
- UID/GID must never appear in .env


## Linux Networking Note

host.docker.internal does not exist by default on Linux.

Local containers connecting to host MySQL:
DB_HOST=172.17.0.1

Production uses Railway-provided DB host.


## FrankenPHP + PHP Extensions (Important)

FrankenPHP does not include all PHP extensions by default.

Notably:
- DOM is NOT available unless explicitly compiled

Required Dockerfile snippet:

RUN apt-get update \
 && apt-get install -y libxml2-dev \
 && docker-php-ext-install dom

Do not rely on install-php-extensions for DOM.


## Railway / FrankenPHP Boot Path (Hard Rule)

start.sh must be the ENTRYPOINT.

Anti-pattern:
CMD ["frankenphp", "run", "--config", "/app/Caddyfile"]

Correct:
ENTRYPOINT ["/app/start.sh"]

start.sh responsibilities:
- Prepare filesystem (storage, cache)
- Run migrations (idempotent)
- Run env-gated seeders
- exec frankenphp run ...


## Railway CLI Reality

`railway run` is a convenience wrapper and may fail due to
GraphQL or DNS issues.

Authoritative runtime truth:
- Interactive shell via `railway ssh`

If it works in `railway ssh`, it works in production.


## Key Takeaways

Dockerfile = reality
docker-compose.override.yml = convenience
railway ssh = truth
railway run = best-effort
