# Laravel + MySQL Local Setup from Scratch

# 1️⃣ Clone the repo and checkout your starting branch/commit
git clone <repo-url> project-name
cd project-name
git checkout <branch-or-commit>

# 2️⃣ Install PHP dependencies
composer install

# 3️⃣ Install Node.js dependencies
npm install

# 4️⃣ Ensure .env file exists and is configured
cp .env.example .env
# Edit .env and set DB_DATABASE, DB_USERNAME, DB_PASSWORD to your MySQL values
# Example:
# DB_DATABASE=rapereportdbkend_ken
# DB_USERNAME=rapereportdbkend_ken
# DB_PASSWORD=yourpassword

# 5️⃣ Ensure storage and bootstrap/cache directories exist with correct permissions
mkdir -p storage/framework/{cache,data,sessions,testing,views}
mkdir -p bootstrap/cache
chmod -R 775 storage bootstrap/cache
chown -R $USER:$USER storage bootstrap/cache

# 6️⃣ Clear Laravel caches
php artisan view:clear
php artisan config:clear
php artisan route:clear
php artisan cache:clear

# 7️⃣ Create MySQL database (inside MySQL shell)
mysql -u root -p

# Inside MySQL:
DROP DATABASE IF EXISTS rapereportdbkend_ken;
CREATE DATABASE rapereportdbkend_ken CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

# 8️⃣ Delete and recreate MySQL user (inside MySQL shell)
DROP USER IF EXISTS 'rapereportdbkend_ken'@'localhost';
CREATE USER 'rapereportdbkend_ken'@'localhost' IDENTIFIED BY 'yourpassword';
GRANT ALL PRIVILEGES ON rapereportdbkend_ken.* TO 'rapereportdbkend_ken'@'localhost';
FLUSH PRIVILEGES;
EXIT;

# 9️⃣ Load the trusted MySQL dump
mysql -u root -p rapereportdbkend_ken < /path/to/rapereportdbkend_ken.sql

# 🔟 Run migrations (if needed)
php artisan migrate

# 1️⃣1️⃣ Build frontend assets
npm run dev   # For development
npm run prod  # For production build

# 1️⃣2️⃣ Serve the Laravel app locally
php artisan serve

# ℹ️ Node.js Compatibility Note:
# This project’s npm scripts include NODE_OPTIONS=--openssl-legacy-provider
# to fix Webpack build issues with Node.js 17+ and OpenSSL 3.
# Always include this flag if running Webpack manually.
