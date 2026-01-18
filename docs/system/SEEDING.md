# Database Seeding — RRDB

This document describes how database seeders are structured, why they exist,
and how they are expected to be used in RRDB.

Seeders in this project are **not test data**.
They encode *system invariants* and *bootstrap assumptions* that must hold
for the application to function correctly.

---

## Guiding Principles

1. **Seeders establish invariants**
   - If a Blade view or controller assumes data exists, that data must be seeded.
   - Null checks are not a substitute for missing system state.

2. **Seeders must be idempotent**
   - Safe to run multiple times
   - Never destructive
   - Never overwrite admin-managed data

3. **Production seeders run automatically**
   - Seeders wired into `DatabaseSeeder` run on container boot
   - No routine SSH access is required to initialize data

4. **Environment-gated behavior is explicit**
   - Some seeders depend on environment variables
   - Absence of required env vars must result in a no-op, not failure

---

## Seeder Execution Model

Seeders are executed during application startup via `start.sh`:

    php artisan migrate --force
    php artisan db:seed --force

This ensures:
- deterministic deployments
- parity across local, staging, and production
- no reliance on manual intervention

---

## Seeder Directory Structure

    database/
    └── seeders/
        ├── DatabaseSeeder.php
        ├── SystemSettingsSeeder.php
        │
        ├── Users/
        │   ├── AdminUsersSeeder.php
        │   └── (future user seeders)
        │
        ├── Roles/
        │   └── (role / permission seeders)
        │
        ├── Taxonomy/
        │   └── (controlled vocabularies: report types, statuses)
        │
        ├── Content/
        │   └── (default pages, templates, CMS bootstrap content)
        │
        ├── Dev/
        │   └── (non-production-only seeders)
        │
        └── QA/
            └── (deterministic test fixtures)

Empty directories are intentionally retained as **architectural hints**.

---

## DatabaseSeeder.php

`DatabaseSeeder` is the **only file** that determines which seeders run
automatically.

Example:

    public function run(): void
    {
        $this->call([
            \Database\Seeders\Users\AdminUsersSeeder::class,
            \Database\Seeders\SystemSettingsSeeder::class,
        ]);
    }

Only seeders listed here are allowed to execute during normal startup.

---

## Admin User Seeding

Admin users are seeded via environment variables.

This supports:
- cold-start production recovery
- admin replacement
- disaster scenarios without DB access

Characteristics:
- idempotent
- never deletes or demotes users
- safe to run on every boot

---

## System Settings Seeding

The system currently assumes the existence of a **singleton Settings row**.

The `SystemSettingsSeeder`:
- creates exactly one row if none exists
- populates all required fields with safe defaults
- does nothing if a row already exists

Admins are expected to manage settings via the UI after bootstrap.

This seeder exists to support a **transitional CMS** and documents intentional
technical debt until a more robust CMS is adopted or built.

---

## Dev and QA Seeders

Seeders under `Dev/` and `QA/`:

- are **never wired into DatabaseSeeder**
- are run manually when needed
- may assume local or test-only conditions

They must not be relied upon for production correctness.

---

## What Seeders Must Not Do

Seeders must never:
- delete data
- mutate user-generated content
- demote or revoke authority
- depend on request context
- assume a specific deployment environment

---

## Summary

Seeders in RRDB are part of the system’s **contract with reality**.

They exist to:
- guarantee required state
- remove hidden assumptions
- eliminate manual initialization steps
- make deployments concrete and repeatable

If the application “expects” something to exist, it belongs in a seeder.
