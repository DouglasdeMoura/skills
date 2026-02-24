# Engineering Control Crosswalk

Use this as a build-time map from HIPAA obligations to implementation tasks and
release evidence.

## 1) Administrative Safeguards (Build + Operate)

| Objective                               | Engineering Implementation                                                                                      | Evidence                                                       |
| --------------------------------------- | --------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| Risk analysis                           | Maintain asset inventory, data-flow diagrams, threat model, and risk register for each PHI/ePHI boundary.       | Versioned risk register, review logs, architecture diagrams.   |
| Risk management                         | Prioritize and track remediation with deadlines and owners.                                                     | Ticket backlog, SLA dashboard, closure proof.                  |
| Assigned responsibility                 | Name security/compliance owner for each system and control family.                                              | RACI matrix, on-call roster, escalation map.                   |
| Workforce security                      | Role-based onboarding/offboarding, periodic access recertification.                                             | IAM export, recertification records, termination checklist.    |
| Security awareness/training             | Deliver recurring training and phishing/social engineering drills.                                              | Training completion logs, campaign reports.                    |
| Sanction policy                         | Enforce documented sanctions for workforce members who violate security policies.                               | Sanction policy, enforcement records.                          |
| Incident procedures                     | Maintain incident triage and response playbooks for confidentiality/integrity/availability events.              | Runbooks, tabletop output, post-incident reviews.              |
| Contingency plan                        | Backup, disaster recovery, emergency mode operations, and restore testing.                                      | Backup success metrics, restore test results, RTO/RPO records. |
| Periodic evaluation                     | Conduct technical and non-technical assessments of security posture after environmental or operational changes. | Assessment reports, post-change review records.                |
| Policies, procedures, and documentation | Maintain written policies and procedures; retain documentation for at least six years.                          | Versioned policy repository, retention confirmation.           |

## 2) Physical Safeguards (Cloud + Endpoint Reality)

| Objective                | Engineering Implementation                                                                | Evidence                                            |
| ------------------------ | ----------------------------------------------------------------------------------------- | --------------------------------------------------- |
| Facility access controls | Use cloud provider controls and organization access policies for production environments. | CSP certifications, admin access logs, policy docs. |
| Workstation use/security | Enforce managed endpoints, disk encryption, screen lock, and MDM controls.                | MDM compliance reports, endpoint policy configs.    |
| Device/media controls    | Encrypt mobile and removable media; define disposal and reuse workflows.                  | Asset disposal logs, encryption attestations.       |

## 3) Technical Safeguards (Code + Infra)

| Objective             | Engineering Implementation                                                                                                           | Evidence                                                                                                  |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------- |
| Access control        | Unique user IDs, least privilege RBAC/ABAC, MFA, session controls, emergency-access procedures.                                      | IAM policy snapshots, auth test results, access review logs.                                              |
| Audit controls        | Tamper-evident, time-synced logs for auth, PHI reads/writes, admin actions, exports, and policy changes; routine log review process. | SIEM dashboards, log retention policy, tamper-detection alerts, log review schedule and sample artifacts. |
| Integrity             | Data integrity checks, write constraints, signed artifacts, and anti-tamper controls.                                                | Checksums/signatures, database constraints, CI attestations.                                              |
| Authentication        | Person/entity authentication and credential lifecycle controls.                                                                      | Auth architecture docs, penetration test findings and fixes.                                              |
| Transmission security | Encrypt data in transit (TLS 1.2+), secure service-to-service traffic, key/cert rotation.                                            | TLS config scans, cert rotation records, network policy manifests.                                        |

## 4) Privacy Rule Features in Product Design

| Objective                                    | Engineering Implementation                                                                                           | Evidence                                                |
| -------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------- |
| Minimum necessary                            | Policy-driven field filtering, scoped APIs, and context-aware data presentation.                                     | Authorization tests, API contract tests, approval logs. |
| Permitted use/disclosure controls            | Enforce purpose-based access paths and approvals for non-routine use.                                                | Workflow configs, approval audit trails.                |
| Right of access workflows                    | Request intake, identity verification, 30-day SLA timer, export tooling, tracking.                                   | SLA metrics, sample request audit trail, QA test cases. |
| Amendment requests                           | Intake, decisioning, record linkage, response deadlines, and denial logging where applicable.                        | Amendment workflow configs, response logs.              |
| Restrictions and confidential communications | Support restriction requests (including self-pay restriction on health plan disclosure) and alternate contact flags. | Restriction/flag configuration, test cases.             |
| Accounting/audit visibility                  | Track disclosures and support report generation where required.                                                      | Disclosure ledger design and report outputs.            |

## 5) Breach/Incident Readiness

| Objective              | Engineering Implementation                                                                           | Evidence                                                     |
| ---------------------- | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| Discovery and triage   | Alerting pipeline with severity model and incident commander assignment.                             | Alert rules, incident timelines, paging records.             |
| Breach risk assessment | Structured decision tree capturing PHI type, recipient, mitigation, and likely harm.                 | Assessment template and completed examples.                  |
| Notification readiness | Pre-approved templates and decision matrix for individual/HHS/media notice thresholds and deadlines. | Template versions, legal/compliance sign-off, drill results. |

## 6) Vendor and BAA Controls

| Objective        | Engineering Implementation                                                                        | Evidence                                                         |
| ---------------- | ------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| BAA coverage     | Keep machine-readable inventory of all vendors/subprocessors that handle PHI/ePHI and BAA status. | Vendor register with signed BAA links and renewal dates.         |
| Third-party risk | Perform intake reviews and periodic reassessments for critical vendors.                           | Security review artifacts, exception records, remediation plans. |

## 7) CI/CD Compliance Gates

Implement release gates that block production deploys when high-risk controls
are missing:

1. Access control tests fail.
2. Audit logs are absent or incomplete.
3. Encryption requirements are unmet.
4. Backup/restore tests are stale.
5. Incident runbook owners are unassigned.

Treat controls as testable software requirements rather than policy-only
statements.
