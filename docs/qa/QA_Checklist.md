# QA Checklist — Laravel Project vs Client Requirements

## Authentication & Registration
- [ ] **Registration Options Updated (3 Choices)**  
  - Expected: After registration, users can choose:  
    1. Post a New Report  
    2. Answer an Existing Report  
    3. Post a Comment  
  - Status: ✅  
  - Route: `/register` → Redirect choice page  
  - Notes: Landing & registration bottom links must reflect 3 choices. 

- [ ] **Landing Page Acknowledgment Middleware**  
  - Expected: Before accessing protected flows (reporting, answering, commenting), user must check acknowledgment box and submit.  
  - Status: ❌ Not Implemented  
  - Route: _(TBD)_  
  - Notes: Middleware, route, and session handling not in place. Needs:  
    - Landing page with checkbox form  
    - POST route to capture acknowledgment  
    - Middleware to gate protected routes  
    - Redirect + scroll UX polish after failure  
---

## Reports (Plaintiff Flow)
- [x] **Report Creation Form**  
  - Expected: File new report with unique ID (`YYYY-RRDB-XXXX`), metadata (reporter, subject, case details).  
  - Status: ✅  
  - Route: `/report/create`  
  - Notes: IDs + metadata confirmed.

- [x] **Report Type Dropdown**  
  - Expected: Dropdown with exactly 6 types (Rape, Sexual Assault, Sexual Abuse, Domestic Violence, Stalking, Sexual Harassment), descending seriousness. Backend validation enforces only these values.  
  - Status: ✅  
  - Route: `/report/create`  
  - Notes: Confirmed working & safe.

- [x] **Report Acknowledgment Checkbox**  
  - Expected: Must check box to confirm truth before submission.  
  - Status: ✅  
  - Notes: Validation in place.

- [x] **Report Detail Page**  
  - Expected: Shows Report Number, Type, Narrative, Evidence (letter/video), Reporter’s Reply, Subject’s Response, Community Comments, and Comment Box.  
  - Status: ✅  
  - Route: `/report-detail/{report_number}`  
  - Notes: Feature-complete from a happy-path perspective. ⚠️ Payment Status not yet needed but will be required if Draft Reports are introduced.

- [ ] **Cloudinary File Security (Post-Release Hardening)**  
  - Expected: Uploaded videos and letters are not publicly accessible via raw URLs.  
  - Status: ⚠️ Deferred (Known Limitation — Now Designed)  
  - Notes:  
    - **Current State**  
      - Files are uploaded to Cloudinary and stored as public URLs.  
      - URLs are persisted and rendered conditionally.  
      - No access control is enforced yet.  

    - **Planned Security Model (v1.1)**  
      - Files are treated as protected evidence assets.  
      - Cloudinary URLs are **never rendered directly** in Blade.  
      - Downloads are served via applica
    - **Access Policy**  
      - Users derive zero or more **report-relative roles**:  
        - `admin` (system administrator)  
        - `reporter` (creator of report)  
        - `reported` (identified subject, confirmed by admin)  
        - `juror` (assigned by admin)  
        - `party` (additional permitted participant, e.g. witness)  
        - `unrelated` (logged-in user with no report role)  
        - `public` (anonymous browser)  
      - Each document declares **accepted roles**.  
      - Access is granted if the intersection of:  
        - user’s derived roles  
        - document’s accepted roles  
        is non-empty, **or** the document is marked `public`.  

    - **Download Flow**  
      - Download links are conditionally rendered based on role eligibility.  
      - On click, Laravel **re-authenticates and re-authorizes** the request.  
      - If authorized:  
        - A **single-use, short-lived token** is minted server-side.  
        - Token is immediately resolved into a **short-lived signed Cloudinary URL**.  
        - Token is burned on use.  
        - User is redirected immediately to Cloudinary for download.  
      - Cloudinary URLs are therefore:  
        - ephemeral  
        - non-reusable in practice  
        - invisible to templates  

    - **Logging / Auditability**  
      - Every download request is logged, regardless of outcome.  
      - Logged fields include:  
        - user (or anonymous)  
        - report  
        - document  
        - derived role(s)  
        - outcome (allowed / denied / expired / invalid)  
        - IP address  
        - User-Agent  
      - Enables future abuse detection, rate limiting, and audit trails.  

    - **Future Extensions (Explicitly Supported)**  
      - Public documents (anonymous or authenticated)  
      - Juror-only or admin-only evidence  
      - Draft / embargoed documents  
      - Per-role TTL adjustments  
      - Server-streamed delivery for sensitive assets  
    - No schema changes required to implement baseline model.
---

## Answers (Defendant Flow)
- [ ] **Answer Submission Form**  
  - Expected: Defendant can file Answer linked to Report. Large text box required.  
  - Status: ✅  
  - Route: `/answer/create/{report}`  
  - Notes: Must support multiple defenses, counterclaims.

- [ ] **Answer Acknowledgment Checkbox**  
  - Expected: User confirms authorship + truth.  
  - Status: ✅  

- [ ] **Answer Post-Submission Navigation**  
  - Expected: Option to (1) Post another Answer, or (2) Return to DB/Search.  
  - Status: ✅  

---

## Comments (Juror Flow)
- [ ] **Comment Creation Form**  
  - Expected: Registered users can post comments under Reports. Spacious, long text box.  
  - Status: ✅  
  - Route: `/comment/create/{report}`  

