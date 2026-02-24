# HIPAA Regulatory Baseline (as of February 23, 2026)

This file captures current federal baseline requirements for software teams
building systems that handle healthcare data. It is implementation-oriented and
should be reviewed with counsel for final legal interpretation.

## 1) Core HIPAA Rules to Implement

1. Security Rule

- 45 CFR Part 160 and Subparts A and C of Part 164.
- Applies to electronic protected health information (ePHI).
- Safeguard families: administrative, physical, technical.

2. Privacy Rule

- 45 CFR Part 160 and Subparts A and E of Part 164.
- Governs permitted uses/disclosures and individual rights.
- Includes minimum necessary standard.

3. Breach Notification Rule

- 45 CFR 164.400-414.
- Requires breach notification to affected individuals, HHS, and in some cases
  media.

## 2) Date-Sensitive Federal Updates You Must Track

1. HIPAA Security Rule update is still proposed, not final

- OCR published an NPRM to modify the Security Rule on December 27, 2024.
- On January 20, 2025, the Trump administration issued a "Regulatory Freeze
  Pending Review" executive order, creating significant uncertainty about
  whether the NPRM will advance, be revised, or be withdrawn. Industry groups
  have petitioned for rescission.
- OCR states the current Security Rule remains in effect until a final rule is
  published.
- Skill implication: implement current law now; prepare architecture so stricter
  controls can be adopted quickly, but do not assume the proposed rule will take
  effect as written.

2. 42 CFR Part 2 final rule is in effect with active enforcement

- Final rule was published February 16, 2024.
- Compliance date: February 16, 2026.
- OCR announced its civil enforcement program on February 13, 2026, with
  enforcement beginning February 16, 2026.
- Skill implication: systems handling SUD treatment records from Part 2 programs
  need consent, redisclosure, and segmentation behavior aligned to updated Part
  2/HIPAA harmonization. Part 2 applies to Part 2 programs and lawful holders,
  not all SUD data.

3. Reproductive health Privacy Rule final rule vacated nationally with surviving
   NPP provisions

- On June 18, 2025, the U.S. District Court for the Northern District of Texas
  declared unlawful and vacated most of the HIPAA Privacy Rule to Support
  Reproductive Health Care Privacy.
- The court left intact certain NPP modifications at 45 CFR 164.520 (vacating
  only 164.520(b)(1)(ii)(F), (G), and (H)).
- Compliance with the surviving NPP modifications is required by February
  16, 2026.
- Skill implication: avoid hard-coding vacated assumptions; route reproductive
  health data scenarios to counsel and keep policy text/versioning explicit.

## 3) High-Impact Implementation Requirements

1. Business associate scope includes cloud hosting scenarios

- OCR guidance describes when cloud service providers are business associates
  and need BAAs.

2. Individual right of access timing

- Covered entities generally must provide requested PHI access no later than 30
  days after request (with one possible 30-day extension when conditions are
  met).

3. Minimum necessary standard

- Limit use/disclosure/request of PHI to minimum necessary for the purpose, with
  defined exceptions (for example treatment and disclosures required by law).

4. De-identification paths

- OCR recognizes two methods: expert determination or safe harbor.

5. Breach notification deadlines

- Without unreasonable delay and not later than 60 calendar days for affected
  individuals after discovery of a breach.
- HHS reporting timing varies based on size threshold (500+ vs <500
  individuals).

6. Risk analysis remains an enforcement priority

- OCR continues targeted enforcement around Security Rule risk analysis/risk
  management failures.

## 4) Adjacent Rule for Non-HIPAA Health Apps

If an app is not a HIPAA covered entity/business associate but handles
identifiable health information, evaluate FTC Health Breach Notification Rule
requirements.

- FTC’s 2024 final rule broadens scope and clarifies covered digital health
  entities.
- Effective date: July 29, 2024.

## 5) Sources (Primary)

- HHS OCR HIPAA Security Rule summary and safeguard structure:
  https://www.hhs.gov/hipaa/for-professionals/security/laws-regulations/index.html

- HHS OCR Security Rule NPRM status page (current rule remains in effect):
  https://www.hhs.gov/hipaa/for-professionals/security/hipaa-security-rule-nprm/index.html

- HHS OCR 42 CFR Part 2 final rule page:
  https://www.hhs.gov/hipaa/for-professionals/regulatory-initiatives/fact-sheet-42-cfr-part-2-final-rule/index.html

- HHS OCR Part 2 civil enforcement program announcement (February 13, 2026):
  https://www.hhs.gov/press-room/hhs-announce-civil-enforcement-program-sud-patient-records.html

- HHS OCR HIPAA and reproductive health information page (includes litigation
  status and NPP compliance):
  https://www.hhs.gov/hipaa/for-professionals/special-topics/reproductive-health/index.html

- HHS OCR cloud computing guidance (business associate treatment):
  https://www.hhs.gov/hipaa/for-professionals/special-topics/health-information-technology/cloud-computing/index.html

- HHS OCR right-of-access guidance and timing:
  https://www.hhs.gov/hipaa/for-professionals/privacy/guidance/access/index.html

- HHS OCR minimum necessary guidance:
  https://www.hhs.gov/hipaa/for-professionals/privacy/guidance/minimum-necessary-requirement/index.html

- HHS OCR de-identification guidance:
  https://www.hhs.gov/hipaa/for-professionals/privacy/special-topics/de-identification/index.html

- HHS OCR breach notification guidance:
  https://www.hhs.gov/hipaa/for-professionals/breach-notification/index.html

- HHS OCR risk analysis initiative settlement example (February 19, 2026):
  https://www.hhs.gov/press-room/ocr-settles-hipaa-security-rule-investigation-twrtc.html

- FTC Health Breach Notification Rule (includes 2024 amendments):
  https://www.ftc.gov/legal-library/browse/rules/health-breach-notification-rule
