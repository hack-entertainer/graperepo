# LOCAL DOCKER + FRANKENPHP TROUBLESHOOTING (RRDB)

This document captures fast, deterministic troubleshooting steps for RRDB
when running under Docker and FrankenPHP. It reflects real production
failure modes encountered on Railway.

MENTAL MODEL:
Infra problems stop the app.
Cache problems lie.
Images only change when rebuilt.
**Runtime truth beats CLI convenience.**


## SECTION 1: FIRST QUESTION

Did I change code, config, or credentials?

- Yes → clear caches
- No → suspect logic, data, or browser state


## SECTION 2: CACHE-BUSTING (RUN IN THIS ORDER)

Config cache (most common):
docker run --rm graperepo-franken php artisan config:clear

If behavior still feels stale:
docker run --rm graperepo-franken php artisan config:cache

Application cache:
docker run --rm graperepo-franken php artisan cache:clear

Blade / view cache:
docker run --rm graperepo-franken php artisan view:clear

Route cache:
docker run --rm graperepo-franken php artisan route:clear

Full reset (safe):
docker run --rm graperepo-franken php artisan optimize:clear


## SECTION 3: DOCKER SANITY

Is anything running?
docker ps

Changed image inputs?
docker build -t graperepo-franken .

Rule:
If it affects what ends up inside the image → rebuild.


## SECTION 4: MYSQL SANITY (LOCAL DEV)

Can the container reach host MySQL?

docker run --rm \
  --add-host=host.docker.internal:host-gateway \
  graperepo-franken \
  php -r "new PDO('mysql:host=host.docker.internal;port=3306;dbname=graperepo','laravel','yourpassword'); echo 'DB OK';"

Is MySQL listening?
ss -lntp | grep 3306

Expected:
0.0.0.0:3306


## SECTION 5: BROWSER GOTCHAS

If it works in Incognito but not normal:
- Clear site data for localhost
- DevTools → Application → Clear Storage
- Chrome HSTS: chrome://net-internals/#hsts


## SECTION 6: WHEN TO SUSPECT INFRA

Only suspect infra if:
- Container exits immediately
- docker ps shows nothing
- MySQL is not listening
- PDO test fails
- Browser cannot connect at all


## SECTION 7: 30-SECOND RESET

docker build -t graperepo-franken .
docker run --rm \
  -p 8000:80 \
  --add-host=host.docker.internal:host-gateway \
  graperepo-franken

Open:
http://localhost:8000/


## SECTION 8: VERIFY IMAGE PARITY (LOCAL == RAILWAY)

Purpose:
Prove that the Docker image contains required PHP extensions and that
Laravel Artisan can boot successfully.

docker build --no-cache -t rrdb-franken . \
&& docker run --rm rrdb-franken php -m | grep -x dom \
&& docker run --rm rrdb-franken php artisan optimize:clear

If this fails locally, do not deploy.


## SECTION 9: FRANKENPHP + DOM EXTENSION (CRITICAL)

Symptom:
- php artisan fails with:
  Class "DOMDocument" not found
- Web requests may still work

Cause:
- FrankenPHP base image does not ship with a compiled DOM extension

Correct fix in Dockerfile:

RUN apt-get update \
 && apt-get install -y libxml2-dev \
 && docker-php-ext-install dom

Verification (authoritative):
- Use interactive container shell (not CLI wrappers)
- php -m | grep -x dom
- php artisan optimize:clear


## SECTION 10: RAILWAY CLI LIMITATIONS

If `railway run` reports:
- Failed to fetch
- GraphQL errors
- DNS lookup failures
- Repeated service selection prompts

Then:
- The command may not have executed in the container
- Output may be stale or misleading

Action:
- Stop using `railway run`
- Switch to `railway ssh`
- Validate state directly inside the container
