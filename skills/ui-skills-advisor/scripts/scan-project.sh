#!/usr/bin/env bash
# Read-only project scan for ui-skills-advisor.
# Prints the signals used to decide which AI for UI skills fit a project.
# It never writes, installs, or runs project code.
#
# Usage: scan-project.sh [project-root]   (default: current directory)
set -uo pipefail

root="${1:-.}"
cd "$root" 2>/dev/null || { echo "error: cannot open $root" >&2; exit 1; }
root=$(pwd)

# Search source files only, skipping dependencies and build output.
EXCLUDES=(--exclude-dir=node_modules --exclude-dir=.git --exclude-dir=dist --exclude-dir=build
  --exclude-dir=.next --exclude-dir=out --exclude-dir=coverage --exclude-dir=.turbo
  --exclude-dir=vendor --exclude-dir=Pods --exclude-dir=.expo --exclude-dir=.agents
  --exclude-dir=.claude)
SRC=(--include='*.ts' --include='*.tsx' --include='*.js' --include='*.jsx' --include='*.mjs'
  --include='*.vue' --include='*.svelte' --include='*.astro' --include='*.css' --include='*.scss'
  --include='*.html' --include='*.mdx')

count() { grep -rIlE "$1" "${EXCLUDES[@]}" "${SRC[@]}" . 2>/dev/null | wc -l | tr -d ' '; }
has_file() { find . -maxdepth 4 \( -path ./node_modules -o -path ./.git \) -prune -o -name "$1" -print 2>/dev/null | head -1; }

echo "# ui-skills-advisor scan: $root"
echo

echo "## Project"
[ -d .git ] && echo "- git: yes (branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null), clean: $([ -z "$(git status --porcelain 2>/dev/null)" ] && echo yes || echo no))" || echo "- git: no"
for f in package.json Package.swift app.json app.config.ts app.config.js DESIGN.md skills-lock.json; do
  [ -e "$f" ] && echo "- $f: present"
done
xc=$(has_file '*.xcodeproj'); [ -n "$xc" ] && echo "- Xcode project: $xc"
swift=$(find . -name '*.swift' -not -path './.build/*' -not -path './Pods/*' 2>/dev/null | wc -l | tr -d ' ')
[ "$swift" != 0 ] && echo "- Swift files: $swift"
echo

deps=""
if [ -f package.json ]; then
  # Dependencies from the root package.json and any workspace package.json (depth 3).
  deps=$(find . -maxdepth 3 -name package.json -not -path '*/node_modules/*' -print0 2>/dev/null |
    xargs -0 -r cat 2>/dev/null |
    grep -oE '"(@?[a-z0-9._/-]+)"[[:space:]]*:[[:space:]]*"[~^<>=*0-9a-z.:/ -]+"' |
    sed -E 's/^"([^"]+)".*/\1/' | sort -u)
fi
dep() { printf '%s\n' "$deps" | grep -qxE "$1"; }
list_deps() { local out=(); for d in "$@"; do dep "$d" && out+=("$d"); done; [ ${#out[@]} -gt 0 ] && echo "${out[*]}" || echo "none"; }

echo "## Frameworks"
echo "- web UI: $(list_deps react react-dom next vue nuxt svelte @sveltejs/kit astro solid-js @angular/core remix @remix-run/react react-router)"
echo "- React Native / Expo: $(list_deps expo react-native react-native-reanimated react-native-gesture-handler expo-router expo-haptics)"
echo "- styling: $(list_deps tailwindcss @tailwindcss/vite styled-components @emotion/react @vanilla-extract/css @stylexjs/stylex sass)"
echo

echo "## Motion"
echo "- motion libraries: $(list_deps motion framer-motion gsap @react-spring/web react-spring @formkit/auto-animate lottie-react @rive-app/react-canvas)"
echo "- files using motion/framer-motion: $(count "from ['\"](motion|framer-motion)(/react)?['\"]")"
echo "- files with CSS transitions/animations/keyframes: $(count '(transition[:-]|animation[:-]|@keyframes)')"
echo "- files with AnimatePresence or stagger: $(count '(AnimatePresence|stagger)')"
echo "- files animating layout properties (CSS transitions or motion props): $(count '(transition(-property)?:[^;]*(width|height|top|left|margin)|(animate|initial|exit|whileHover|whileTap)=\{\{[^}]*\b(width|height|top|left|margin)\b)')"
echo "- files using will-change: $(count 'will-change')"
echo

echo "## UI libraries"
echo "- toasts: $(list_deps sonner react-hot-toast react-toastify)"
echo "- drawers/gestures/drag: $(list_deps vaul @use-gesture/react @dnd-kit/core react-draggable react-beautiful-dnd @hello-pangea/dnd)"
echo "- primitives/design system: $(list_deps '@radix-ui/react-.*' radix-ui '@base-ui-components/react' '@base-ui/react' '@headlessui/react' '@ariakit/react' react-aria-components cmdk)"
ui_dir=$(find . -maxdepth 4 -type d \( -path ./node_modules -o -path ./.git \) -prune -o -type d \( -name ui -o -name components \) -print 2>/dev/null | head -3 | tr '\n' ' ')
echo "- component directories: ${ui_dir:-none}"
[ -n "$(has_file '.storybook')" ] && echo "- Storybook: present"
echo

echo "## Mobile web"
echo "- PWA manifest: $([ -n "$(has_file 'manifest.json')$(has_file 'manifest.webmanifest')$(has_file 'site.webmanifest')" ] && echo yes || echo no)"
echo "- viewport meta: $(count 'name=["'"'"']viewport')"
echo "- files using 100vh/100dvh: $(count '100d?vh')"
echo "- files with touch/pointer handlers: $(count '(onTouchStart|onPointerDown|touchstart|pointerdown)')"
echo

echo "## Skills already installed in this project"
found=0
for d in .agents/skills .claude/skills .cursor/skills .opencode/skills .codex/skills; do
  [ -d "$d" ] || continue
  for s in "$d"/*/; do
    [ -f "$s/SKILL.md" ] || continue
    echo "- $(basename "$s") ($d)"; found=1
  done
done
[ "$found" = 0 ] && echo "- none"
if [ -f skills-lock.json ] && grep -q 'emilkowalski/skills' skills-lock.json; then
  echo "- skills-lock.json references emilkowalski/skills"
fi
