---
name: ui-skills-advisor
description: Decide which of the AI for UI skills (aiforui.dev, Emil Kowalski's emilkowalski/skills) fit the current project or request, install only those into the project, then offer to run them and apply their suggested improvements with the user's approval. Use when the user asks which UI, animation, or design-engineering skills to use, wants to "set up UI skills for this project", asks to polish, audit, or improve a project's UI or motion and has no such skills installed, or mentions aiforui.dev.
---

# UI Skills Advisor

Pick the right [AI for UI](https://aiforui.dev/skills) skills for a project, install them
**into that project only**, and then, with the user's consent, run them and apply what they
suggest.

The skills come from one repository, [`emilkowalski/skills`](https://github.com/emilkowalski/skills),
and are installed with the [Skills CLI](https://skills.sh). This skill never installs anything
globally and never changes code without the user approving it first.

## When to use

- "Which of the aiforui skills should I use here?" / "Set up UI skills for this project."
- "Make this app feel better / more polished", "audit the animations", "improve the motion"
  in a project that doesn't have these skills yet.
- Starting UI work in a new project and wanting the right guidance installed up front.

Do **not** use it to run one specific skill the user already named and has installed; just
use that skill.

## Workflow

Work through the phases in order. Stop and wait for the user at every **Ask** step.

### 1. Understand the project and the request

1. Find the project root: the nearest directory with `.git`, `package.json`,
   `Package.swift`, or `*.xcodeproj`. If there is none and the user gave no project, ask
   which project they mean.
2. Run the read-only scanner and read its output:

   ```bash
   bash <this-skill-dir>/scripts/scan-project.sh <project-root>
   ```

   It reports frameworks (web/React/Next/Expo/Swift), motion libraries, existing
   animation code, UI libraries (Sonner, Vaul, Radix, ...), mobile-web signals, and which
   AI for UI skills are already installed. It changes nothing.
3. Note what the user asked for, if anything specific ("fix the janky drawer",
   "make the dashboard feel premium"). A specific request outweighs project-wide signals.

### 2. Load the current catalog

Get the live list so new skills are not missed:

```bash
npx -y skills@latest add emilkowalski/skills --list
```

Use [references/catalog.md](references/catalog.md) for what each skill does, what kind of
skill it is (builder, read-only auditor, editor, reference), and the project signals that
make it relevant or irrelevant. If the live list has a skill the catalog doesn't cover,
judge it from its description and say so in the report. If the network is unavailable,
use the catalog alone and say the list may be stale.

### 3. Evaluate every skill

For each skill in the catalog, decide **Recommend**, **Optional**, or **Skip**, with one
line of evidence from step 1 (a dependency, a file, a pattern, or the user's request).
Rules:

- Recommend only with concrete evidence. "It's a UI project" is not enough for a niche
  skill.
- Platform-gated skills are Skip unless the platform is present: `animate-expo` needs
  Expo/React Native; `write-swift` needs Swift; `ask-sonner` needs Sonner (or the user
  wants toasts).
- Prefer fewer skills. Overlapping skills cost context in every session: pick the
  auditor that matches the goal (`improve-animations` for a whole-codebase plan,
  `review-animations` for reviewing specific changes, `find-animation-opportunities` for
  where motion is missing, `remove-animations` for too much motion) instead of all four
  by default.
- `ask-emil` is a router over the same skills; Skip it when this advisor already did the
  routing, unless the user wants it for later sessions.
- Skills already installed in the project: mark **Installed**, don't reinstall.

### 4. Present the plan — **Ask**

Show a short table, Recommend first:

| Skill | Verdict | Why (evidence) | Type |
|---|---|---|---|

Then ask the user which to install: the recommended set, a different selection, or none.
Mention that third-party skills run with the agent's full permissions and that the
installer shows a security assessment (Gen / Socket / Snyk) for each.

### 5. Install into the project

From the **project root**, install only the approved skills, project-scoped (no `-g`):

```bash
npx -y skills@latest add emilkowalski/skills --skill <skill-a> <skill-b> --yes
```

- Pass `--agent <agent>` only if the user wants specific agents; otherwise the CLI links
  the skills into every agent it detects.
- Show the installer's security assessment to the user. If any skill is rated high risk,
  stop and ask before keeping it.
- The CLI records the install in `skills-lock.json`. Tell the user to commit it (and the
  installed skill directories, if the team should share them) or to add them to
  `.gitignore`. Don't commit for them unless asked.
- Confirm what was installed with `npx -y skills@latest list`.

### 6. Offer to apply improvements — **Ask**

Ask whether to run the installed skills on the project now. If yes:

1. **Protect the work tree.** If `git status` is not clean, ask the user to commit or
   stash first, or confirm working on top. Create a branch, e.g.
   `ui-skills/<short-topic>`, so every change is reviewable and revertible.
2. **Run read-only skills first** (auditors such as `improve-animations`,
   `find-animation-opportunities`, `review-animations`, plus `break-ui` in its reporting
   step). Follow each skill's own `SKILL.md`. Collect their findings.
3. **Present one consolidated list** of proposed changes, grouped by file or area, each
   with: what changes, why (which skill and rule), and impact. Number them.
4. **Ask** which to apply: all, a selection by number, or none. Never apply without an
   explicit answer.
5. **Apply** the approved changes, following the relevant builder/editor skill
   (`animate`, `choreograph`, `gestures`, `remove-animations`, `mobile-native`, ...).
6. **Verify.** Run the project's own checks if they exist (typecheck, lint, tests,
   build). Report failures honestly and fix or revert the change that caused them.
7. **Summarize**: changes applied, changes skipped, checks run and their results, and the
   branch name. Don't push or open a PR unless asked.

## Rules

- Project scope only: never use `-g`/`--global` from this skill.
- Ask before installing, before applying, and before anything destructive.
- Don't invent catalog entries: base verdicts on the live list and the catalog.
- Keep recommendations evidence-based and short; the user should be able to decide in
  under a minute.
- If a recommended skill's guidance conflicts with the project's own conventions
  (`DESIGN.md`, existing design system, lint rules), the project's conventions win; say
  so in the findings.
