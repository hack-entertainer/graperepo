
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
Fix errors in web.php w/ chat's help

### [Step 6]
Comment out this glitchy line in web.php, at the end:
```// Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
//     Lfm::routes();
// });```
