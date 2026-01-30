LOCAL DOCKER + FRANKENPHP TROUBLESHOOTING (QUICK)

# SECTION 1: FIRST QUESTION
Did I change code, config, or credentials?
- Yes → clear caches
- No → suspect logic, data, or browser state

# SECTION 2: CACHE-BUSTING (RUN IN THIS ORDER)

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

# SECTION 3: DOCKER SANITY

Is anything running?
docker ps

Changed code?
docker build -t graperepo-franken .

# SECTION 4: MYSQL SANITY

Can the container reach MySQL?
docker run --rm \
  --add-host=host.docker.internal:host-gateway \
  graperepo-franken \
  php -r "new PDO('mysql:host=host.docker.internal;port=3306;dbname=graperepo','laravel','yourpassword'); echo 'DB OK';"

Is MySQL listening?
ss -lntp | grep 3306

Expected:
0.0.0.0:3306

# SECTION 5: BROWSER GOTCHAS

If it works in Incognito but not normal:
- Clear site data for localhost
- DevTools → Application → Clear Storage
- Chrome HSTS: chrome://net-internals/#hsts

# SECTION 6: WHEN TO SUSPECT INFRA

Only suspect infra if:
- Container exits immediately
- docker ps shows nothing
- MySQL is not listening
- PDO test fails
- Browser cannot connect at all

# SECTION 7: 30-SECOND RESET

docker build -t graperepo-franken .
docker run --rm \
  -p 8000:80 \
  --add-host=host.docker.internal:host-gateway \
  graperepo-franken

Open:
http://localhost:8000/

MENTAL MODEL
Infra problems stop the app.
App problems throw stack traces.
Cache problems lie.



IS DOCKER REBUILDING PART OF TROUBLESHOOTING?

YES — but only when inputs to the IMAGE change.

NO — when only runtime state or data changes.

---

WHEN YOU MUST REBUILD (`docker build`)
Rebuild the image if you changed any of the following:

- Dockerfile
- PHP extensions (pdo_mysql, intl, etc.)
- System packages (apt, apk, OS deps)
- PHP version or FrankenPHP base image
- File ownership / permissions baked into image
- Anything COPY’ed into the image at build time

Rule:
If it affects what ends up inside the image → rebuild.

---

WHEN YOU SHOULD NOT REBUILD
Do NOT rebuild if you only changed:

- .env values
- Database data
- Laravel config values
- PHP code (controllers, models, views)
- Routes, migrations, seeds
- Cache state
- Browser state

Rule:
If it lives at runtime → clear cache, don’t rebuild.

---

NORMAL TROUBLESHOOTING ORDER

1. Clear Laravel caches
   php artisan optimize:clear

2. Restart container
   docker run … (or stop/start)

3. Clear browser state
   (Incognito test)

4. Rebuild image
   docker build -t graperepo-franken .

You should reach step 4 rarely.

---

WHY THIS MATTERS

Docker rebuilds are expensive and slow.
Cache clears are cheap and deterministic.

Rebuilding too often hides real bugs.
Not rebuilding when needed causes ghosts.

---

ONE-LINE MEMORY AID

Code lies.  
Caches lie more.  
Images only change when you rebuild.


# build
docker build -t graperepo-franken .

# run
docker run --rm -p 8000:80 --add-host=host.docker.internal:host-gateway graperepo-franken


# SECTION: CONTAINER STARTS BUT APP NEVER BOOTS

### Symptom
- FrankenPHP logs appear healthy
- Caddy binds to port
- No Laravel output
- No migrations
- App may return empty responses or static output

### Root Cause (High Probability)
Docker is invoking FrankenPHP directly via `CMD`
instead of running `start.sh`.

### Diagnosis
Check Dockerfile:
grep -R "ENTRYPOINT\|CMD" Dockerfile

If you see:
CMD ["frankenphp", ...]
and no ENTRYPOINT → this is the bug.

### Fix
- Remove FrankenPHP CMD
- Add explicit ENTRYPOINT to start.sh
- Ensure start.sh ends with:
  exec frankenphp run ...

### Why This Is Tricky
This failure mode is *silent*:
- No crashes
- No stack traces
- Looks like infra is fine
But Laravel never executes.

### Mental Model (Extended)
Infra problems stop the app.  
Cache problems lie.  
**Boot-path problems run the wrong program.**
