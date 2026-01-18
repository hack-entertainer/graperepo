System Design — RRDB

This document defines the architectural intent and invariants
of the RRDB platform.

Non-goals:
- CMS-style flexibility
- Implicit permissions
- Magical recovery paths
- Over-generalized abstractions

Core invariants:
- Authority must be explicit and auditable
- Roles are data, not behavior
- No UI element grants authority
- Legacy behavior must not contaminate new systems

Primary subsystems:
- Authentication & identity
- RBAC (system + report roles)
- Reporting & response lifecycle
- Moderation and adjudication
- Secure document handling

Design philosophy:
- Prefer clarity over cleverness
- Prefer boring, proven patterns
- Optimize for recovery and inspection
- Ship incrementally with confidence

This document should change slowly.
