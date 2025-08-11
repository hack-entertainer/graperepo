
---

## **Next Step:**
1. **Create this `MIGRATION_LOG.md` in your repo root right now.**
2. **Copy the above template into it.**
3. **Start filling it out as you work.**

**You can duplicate a block for every new major action.**

---

**Bonus:**  
Want a bash alias for fast checkpointing?
```sh
alias gitcp='git add . && git commit -m "Checkpoint: $(date "+%Y-%m-%d %H:%M")" && git tag cp-$(date "+%Y%m%d-%H%M")'



# Migration/Reset Log

## Context
- Repo: <repo_url>
- Branch: <branch or tag>
- DB: MySQL / Postgres / other

---

### [Step 1] Clone and Checkout

**Date/Time:** 2025-08-08 17:34  
**Command(s):**
```sh
git clone <repo_url>
cd <repo_folder>
git checkout <commit-or-tag>
git checkout -b <new-branch>

Note: checkout a new branch, then reset it to the first commit. This allows a from-scratch rebuild.

### [Step 2] Install Mysql
$~ brew install mysql@8.0 && brew link --force mysql@8.0
$~ mysql -u root
>>>SHOW DATABASES;
>>>DROP DATABASE IF EXISTS <dbname>; CREATE DATABASE <dbname>;
$~ mysql -u rapereportdbkend_ken -p rapereportdbkend_ken < rapereportdbkend_ken.sql

### [Step 2.5/3] update scripts to include ssl workarounds
"scripts": {
    "dev": "cross-env NODE_OPTIONS=--openssl-legacy-provider npm run development",
    "development": "cross-env NODE_ENV=development node_modules/webpack/bin/webpack.js --progress --hide-modules --config=node_modules/laravel-mix/setup/webpack.config.js",
    "watch": "cross-env NODE_OPTIONS=--openssl-legacy-provider npm run development -- --watch",
    "watch-poll": "npm run watch -- --watch-poll",
    "hot": "cross-env NODE_OPTIONS=--openssl-legacy-provider NODE_ENV=development node_modules/webpack-dev-server/bin/webpack-dev-server.js --inline --hot --disable-host-check --config=node_modules/laravel-mix/setup/webpack.config.js",
    "prod": "cross-env NODE_OPTIONS=--openssl-legacy-provider npm run production",
    "production": "cross-env NODE_ENV=production node_modules/webpack/bin/webpack.js --no-progress --hide-modules --config=node_modules/laravel-mix/setup/webpack.config.js",
    "build": "cross-env NODE_OPTIONS=--openssl-legacy-provider npm run production"
}

### [Step 4] update storage paths
mkdir -p storage/framework/sessions
chmod -R 775 storage
php artisan config:cache

Note: may need to migrate this for out-of-the-box function

## ==>>SERVES LOCALLY FROM HERE; TAGGED DEPLOY 0d95a1a<<== ##

### [Step 5]
fix errors in web.php with chat\'s help

### [Step 6]
Comment out this glitchy line in web.php, at the end:
```// Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
//     Lfm::routes();
// });```

### [Step 7]
create needed directories to fix 'php artisan view:clear'
`mkdir -p storage/framework/views`
`chmod -R 775 storage/framework`

### [Step 8]
## Fixing “Failed to clear cache” in Laravel

If running `php artisan cache:clear` returns:

```
ERROR  Failed to clear cache. Make sure you have the appropriate permissions.
```

Follow these steps:

1. **Ensure cache driver is set to `file`**  
   Edit `.env` and set:
   ```env
   CACHE_DRIVER=file
   ```

2. **Rebuild the cache directory structure**
   ```bash
   rm -rf storage/framework/cache
   mkdir -p storage/framework/cache/data
   ```

3. **Fix file and folder permissions**
   ```bash
   sudo chown -R $USER:$USER storage bootstrap/cache
   chmod -R 775 storage bootstrap/cache
   ```

4. **Remove any stale bootstrap cache files**
   ```bash
   rm -f bootstrap/cache/*.php
   ```

5. **Clear the cache**
   ```bash
   php artisan cache:clear
   ```

