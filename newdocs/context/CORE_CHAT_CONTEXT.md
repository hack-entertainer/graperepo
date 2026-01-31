RRDB — Core Conversation Context

Project:
RRDB is a Laravel-based platform for submitting, responding to, and adjudicating
sensitive incident reports.

Primary goals:
- Defensible architecture
- Explicit authority boundaries
- Incremental, auditable feature delivery
- Safe handling of sensitive data

Core principles:
- No implicit permissions
- No authority in views or widgets
- Backend enforces; UI reflects
- Legacy UX is isolated and bridged deliberately
- Shipping correctness > feature breadth

Authority model:
- System roles: admin, moderator (explicit, stored)
- Report roles: contextual, orthogonal to system roles
- Admins act as head moderators
- Role logic is explicit and middleware-driven

UX direction:
- Role-based dashboards
- Dashboards are widget containers
- Widgets represent affordances, not navigation
- New features should enter via widgets when appropriate

Operational assumptions:
- Docker-first development
- Railway production deployment
- FrankenPHP + Caddy runtime
- Cloudinary for file storage
- ULID-based document access
- Hard 404s; soft handling only for unauthorized access

This context is intended to be pasted into new conversations
to avoid re-deriving system assumptions.
