# QA.Refactoring.notes.md

## Purpose
This file tracks **post-MVP cleanup, refactoring, and QA tasks**.  
It does *not* include functional feature work — only polish, maintainability, and internal consistency.  
Use this as a long-term, appendable checklist.

---

## Blade Templates
- [ ] Replace all legacy storage paths (`asset()`, `Storage::url()`, etc.) with Cloudinary model accessors (`*_url`).
- [ ] Normalize indentation, spacing, and formatting across all report-related blades.
- [ ] Extract modals (Subject Response, Reporter Reply, Buy Credits) into reusable partials.
- [ ] Remove stale commented-out markup and duplicated modal blocks.
- [ ] Audit all file URLs in blades to confirm they're using Cloudinary.
- [ ] Remove dead includes / unused template fragments.

---

## Controllers
- [ ] Break down large methods in `ReportsController` into focused sub-methods (optional, post-MVP).
- [ ] Move pricing and Stripe fee calculations into a dedicated pricing helper or config file.
- [ ] Standardize route parameter naming (`report_id` vs `report_number`).
- [ ] Consider extracting Stripe checkout logic into a PaymentService.

---

## Models
- [ ] Add docblocks to `Reports` and `ReportResponse` for clarity.
- [ ] Add `$casts` where helpful (boolean, datetimes).
- [ ] Confirm all Cloudinary accessors (`video_url`, `letter_url`, `file_url`, etc.) resolve correctly in different environments.

---

## Uploads & Storage (Cloudinary)
- [ ] Implement **file access security** (private uploads, signed URLs, ACLs).
- [ ] Replace ClamAV **stub logs** with real scanning or external scanning service.
- [ ] Add safeguards for upload failures and return friendly messages.
- [ ] Ensure date-based folder structure is consistent (`YYYY_MM`).
- [ ] Consider adding per-report-number foldering later.

---

## Frontend / UX
- [ ] Harmonize modal layout, spacing, button styling, and titles.
- [ ] Improve error message formatting and placement.
- [ ] Standardize confirmation checkboxes across user flows.
- [ ] Verify mobile layout (especially modals and comment panels).
- [ ] replace country field with country selector
- [ ] replace state field with state selector


---

## Testing & QA
- [ ] Test all Stripe flows: report submission, subject response, reporter reply, comment credit purchase.
- [ ] Test Cloudinary uploads for all file types (video, letter, response attachments).
- [ ] Validate behavior with large file uploads near max limits.
- [ ] Confirm that private file URLs cannot be brute-forced.
- [ ] Verify backward compatibility with any stored legacy data.

---

(Feel free to add dates, initials, or ✔︎ marks as items are completed.)
