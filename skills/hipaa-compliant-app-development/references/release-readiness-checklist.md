# Release Readiness Checklist

Use this checklist before declaring a healthcare application release has met its
HIPAA control baseline.

## Scope and Legal Boundary

- [ ] Covered entity/business associate applicability memo approved.
- [ ] PHI/ePHI data-flow map approved and current.
- [ ] Non-HIPAA data paths reviewed for FTC HBNR exposure.
- [ ] Counsel sign-off recorded for novel data uses.

## Governance and Contracts

- [ ] BAAs in place for all PHI/ePHI vendors and subprocessors.
- [ ] Control owners assigned for all safeguard families.
- [ ] Policy set versioned (access, logging, incident, retention, disposal).
- [ ] Workforce onboarding/offboarding and recertification process active.

## Security Controls

- [ ] Risk analysis completed and remediation plan tracked.
- [ ] Least-privilege authorization model tested.
- [ ] MFA and session security verified.
- [ ] Audit logs cover PHI/ePHI access and admin actions.
- [ ] Log retention and tamper resistance verified.
- [ ] Encryption in transit and at rest validated; if not encrypting at rest,
      rationale and compensating controls documented.
- [ ] Backup and restore test passed in acceptable window.
- [ ] Policies and procedures documented, versioned, and retained per six-year
      requirement.
- [ ] Audit log review process operational (not just logs exist).
- [ ] Access provisioning/deprovisioning tested; break-glass procedure tested
      and logged.

## Privacy and User Rights

- [ ] Minimum-necessary logic tested for primary workflows.
- [ ] Access request workflow meets 30-day baseline SLA.
- [ ] Request/response templates are operational.
- [ ] De-identification or limited-data-set handling is documented where used.

## Incident and Breach Operations

- [ ] Incident severity matrix and escalation tree published.
- [ ] Breach risk assessment template approved.
- [ ] Notification deadline matrix approved and rehearsed.
- [ ] Tabletop run performed with action items closed or accepted.

## Evidence Bundle (Attach Before Go-Live)

- [ ] System architecture and data-flow diagrams.
- [ ] Control matrix linking requirements to implementation and owners.
- [ ] Test evidence for security/privacy controls.
- [ ] Vendor register with BAA status.
- [ ] Incident response and breach notification runbook.
- [ ] Compliance review notes with date and approvers.
