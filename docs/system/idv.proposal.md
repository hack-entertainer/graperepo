# Identity Verification (IDV) Provider Evaluation  
**Prepared by:** [Your Name]  
**Date:** November 5, 2025  

---

## 1. Purpose
The project requires a **high-fidelity identity-verification system** to prevent false reports and impersonation on a pseudo-judicial platform.  
The chosen solution must:
- Produce **legally defensible proof of identity**  
- Integrate cleanly with **Laravel + Stripe**  
- Support **international users**  
- Balance **security, compliance, and developer efficiency**

---

## 2. Evaluation Criteria
| Category | Description |
|-----------|-------------|
| **Legal Defensibility** | Strength of certifications, audit trail, and independent verification standards (SOC 2, ISO 27001, ISO 30107-3 L2, eIDAS, etc.) |
| **Integration Simplicity** | Time and complexity to integrate in Laravel using REST, webhooks, or SDKs |
| **Global Coverage** | Ability to verify users in multiple countries and document types |
| **Audit Trail & Retention** | Clarity and control over data retention, webhook logs, and evidence export |
| **Scalability / Cost** | Predictable pricing, API limits, and ability to expand later |
| **Vendor Stability** | Maturity, client base, and service reliability |

---

## 3. Providers Reviewed

| Provider | Legal & Security Credentials | Integration Ease | Global Coverage | Audit / Evidence Controls | Notes |
|-----------|-----------------------------|------------------|-----------------|----------------------------|-------|
| **Veriff** | SOC 2 Type II, ISO 27001, ISO 30107-3 Level 2 (anti-spoof), GDPR-compliant | ⭐⭐⭐⭐⭐ (simple REST + webhook) | 230+ countries / 12k docs | Full webhook data + export, 90-day → 3-year archive | Best balance of global reach and defensibility |
| **Onfido (Entrust)** | SOC 2 II, ISO 27001, ISO 30107-3 L2, eIDAS Substantial | ⭐⭐⭐⭐☆ (official PHP SDK) | 195 countries / 2,500 doc types | Strong reports and manual review options | Slightly heavier setup; top enterprise credibility |
| **Stripe Identity** | SOC 2 II, ISO 27001, PCI L1; no formal IAL2 claim | ⭐⭐⭐⭐☆ (tight Laravel fit) | Primarily U.S./EU focus | API & webhooks; limited data export depth | Fastest to deploy; may need escalation path |
| **Trulioo** | SOC 2 II, ISO 27001, eIDAS High, NIST-aligned | ⭐⭐☆ (multi-API model) | 195 countries / gov databases | Full compliance reports | Excellent global assurance; heavier integration |
| **ID.me** | NIST 800-63A IAL2 certified (U.S.) | ⭐⭐⭐ (OIDC/SAML flow) | U.S.-centric | Federated login; built-in audit trail | Top U.S. trust level, but limited international reach |

---

## 4. Findings
- **Veriff** provides the **best blend of legal assurance and developer simplicity.**  
  ISO 30107-3 L2 certification ensures biometric integrity, while the API flow (session → redirect → webhook) integrates with minimal code.  
- **Onfido** offers the **highest perceived legal weight** (used by banks and governments) but requires more configuration.  
- **Stripe Identity** is the **fastest to implement** but lacks a formal IAL2/ISO 30107 claim, reducing defensibility for contested cases.  
- **Trulioo** is ideal for enterprise/global expansion, not for an early-stage Laravel deployment.  
- **ID.me** remains unmatched for U.S. government-grade assurance but unavailable internationally.

---

## 5. Recommendation
Adopt a **single-provider strategy** using **Veriff** as the core identity-verification solution.

Veriff’s certification stack (ISO 30107-3 L2, SOC 2 Type II, ISO 27001) and robust audit trail make it **legally defensible** for the vast majority of user verifications.  
In the rare event of a legal dispute requiring government-level proof, manual or external verification can be performed separately.

This approach minimizes engineering effort while ensuring that verification results remain **evidentiary and defensible**.

---

## 6. Implementation Snapshot
- **Laravel Flow:** `create session → redirect to Veriff → webhook → log decision`  
- **Data Handling:** retain webhook payloads + hashed copies for 3 years; purge raw images after vendor SLA period.  
- **Audit Policy:** each verification logged with ID, timestamp, decision, and assurance level.  

---

## 7. Design Principle — Selective Automation
**“Automate what you can; manipulate what you can’t.”**

Routine verifications, logging, and retention should be fully automated for consistency and auditability.  
Exceptional cases (legal disputes, contested identities) are escalated for manual review or external verification, ensuring both efficiency and due process.

This hybrid approach keeps the system **efficient by default** and **trustworthy by exception**, balancing automation with human oversight.

---

## 8. Verification Policy Addendum
To strengthen compliance and evidentiary integrity, the following policies are recommended:

| Category | Policy |
|-----------|---------|
| **User Consent** | Users must explicitly agree to verification via a consent notice referencing Veriff as a third-party processor. |
| **Data Retention** | Store verification outcomes (status, assurance level, timestamps) for 3 years; purge raw image data after vendor retention expires. |
| **Integrity Protection** | Hash or digitally sign each verification record (user ID, session ID, timestamp) to ensure tamper-evident logging. |
| **Operational Reliability** | Support webhook retries and idempotent processing to prevent data loss. |
| **Administrator Oversight** | Provide admin dashboard visibility into verification status, timestamps, and escalation requests. |
| **Legal Readiness** | Maintain Veriff’s compliance certifications (SOC 2, ISO, PAD report) and internal retention policy for discovery or audits. |

---

## 9. Next Steps
1. Confirm client’s need for **international coverage** vs. U.S.-only operations.  
Client has already indicated desire to operate internationally.
2. Pilot Veriff integration in staging (≈ 1 day dev time).  
Gotcha.
3. Review export/audit documentation with counsel.  
Client is relative legal expert. Confirm with him.
4. Proceed to production deployment with full logging and retention policy.
After serious Q&A.