---
name: hipaa-compliant-app-development
description: Use when designing, building, reviewing, or operating software that creates, receives, maintains, or transmits HIPAA-regulated PHI/ePHI, including scope determination (covered entity vs business associate), Security/Privacy/Breach Rule implementation, and adjacent healthcare privacy regimes.
---

# HIPAA-Compliant App Development

## Overview

Build HIPAA-aligned applications by turning legal requirements into concrete
engineering controls, operational runbooks, and release evidence. Treat this
skill as implementation guidance, not legal advice.

Read only the reference file you need:

- `references/regulatory-baseline-2026-02.md`: current legal/regulatory baseline
  and date-sensitive changes
- `references/engineering-control-crosswalk.md`: how to implement safeguards in
  architecture, code, and operations
- `references/release-readiness-checklist.md`: practical go-live checklist and
  evidence package

## Workflow

1. Confirm scope before writing controls

- Determine whether the organization is a covered entity, business associate,
  subcontractor, or outside HIPAA.
- If outside HIPAA but handling consumer health data, check FTC Health Breach
  Notification Rule obligations.
- Output: one-page applicability memo with assumptions and legal owner.

2. Map PHI/ePHI and data boundaries

- Build data-flow diagrams for collection, APIs, queues, storage, analytics,
  backups, and support tooling.
- Mark each data element as PHI, de-identified data, or limited data set.
- Output: system data map with trust boundaries and third-party processors.

3. Implement safeguards as engineering requirements

- Administrative safeguards: risk analysis, risk management plan,
  workforce/process controls, incident procedures.
- Physical safeguards: facility/device/media handling controls appropriate to
  deployment model.
- Technical safeguards: unique user identity, access control, audit logging,
  integrity controls, and transmission security.
- Output: control matrix linking each safeguard to code, infra config, runbook,
  and owner.

4. Build Privacy Rule behavior into product features

- Enforce minimum necessary access by role and workflow.
- Implement request handling for access, amendments, restrictions, confidential
  communications, and accounting where applicable.
- Ensure notice/policy touchpoints are represented in product and support flows.
- Output: privacy behavior spec and test cases for user-rights workflows.

5. Prepare incident and breach operations

- Define security incident triage and breach-risk assessment workflow.
- Pre-author notification paths and deadlines for individual notice, HHS notice,
  and media notice (when triggered).
- Output: incident response and breach notification runbook with escalation
  contacts.

6. Gate releases on evidence, not intent

- Require objective evidence before go-live: controls implemented, tested,
  monitored, and documented.
- Run tabletop exercises for incident response and downtime/recovery.
- Output: release evidence bundle signed by engineering, security, and
  compliance owners.

7. Keep compliance current

- Track OCR rulemaking, major enforcement themes, and adjacent federal/state
  privacy rules.
- Re-run risk analysis after architecture changes, vendor changes, incidents, or
  major feature launches.
- Output: recurring compliance review cadence and change log.

## Guardrails

- Do not claim legal compliance or legal sufficiency. Route ambiguous
  interpretations to privacy/security counsel.
- Do not treat addressable safeguards as optional; document rationale and
  compensating controls when tailoring implementation.
- Do not ship if evidence is missing for high-risk controls (access control,
  logging, encryption, backups, incident response).

## Expected Deliverables

- Applicability memo
- PHI/ePHI system data map
- HIPAA control matrix with control owners
- Privacy feature test plan
- Incident and breach runbook
- Release evidence bundle
