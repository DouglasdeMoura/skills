# Skills

Distributable [agent skills](https://skills.sh) for AI coding assistants: Claude Code, Codex,
Cursor, OpenCode, Amp, Crush, Grok, and others that read `SKILL.md` skills.

| Skill | What it does |
|---|---|
| [`ui-skills-advisor`](#ui-skills-advisor) | Picks the right [AI for UI](https://aiforui.dev/skills) skills for a project, installs them into that project, and offers to apply their suggestions. |
| [`hipaa-compliant-app-development`](#hipaa-compliant-app-development) | Guides building software that handles PHI/ePHI under HIPAA. |

## Installation

Install with the [Skills CLI](https://skills.sh). Run it from a project to install for that
project, or add `--global` to install for your user:

```bash
# One skill
npx skills add DouglasdeMoura/skills --skill ui-skills-advisor

# All skills in this repository
npx skills add DouglasdeMoura/skills --skill '*'

# For your user instead of the current project
npx skills add DouglasdeMoura/skills --skill ui-skills-advisor --global
```

The CLI detects which agents you use and links the skill into each of them. Use
`--agent <name>` to pick specific agents, and `npx skills --help` for everything else.

---

## ui-skills-advisor

A meta skill for [AI for UI](https://aiforui.dev/skills), Emil Kowalski's collection of UI,
animation, and design-engineering skills ([`emilkowalski/skills`](https://github.com/emilkowalski/skills)).
There are 20 of them, and most projects need only a few. This skill works out which.

**What it does:**

1. **Scans the project** with a read-only script: frameworks (web, React Native/Expo,
   Swift), motion libraries and existing animation code, UI libraries (Sonner, Vaul,
   Radix, ...), mobile-web signals, and skills already installed.
2. **Reads the live catalog** from `emilkowalski/skills`, so new skills are considered too.
3. **Rates every skill** as *Recommend*, *Optional*, or *Skip*, each with the evidence
   from your project or request, preferring a small set over overlapping ones.
4. **Asks you** which to install, then installs them **into the project only**
   (never globally), showing the installer's security assessment.
5. **Offers to apply improvements**: runs the read-only auditors first, shows one
   numbered list of proposed changes, applies only what you approve on a new branch,
   and runs the project's own checks (typecheck, lint, tests, build) afterwards.

Nothing is installed or changed without your confirmation, and nothing is pushed.

**Example prompts:**

- "Which aiforui skills should this project use?"
- "Set up UI skills for this repo and suggest improvements."
- "Make this app feel more polished." (in a project without these skills yet)
- "I'm about to add drawers and toasts to this Next.js app; install what helps."

**Files:**

| Path | Purpose |
|---|---|
| `SKILL.md` | The workflow the agent follows (scan → catalog → evaluate → ask → install → ask → apply → verify). |
| `references/catalog.md` | Each AI for UI skill's type (builder, editor, auditor, reference, router) and the project signals for and against installing it. |
| `scripts/scan-project.sh` | Read-only project scan used in step 1. Needs only `bash`, `grep`, and `find`. |
| `agents/openai.yaml` | Display name and description for Codex. |

You can run the scanner on its own:

```bash
bash skills/ui-skills-advisor/scripts/scan-project.sh /path/to/project
```

**Requirements:** Node.js (for `npx skills`), git, network access to GitHub.

---

## hipaa-compliant-app-development

Walks you through building software that handles PHI/ePHI. Helps you figure out whether
you're a covered entity or business associate, implement the Security, Privacy, and Breach
Notification Rules, and deal with adjacent regimes like the FTC Health Breach Notification
Rule.

Included references:

- Regulatory baseline (current as of February 2026)
- Engineering control crosswalk mapping HIPAA safeguards to implementation tasks
- Release readiness checklist with evidence requirements

> This is implementation guidance, not legal advice. Route ambiguous interpretations to
> privacy/security counsel.

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

---

## Repository layout

```
skills/
  <skill-name>/
    SKILL.md            # required: frontmatter (name, description) + instructions
    references/         # optional: material the agent reads on demand
    scripts/            # optional: helper scripts the skill runs
    agents/openai.yaml  # optional: Codex display metadata
```

## Writing a new skill

1. Create `skills/<name>/SKILL.md` with frontmatter:

   ```yaml
   ---
   name: <name>            # lowercase, hyphenated, same as the directory
   description: <what it does and when to use it — agents decide from this line>
   ---
   ```

2. Keep `SKILL.md` focused on the workflow; move long material into `references/`.
3. Make scripts read-only unless the skill's purpose is to change things, and say so.
4. Ask before anything that installs, edits, or deletes.
5. Add the skill to the table and a section in this README.
6. Check it installs: `npx skills add . --list` from the repository root.

## License

[MIT](LICENSE)
