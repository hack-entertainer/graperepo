# System Design Documentation  
## RRDB (Rape Report Database)

### Document Purpose

This document captures the **design intent, architectural decisions, constraints, and tradeoffs** of the RRDB platform.

It exists to:
- Preserve engineering reasoning
- Explain *why* the system is built the way it is
- Prevent future re-litigation of settled decisions
- Serve as a seed for future platforms with similar trust and governance needs

This document is cumulative and narrative.  
Release readiness is tracked separately in `QA_Checklist.md`.

---

## 1. System Overview

RRDB is a Laravel-based platform for submitting, responding to, and discussing sensitive incident reports. The system emphasizes:

- Authenticated participation
- Controlled visibility of sensitive evidence
- Explicit acknowledgments and attestations
- Clear authority boundaries between users, moderators, and administrators
- Incremental hardening over speculative feature expansion

The system is designed to be **defensible first**, extensible second.

---

## 2. Core Domain Model

### Reports
A Report represents the primary case artifact. It includes:
- A unique, human-readable report identifier
- Narrative content
- Classification by incident type
- Relationships to responses, comments, and evidence documents

Reports are immutable in identity but mutable in associated discourse.

### Responses
Responses represent formal replies by the reported party.  
They are:
- Authenticated
- Explicitly acknowledged
- Permanently linked to a report

Multiple responses per report are allowed.

### Comments
Comments function as:
- Community discourse
- Juror-like deliberation
- Future extensibility point for motions, votes, and outcomes

At present, comments are linear and unactioned.

---

## 3. Identity, Authentication, and Trust

### Authentication Model
- All meaningful interaction requires authentication.
- Anonymous access is read-only and limited.
- Laravel’s standard authentication stack is used intentionally.

### Acknowledgments
Users must explicitly acknowledge authorship and truthfulness when submitting:
- Reports
- Responses
- Comments

These acknowledgments are a **legal and psychological boundary**, not merely UI friction.

### Deferred Identity Verification
Formal identity verification is intentionally deferred.
The system is designed to accept stronger identity guarantees later without schema or architectural rewrites.

---

## 4. Authorization & Governance Model

### Platform Roles
- Admin: Full system authority within engineered constraints
- Moderator: Scoped authority over reports and related content
- User: Authenticated participant without governance power

Admins can grant and revoke moderator privileges.

### Incident-Relative Roles (Conceptual)
Users may derive roles relative to a specific report, such as:
- Reporter
- Reported subject
- Juror
- Party / witness

These roles inform authorization decisions but do not override platform-level authority.

### Authority Safeguards
- Admin authority is absolute within implemented boundaries
- Safeguards exist to prevent loss of administrative continuity
- Moderator authority is explicitly constrained and non-escalatory

---

## 5. Evidence & File Handling

### Design Goals
- No public access to sensitive evidence
- No direct exposure of third-party storage URLs
- Access control enforced server-side
- Auditability preserved

### Current Implementation
- Files stored in Cloudinary
- Metadata stored in a dedicated `documents` table
- ULIDs used to prevent enumeration
- Files streamed through Laravel controllers
- Cloudinary Admin API used for retrieval
- No CDN caching
- No public URLs rendered in views

### Tradeoffs
- Signed Cloudinary URLs rejected due to plan limitations
- Server-side streaming chosen over redirect-based delivery
- Performance accepted as “good enough” given security posture

### Future Extensions
- Role-based document visibility
- Download auditing
- Tokenized or expiring access
- Juror- or admin-only evidence

---

## 6. Security Posture

### Threat Model
Primary threats considered:
- Unauthorized evidence access
- URL leakage
- ID enumeration
- Privilege escalation
- Malware uploads

### Controls
- Auth-gated controllers
- Non-guessable identifiers
- No raw storage URLs
- Explicit upload pipeline
- Planned ClamAV scanning (fail-closed)

### Known Gaps (Intentional or Pending)
- Malware scanning not yet enforced
- Fine-grained RBAC enforcement pending
- No rate-limiting on downloads yet

---

## 7. UI / UX Philosophy

The UI favors:
- Clarity over density
- Explicit acknowledgments
- Spacious text areas for serious content
- Functional responsiveness across devices

Visual polish is secondary to correctness and legibility.

Known issues (e.g. Safari spacing) are tracked but non-blocking.

---

## 8. Administrative Interface

The admin interface exists to:
- Maintain system integrity
- Enforce governance decisions
- Moderate content

Admins can:
- Promote and demote users
- Assign moderators
- Oversee reports and evidence

Moderators operate strictly within powers granted by admins and engineering.

Administrative actions are expected to be auditable in the future.

---

## 9. Constraints & Non-Goals

The system intentionally avoids:
- Premature judicial automation
- Opinionated legal workflows
- Overly complex identity systems
- Feature expansion before hardening
- Public evidence distribution

RRDB is a **platform for structured discourse**, not a court.

---

## 10. Release Philosophy

A release is considered acceptable when:
- Core flows are stable
- Sensitive assets are protected
- Authorization boundaries are enforced
- Known limitations are documented
- Deferred features are intentional

Shipping is a **controlled decision**, not an accident.

---

## 11. Forward Compatibility

Many design decisions are expected to generalize to future systems:
- Trust-first UX
- Server-mediated access control
- Explicit authority boundaries
- Deferred but anticipated features

These patterns may be extracted into reusable project scaffolds or “platform jigs” over time.

---

### Closing Note

This document is a snapshot of intent, not a claim of finality.  
It should evolve slowly, deliberately, and only when understanding deepens.
