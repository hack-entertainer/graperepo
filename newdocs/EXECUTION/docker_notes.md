Docker & Runtime Notes

This document describes how RRDB is expected to run
in development and production.

Key assumptions:
- php artisan serve is not production-grade
- Local Docker must resemble Railway runtime
- Build parity matters more than speed

Runtime stack:
- Caddy
- FrankenPHP
- PHP extensions explicitly installed
- Environment-driven configuration

Operational guidance:
- Prefer rebuilds over clever cache clearing
- Validate locally before pushing to Railway
- Treat runtime differences as bugs

This document reflects operational reality,
not architectural ideals.
