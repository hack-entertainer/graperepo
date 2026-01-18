Seeding & Bootstrap Invariants

Purpose:
This document defines how the system reaches a safe, operable state
from an empty database.

Principles:
- Seeding must be idempotent
- Seeding must be deterministic
- Recovery must not rely on UI access
- Authority bootstrap is explicit and opt-in

Admin bootstrap:
- Admin creation is env-driven
- Exactly one admin may be created at seed time
- Existing users may be promoted safely
- No implicit escalation paths exist

System settings:
- Required singleton settings are enforced
- Missing settings are treated as fatal configuration errors
- Seeders act as schema-model contract enforcers

Seeding is part of system safety, not convenience.