- [ ] **Comment Acknowledgment Checkbox**  
  - Expected: User must confirm authorship + truth.  
  - Status: ✅  

- [ ] **Purchase Additional Comments**  
  - Expected: Link to Stripe/Gumroad for buying extra comment slots.  
  - Status: ✅ (no gumroad integration, yet... discuss...)

- [ ] **Comment Post-Submission Navigation**  
  - Expected: Buttons: “Write Another Comment” OR “Return to Database”.  
  - Status: ✅ (not necessary under current navigation options)  

---

## Legal / Judicial Flow
- [ ] **Motions & Trials via Comments**  
  - Expected: Comments drive votes on motions and trials.  
  - Status: ❌  
  - Notes: DB schema + vote-tracking logic required.  

---

## Database & Search
- [ ] **Search by Report ID**  
  - Expected: Search & retrieve by case ID (`YYYY-RRDB-XXXX`).  
  - Status: ✅  
  - Notes: Currently limited to Report title/ID only.  

- [ ] **Search by User (Author)**  
  - Expected: Search reports/answers/comments by user name.  
  - Status: ✅  

- [ ] **Return to Database after Submission**  
  - Expected: All flows should provide “Return to DB/Search” button.  
  - Status: ✅  

---

## UI / UX
- [ ] **Spacious Text Areas**  
  - Expected: Reports, Answers, Comments have large text entry fields.  
  - Status: ⚠️  

- [ ] **Responsive Layout**  
  - Expected: Mobile, tablet, and desktop support (Tailwind breakpoints).  
  - Status: ✅  

---

## Console & Browser
- [ ] **Zero Console Errors**  
  - Expected: No JS errors/warnings in browser console.  
  - Status: ⚠️ (minor warnings remain).  

- [❌] **Cross-Browser Compatibility**  
  - Expected: Works on Chrome, Firefox, Safari, Edge.  
  - Status: ❌ (Safari spacing issue).  

---

## Admin Panel & System Governance

- [✅] **Admin Login & Dashboard**  
  - Expected: Admin access to dashboard, CRUD operations, and report oversight.  
  - Status: ✅  
  - Route: `/admin/dashboard`  
  - Notes: Core functionality complete. Minor UI polish outstanding  
    (pagination Safari spacing issue).

- [ ] **User Administration & Governance Controls**  
  - Expected: Admins can fully administer users and system roles within  
    capabilities implemented by engineering.  
  - Status: ⚠️ Policy Defined / UI Partially Implemented  

  - Authority Model:  
    - **Engineering** defines and implements all system capabilities  
      (architecture, limits, overrides).  
    - **Admins** have complete authority over everything exposed by engineering.  
    - **Moderators** operate only within powers explicitly designed by admins.  

  - Admin Capabilities:  
    - Promote users up to and including `admin`  
    - Demote users (including removal of `moderator` or `admin`)  
    - Freeze user accounts (disable access without deletion)  
    - Unfreeze user accounts  
    - Assign or revoke platform-level roles (`admin`, `moderator`)  
    - Assign incident-relative roles (jurors, reported identity, parties)  
    - Manage report oversight and content visibility within system limits  

  - Constraints & Governance:  
    - Only admins may create or remove moderators.  
    - Moderators cannot promote, demote, or assign platform authority.  
    - No in-system role supersedes admin authority.  
    - Developer override exists outside the application and is not part of  
      normal system governance.  

  - Trust Model:  
    - Admins possess total system power within implemented boundaries.  
    - The admin role is reserved for the most highly trusted individuals  
      (the client and explicitly designated designees).  

  - Audit Expectations (Future):  
    - Administrative actions should be logged for traceability  
      (who acted, what action was taken, when).      

  - Admin Continuity Safeguard:  
    - The system must always retain **at least two active admins**.  
    - An admin may be **demoted** only if doing so leaves **two or more**
      admins remaining.  
    - Those remaining admins must each have **logged in within the previous
      24 hours**, ensuring active stewardship and communication.  
    - Demotion is disallowed if any of these conditions are not met.  
    - This safeguard exists to prevent loss of system authority and to protect
      against “hit-by-a-bus” scenarios.

---

## Moderation (Report-Level Authority)

- [ ] **Moderator Role & Capabilities**  
  - Expected: Moderators manage reports and related content without access  
    to sitewide or system-level settings.  
  - Status: ⚠️ Policy Defined / UI Pending  

  - Moderator Capabilities:  
    - Review and moderate reports  
    - Manage report status and lifecycle within defined workflows  
    - Moderate comments and evidence associated with reports  
    - Access protected documents if document visibility allows `moderator`  
    - Perform incident-level oversight and intervention  

  - Explicit Restrictions:  
    - Moderators cannot access or modify sitewide settings  
    - Moderators cannot promote or demote users  
    - Moderators cannot assign or revoke platform roles  
    - Moderators cannot create or remove other moderators or admins  

  - Governance Notes:  
    - Moderators are designated by admins only  
    - Moderator authority is scoped strictly to report management  
    - All moderator powers exist within limits defined by engineering  
      and granted by admins  

  - Audit Expectations (Future):  
    - Moderator actions should be logged separately from admin actions  
      for traceability and accountability.

---

## Robust Identity Verification
- [ ] **review client communications**  
- [ ] **generate AI checklist**  

---

## Misc. bugs
- [ ] **users can see entire dashboard**

## Tech Debt./ Shipping requirements / Misc.
- [ ] restrict Stripe to ACH payments.

