# AI for UI skill catalog

Selection guide for the skills in [`emilkowalski/skills`](https://github.com/emilkowalski/skills),
published at [aiforui.dev/skills](https://aiforui.dev/skills). Install any of them with:

```bash
npx -y skills@latest add emilkowalski/skills --skill <id> --yes
```

The live list (`npx -y skills@latest add emilkowalski/skills --list`) is authoritative.
This file adds what the list doesn't say: the **type** of each skill and the **project
signals** that make it worth installing. Last reviewed against the repository in
November 2026 (20 skills).

## Skill types

| Type | Meaning | Changes code? |
|---|---|---|
| Builder | Implements something new following its rules | Yes |
| Editor | Changes existing code (e.g. removes or fixes) | Yes |
| Auditor | Reads code and reports or plans | No |
| Reference | Knowledge to consult while working | No |
| Router | Points to other skills | No |

## Skills

### animate
- **Type:** Builder. **Platform:** web.
- Builds an animation from scratch, deciding in order: whether to animate, why, which
  tool, which properties, curve and duration, interruption, exit.
- **Recommend when:** a web UI with interactive components (React/Vue/Svelte/plain CSS),
  a motion library (`motion`, `framer-motion`, `gsap`, `@react-spring/*`) or CSS
  transitions/keyframes, or the user wants to add motion.
- **Skip when:** no web UI (CLI, backend, library without UI), or React Native only
  (use `animate-expo`).

### animate-expo
- **Type:** Builder. **Platform:** React Native / Expo.
- Animations with Reanimated, Gesture Handler, Expo Router and expo-haptics.
- **Recommend when:** `expo`, `react-native`, `react-native-reanimated` or
  `react-native-gesture-handler` is a dependency.
- **Skip when:** no React Native.

### animation-performance
- **Type:** Reference + diagnosis. **Platform:** web.
- Keeps animations in the frame budget: composite-only properties, off-main-thread
  motion, finding the cause of dropped frames, `will-change` and layers.
- **Recommend when:** the project has notable animation code, the user reports jank or
  stutter, or code animates layout properties (`width`, `height`, `top`, `left`,
  `margin`) or uses `will-change` heavily.
- **Optional when:** animation-heavy marketing or landing pages.
- **Skip when:** little or no motion.

### animation-vocabulary
- **Type:** Reference.
- Reverse glossary: turns a vague description of a motion effect into its proper name.
- **Recommend when:** rarely as a project install; useful when the user often describes
  effects loosely and wants precise terms for prompting or design handoff.
- **Default:** Optional or Skip.

### apple-design
- **Type:** Reference (philosophy). **Platform:** web.
- Apple's approach to fluid, physical interfaces for the web: springs, gestures, sheets,
  momentum, materials and depth, typography, reduced motion.
- **Recommend when:** gesture-driven or mobile-first UI, sheets/drawers, spring
  animations, or the user explicitly wants an Apple-like feel.
- **Skip when:** dense data or admin UI with little motion, unless the user asks.

### ask-emil
- **Type:** Router.
- Picks which skill or flow fits a situation among these skills.
- **Default:** Skip when this advisor is doing the routing. Optional if the user wants a
  router available in later sessions.

### ask-sonner
- **Type:** Reference. **Platform:** React.
- Guide to the Sonner toast library: setup, toast types, promise toasts, styling,
  theming, positioning, common bugs (toasts not showing, duplicated, behind modals).
- **Recommend when:** `sonner` is a dependency, or the user wants to add toasts to a React app.
- **Skip when:** no Sonner and no toast need.

### break-ui
- **Type:** Auditor + small builder (adds a demo/worst-case data toggle). **Platform:** web.
- Stress-tests UI with worst-case data (long names, unbreakable strings, empty states,
  huge counts, non-Latin text, emoji) and reports what breaks, with fixes.
- **Recommend when:** components render user-generated or variable data: lists, tables,
  cards, profiles, dashboards.
- **Skip when:** static content site or no rendered UI.

### choreograph
- **Type:** Builder. **Platform:** web.
- Coordinates several elements that animate together: staggers, hero entrances, view
  swaps, multi-step flows, shared transitions.
- **Recommend when:** staggered lists, `AnimatePresence`, page or section entrances,
  multi-step flows, or the user's motion "feels mechanical" or "too much going on".
- **Skip when:** little motion, or only single-element transitions.

### emil-design-eng
- **Type:** Reference (philosophy) + review guidance. **Platform:** web.
- Design-engineering polish: press and hover states, popover origins, tooltip timing,
  transitions vs keyframes, `clip-path` techniques, drag details.
- **Recommend when:** building or polishing custom interactive components or a design
  system (`components/ui`, Radix/Base UI/shadcn primitives, Storybook).
- **Optional when:** any product UI the user wants to feel more polished.

### find-animation-opportunities
- **Type:** Auditor (read-only). **Platform:** web.
- Finds places that should animate but don't, with exact values, and rejects places that
  shouldn't.
- **Recommend when:** a UI with little motion and the user wants it to "feel more alive".
- **Skip when:** already motion-heavy (prefer `improve-animations` or `remove-animations`).

### gestures
- **Type:** Builder. **Platform:** web.
- Drag, swipe, sheets, fling, hold, pull-to-refresh that track the finger 1:1 and stay
  interruptible.
- **Recommend when:** `vaul`, `@use-gesture/react`, `@dnd-kit/*`, `react-draggable`,
  drag props in `motion`, sheets or drawers, swipe-to-dismiss, or touch-first web UI.
- **Skip when:** no gesture interactions.

### improve-animations
- **Type:** Auditor (read-only planner).
- Surveys all motion code and produces a prioritized audit plus self-contained
  implementation plans other agents can execute.
- **Recommend when:** substantial existing animation code and the goal is a
  project-wide improvement.
- **Skip when:** little motion (prefer `find-animation-opportunities`).

### learn-taste
- **Type:** Builder (of rules).
- Turns a session's design corrections into written rules (with their reasons) in
  `DESIGN.md`, a project skill, or a lint check.
- **Recommend when:** ongoing design iteration in the project, a `DESIGN.md` exists, or
  the user keeps correcting the same design choices.
- **Optional otherwise.**

### mobile-native
- **Type:** Editor (CSS and meta fixes). **Platform:** web.
- Makes a web app feel native on phones: sticky hover, tap highlight, `100vh`, input
  zoom, laggy taps, pull-to-refresh, safe areas, long-press selection, status bar color.
- **Recommend when:** a web app meant to be used on phones: PWA manifest,
  `viewport` meta, responsive layout, `100vh` usage, bottom sheets, touch handlers.
- **Skip when:** desktop-only tools or no web UI.

### pick-ui-library
- **Type:** Reference (chooser). **Platform:** web.
- Picks a library for a frontend task from a curated list: primitives, toasts, drawers,
  command menus, OTP, numbers, charts, virtualization, drag and drop, state, styling.
- **Recommend when:** a new or young frontend project, or the user is about to add UI
  dependencies.
- **Skip when:** a mature project with an established stack, unless the user is choosing
  a new library.

### prototype
- **Type:** Builder.
- Builds several genuinely different versions of a UI piece behind a live picker so the
  user can compare and promote one.
- **Recommend when:** the user is designing something new and wants options.
- **Optional otherwise.**

### remove-animations
- **Type:** Editor (only subtracts).
- Removes motion the interface doesn't need (keyboard actions, high-frequency surfaces,
  functional data, purposeless decoration) and cleans up after.
- **Recommend when:** heavy motion, or the user says the app "feels slow" or
  "over-animated".
- **Skip when:** little motion.

### review-animations
- **Type:** Auditor (read-only reviewer).
- Reviews animation and motion code against a high craft bar; flags by default.
- **Recommend when:** animation code is being added or changed (reviewing PRs or
  diffs), or as a quality gate in motion-heavy projects.
- **Skip when:** little motion.

### write-swift
- **Type:** Reference. **Platform:** Swift. (In the repository, not listed on aiforui.dev.)
- Modern Swift: value types, Swift 6 concurrency, protocols and generics, API design,
  performance.
- **Recommend when:** `Package.swift`, `*.xcodeproj`, or `.swift` files are present.
- **Skip when:** no Swift.
