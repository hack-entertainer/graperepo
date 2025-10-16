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

- [ ] **Cross-Browser Compatibility**  
  - Expected: Works on Chrome, Firefox, Safari, Edge.  
  - Status: ❌ (Safari spacing issue).  

---

## Admin Panel
- [x] **Admin Login & Dashboard**  
  - Expected: Admin CRUD and report oversight.  
  - Status: ✅  
  - Route: `/admin/dashboard`  
  - Notes: Minor UI polish (pagination Safari issue).

---

## Robust Identity Verification
- [ ] **review client communications**  
- [ ] **generate AI checklist**  
