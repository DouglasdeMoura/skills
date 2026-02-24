# Skills

Distributable skills for AI coding assistants (Amp, Claude Code, and others).

## Available skills

### HIPAA-compliant app development

Walks you through building software that handles PHI/ePHI. Helps you figure out whether you're a covered entity or business associate, implement the Security, Privacy, and Breach Notification Rules, and deal with adjacent regimes like the FTC Health Breach Notification Rule.

Included references:

- Regulatory baseline (current as of February 2026)
- Engineering control crosswalk mapping HIPAA safeguards to implementation tasks
- Release readiness checklist with evidence requirements

> This is implementation guidance, not legal advice. Route ambiguous interpretations to privacy/security counsel.

## Installation

``

```
npx skills add douglasdemoura/skills/hipaa-compliant-app-development
```

## Usage

The skill activates when your task involves healthcare data. You can also call it directly:

```
Use the hipaa-compliant-app-development skill to review this API for HIPAA compliance.
```

Example prompts:

- "I'm building a patient portal — walk me through the HIPAA controls I need."
- "Review this data flow diagram for PHI boundaries and missing safeguards."
- "Generate a release readiness checklist for our healthcare app."
- "What encryption and access control requirements apply to our ePHI storage?"
- "We're a business associate — what BAA and security obligations do we have?"

## License

MIT
