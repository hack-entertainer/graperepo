# Docker Notes — RRDB Containerization (Linux Mint)

## Architecture
- Runtime: Docker (FrankenPHP + Caddy)
- PHP: 8.4 (pinned via image)
- App root in container: /app
- Database: external MySQL (Railway in staging/prod, host DB in local dev)
- Dockerfile is the source of truth for staging/production
- Docker Compose is used for local development only

## Images vs Bind Mounts
- Dockerfile:
  - Copies application code into the image
  - Used by Railway (staging/production)
  - Immutable, production-parity runtime
- docker-compose.override.yml (local only):
  - Bind-mounts host repo to /app
  - Enables fast iteration without rebuilds
  - Never used in Railway or CI

## Docker Compose Files
- docker-compose.yml
  - Base definition
  - No bind mounts
  - Safe for prod-parity use
- docker-compose.override.yml
  - Local dev only
  - Adds bind mount and user mapping
  - Automatically loaded by Docker Compose locally

## UID/GID and File Ownership (Linux)
- On Linux, bind-mounted files retain host ownership
- Containers writing files as root or www-data cause VS Code save failures
- Correct solution:
  - Run container processes as host UID/GID
  - Do NOT put UID/GID in Laravel .env

### Correct Setup
- docker-compose.override.yml:
  user: "${UID}:${GID}"
  volumes:
    - .:/app

- Shell (not .env):
  export UID=$(id -u)
  export GID=$(id -g)

- These exports should live in ~/.zshrc or equivalent
- Laravel never sees UID/GID
- Docker Compose substitutes them at runtime

## .env Rules
- .env is for Laravel only
- .env must contain static values only
- Never include shell syntax:
  - No $(...)
  - No backticks
  - No command substitution
- UID/GID must NOT appear in .env

## Linux Networking Note
- host.docker.internal does NOT exist on Linux by default
- For containers connecting to host MySQL:
  DB_HOST=172.17.0.1
- Production uses Railway-provided DB host instead

## Safe Operational Rules
- Always rebuild image before pushing to Railway
- If something only works with bind mounts, fix the Dockerfile
- DatabaseSeeder must be safe to run in production
- Seeders must be idempotent and env-gated

## Common Commands
- Start local dev:
  docker compose up -d
- Stop local dev:
  docker compose down
- Exec into container:
  docker compose exec app zsh
- Run artisan:
  docker compose exec app php artisan <command>
- Rebuild image:
  docker build -t graperepo-franken .

## Key Takeaway
Dockerfile = reality  
docker-compose.override.yml = convenience  
Shell env ≠ Laravel .env
