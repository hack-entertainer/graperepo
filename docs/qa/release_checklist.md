# Release Checklist – File Uploads, Payments, and Infrastructure

This checklist must be reviewed and explicitly verified before deploying to **staging** or **production**.

Nothing in this system is allowed to “just work by default”.

---

## 1. PHP Runtime Configuration (CRITICAL)

Verify **web SAPI** configuration (not CLI):

- [ ] `upload_max_filesize` ≥ largest supported upload  
  - **Recommended:** `>= 150M` (videos grow)
- [ ] `post_max_size` ≥ `upload_max_filesize` + form overhead  
  - **Recommended:** `>= 160M`
- [ ] `memory_limit` sufficient for large multipart uploads  
  - **Recommended:** `>= 512M` or `-1` (unlimited)
- [ ] `max_execution_time` sufficient for slow uploads  
  - **Recommended:** `>= 120`
- [ ] `max_input_time` sufficient for slow uploads  
  - **Recommended:** `>= 120`
- [ ] `file_uploads = On`

**Verify using the web runtime**, not CLI:
- Temporary route using `phpinfo()`
- Or a diagnostic controller action

---

## 2. Web Server Layer (Apache / Nginx)

Confirm server-level limits do not override PHP:

### Apache
- [ ] `LimitRequestBody` not set or set sufficiently high
- [ ] No per-vhost overrides restricting uploads

### Nginx (if applicable)
- [ ] `client_max_body_size` ≥ PHP limits

---

## 3. Laravel Configuration

- [ ] `SESSION_DRIVER` stable for multi-step Stripe flow (`file`, `redis`, or `database`)
- [ ] Session storage writable and persistent
- [ ] `APP_URL` correct (Stripe redirects depend on it)
- [ ] `APP_ENV` correct for Cloudinary + Stripe mode

---

## 4. Cloudinary Configuration

- [ ] `CLOUDINARY_URL` set in environment
- [ ] Video uploads use `resource_type = video`
- [ ] Document uploads use `resource_type = raw`
- [ ] Folder structure correct:
  - `reports/letters`
  - `reports/videos`
- [ ] Test upload visible in Cloudinary dashboard

---

## 5. Stripe Payment Flow

- [ ] Stripe keys correct for environment (test vs live)
- [ ] Success URL reachable and returns 200
- [ ] Cancel URL reachable and cleans up uploaded files
- [ ] Database write occurs **only after** Stripe success
- [ ] Failed / canceled payments do **not** leave orphaned uploads

---

## 6. Database Integrity

- [ ] Columns exist:
  - `letter_public_id`
  - `letter_public_url`
  - `video_public_id`
  - `video_public_url`
- [ ] No legacy paths relied upon for new uploads
- [ ] New reports persist Cloudinary IDs and URLs correctly

---

## 7. UI / UX Validation

- [ ] PDF download link visible when present
- [ ] Video link visible when present
- [ ] No broken links when files are absent
- [ ] Form submission with:
  - No files
  - PDF only
  - Video only
  - PDF + video
- [ ] All cases complete Stripe flow successfully

---

## 8. Cleanup & Failure Modes

- [ ] Stripe cancel deletes uploaded files (Cloudinary destroy)
- [ ] Partial uploads do not block resubmission
- [ ] No stale session data after success or cancel

---

## 9. Post-Deploy Verification

- [ ] Upload real PDF
- [ ] Upload real MP4
- [ ] Complete payment
- [ ] Verify DB row
- [ ] Download / view files from report detail page
- [ ] Confirm Cloudinary assets exist and are accessible

---

## 10. Explicit Sign-Off

This release is not approved until **all** above items are checked.

- Environment verified: ☐ Staging ☐ Production
- Verified by: ______________________
- Date: _____________________________
