# Release Checklist — RRDB (Concrete Shipping Pipeline)

This checklist governs **promotion of builds** from staging → smoketest → production.
All environments share the **same Dockerfile, start.sh, and boot path**.
Promotion is performed via **Git merge + push**, not infra mutation.

Nothing is allowed to “just work by default”.

---

## 0. Promotion Model (Non-Negotiable)

- Environments:
  - `staging` → implementation and fixes
  - `smoketest` → prod-parity verification gate
  - `production` → observation + serving only

- Promotion rule:
  - Code moves **forward only**
  - No direct changes in production
  - All prod releases originate from smoketest-verified commits

- Rollback rule:
  - Checkout known-good **tag**
  - Push to target environment
  - No infra changes required

---

## 1. Git Discipline (Release Control)

- [ ] Release commit is **tagged**
  - e.g. `vYYYY.MM.DD`, `release-YYYYMMDD`, or semantic tag
- [ ] Tag points to a commit that:
  - Booted successfully
  - Ran migrations cleanly
  - Served traffic in smoketest
- [ ] Production deploys **only tagged commits**
- [ ] Rollback path verified (tag can be re-pushed)

---

## 2. Container Boot Verification (Critical)

- [ ] Dockerfile uses **ENTRYPOINT → start.sh**
- [ ] FrankenPHP is **not** invoked directly via CMD
- [ ] `start.sh` responsibilities confirmed:
  - Filesystem prep (storage, cache, logs)
  - Forced, idempotent migrations
  - Env-gated seeders
  - `exec frankenphp run …` as final step

Failure signature to watch for:
- FrankenPHP starts
- No Laravel logs
- No migrations  
→ Broken boot path

---

## 3. PHP Runtime Configuration (Web SAPI)

Verify via **web runtime**, not CLI:

- [ ] `upload_max_filesize` ≥ 150M
- [ ] `post_max_size` ≥ upload + overhead
- [ ] `memory_limit` ≥ 512M (or unlimited)
- [ ] `max_execution_time` ≥ 120
- [ ] `max_input_time` ≥ 120
- [ ] `file_uploads = On`

---

## 4. Laravel Runtime Sanity

- [ ] `APP_ENV` correct
- [ ] `APP_URL` correct (Stripe redirects)
- [ ] Session driver stable
- [ ] Storage directories writable
- [ ] No debug config in smoketest / prod

---

## 5. Database Integrity

- [ ] Migrations run automatically at boot
- [ ] No missing tables or columns
- [ ] Seeders are:
  - Idempotent
  - Env-gated
- [ ] No manual DB intervention required

---

## 6. External Services (Prod-Grade)

### Cloudinary
- [ ] Correct credentials
- [ ] Correct resource types (`raw`, `video`)
- [ ] Folder structure verified
- [ ] Upload + retrieval tested

### Stripe
- [ ] Keys match environment
- [ ] Success + cancel URLs reachable
- [ ] DB writes only after confirmed success
- [ ] Cancel path cleans up external resources

---

## 7. UI / UX Sanity

- [ ] All submission paths exercised:
  - No files
  - PDF only
  - Video only
  - PDF + video
- [ ] No broken links
- [ ] No silent failures
- [ ] Errors are explicit and user-visible

---

## 8. Smoketest Gate (Before Prod)

Smoketest must demonstrate:
- Clean boot
- Real credentials
- Real uploads
- Real payments (or live-equivalent flows)
- Stable serving under normal usage

If smoketest passes:
→ Production is a **promotion**, not a new deployment.

---

## 9. Production Bug Policy (Hard Rule)

- Production is **observation-only**
- No direct fixes in production
- Bugs are:
  - Identified via prod logs/signals
  - Fixed in **staging**
  - Verified in **smoketest**
  - Tagged
  - Promoted to **production**

---

## 10. Production Day Behavior

- [ ] No feature changes
- [ ] No schema changes
- [ ] Monitor logs and error rates
- [ ] Improve logging / observability only

---

## 11. Explicit Release Sign-Off

- Tagged release: ______________________
- Smoketest verified: ☐
- Promoted to production: ☐
- Date: _______________________________
