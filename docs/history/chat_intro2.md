You are continuing work on the **RRDB Laravel Project** — a reporting and judicial review platform that is now build-stable, deployable, and in late-stage pseudo-production hardening.

This new chat focuses on **feature development and forward work**, separate from the recently completed staging/debugging effort.

---

## Project Context (Current State)

- The Laravel codebase has been **fully pruned and stabilized**, retaining only core systems:
  reporting, messaging, user accounts, and admin governance.
- All database migrations have been rebuilt, validated, and successfully run on
  **local, staging, and pseudo-production** environments.
- The application deploys cleanly on **Railway**, with a repeatable Nixpacks-based build.
- Laravel pre-flight checks are clean:
  config, route, and view caches all compile successfully.
- Stripe payments are functional and tested.
- SendGrid SMTP is configured but pending provider activation.
- HTTPS enforcement and environment parity issues have been resolved.
- The system is considered **release-ready from a build and deploy standpoint**.

---

## Recent Diagnostic Outcome (Carry-Forward Context)

- Secure Cloudinary-based uploads and downloads are implemented and working for PDFs.
- A **production-only failure** was isolated in the video upload path:
  video files fail during HTTP upload validation on Railway before reaching Cloudinary.
- PHP memory limits, file size limits, and execution time were verified and ruled out.
- Targeted logging confirms the issue is **infrastructure-level**, not application logic.
- Next step for that issue will likely involve **Cloudinary direct uploads**
  (client → Cloudinary → Laravel callback), but that work is intentionally deferred.
- The system is currently stable with diagnostics in place.

This chat does **not** continue that investigation unless explicitly requested.

---

## Focus of This Chat

This session is for **new feature work and forward progress**, including but not limited to:

- Identity verification (IDV) design and integration
- Admin and governance tooling
- Judicial workflow implementation
- Security hardening and auditability
- UX and flow improvements that do not block deployment

---

## Identity Verification (IDV) — Prior Decision Context

A full IDV provider evaluation has already been completed.

### Selected Provider
**Veriff** is the primary recommended provider, offering:
- IAL2-equivalent assurance (document + biometric verification)
- Global coverage
- SOC 2 / GDPR compliance
- Clear APIs and webhook-driven workflows
- Built-in liveness detection

**Stripe Identity** remains a fallback for low-assurance or Stripe-only flows.

A **manual escalation path** is planned for exceptional or legally sensitive cases.

---

## Working Style & Assumptions

- Professional, implementation-focused, production-oriented.
- No speculative features “because they’re cool.”
- Admin tooling is acceptable when it reduces operational friction
  (diagnostics, migrations, controlled maintenance).
- Code must be secure, auditable, and reversible.
- Assume Laravel boots cleanly and deploys correctly in all environments.
- Files and documentation may be provided incrementally by the user.

---

## Starting Point

You are free to begin working on the next feature or design problem.
Context files will be supplied as needed.
