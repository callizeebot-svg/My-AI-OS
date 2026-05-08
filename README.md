# My-AI-OS — Cally's Personal AI Workspace

This is my personal AI operating system — the single place that knows everything about me, what I'm working on, and what needs to happen next.

**Every tool I use reads from this repo.** Claude Code, Betty, any AI agent — they all load this context first.

## What's In Here

```
My-AI-OS/
├── CLAUDE.md              ← START HERE — loads everything into Claude
├── context/               ← THE BRAIN — everything about me
│   ├── who-i-am.md        — identity, role, values
│   ├── current-work.md    — active projects RIGHT NOW
│   ├── goals.md           — short and long-term goals
│   ├── preferences.md     — how Betty should behave
│   ├── projects/          — per-project detail files
│   │   ├── betty-brain-os.md
│   │   ├── ai-os.md
│   │   └── income.md
│   ├── work/              — professional context (Liverpool Hospital)
│   ├── people/            — key people to know about
│   └── log/               — running activity log (update regularly)
├── apps/                  — agent-native app configs
├── scripts/
│   └── sync-upstream.sh   — pull updates from AI-OS framework
└── .github/workflows/
    └── sync-upstream.yml  — weekly check for AI-OS updates (creates issue if found)
```

## Setup — Connect This to Claude Code

### 1. Clone locally to a permanent location

```bash
git clone https://github.com/callizeebot-svg/My-AI-OS.git C:\Users\calli\My-AI-OS
```

### 2. Tell Claude Code to always read it

Add to your global Claude Code settings (`~/.claude/CLAUDE.md`):

```markdown
## Always Load

Before starting any task, read the context from my personal workspace:
C:\Users\calli\My-AI-OS\CLAUDE.md

This tells you who I am, what I'm working on, and how I like to work.
```

Or add it as a memory in Claude Code:
```bash
# In any Claude Code session
/memory add "Always read C:\Users\calli\My-AI-OS\CLAUDE.md at session start"
```

### 3. Keep context updated

The `context/` files are only as useful as they are current. Update:
- `context/current-work.md` — whenever projects shift
- `context/log/YYYY-MM.md` — regularly as a running log
- Project files — when status changes

## Relationship to Other Repos

| Repo | Role | Should I modify? |
|------|------|-----------------|
| [My-AI-OS](https://github.com/callizeebot-svg/My-AI-OS) | This — personal workspace | Yes, constantly |
| [Betty-brain-os](https://github.com/callizeebot-svg/Betty-brain-os) | Betty's core OS | Yes |
| [AI-OS](https://github.com/callizeebot-svg/AI-OS) | App framework mirror | No — upstream only |

## Keeping AI-OS Updated

AI-OS mirrors [BuilderIO/agent-native](https://github.com/BuilderIO/agent-native). When they release updates:

```bash
./scripts/sync-upstream.sh
```

A GitHub Action also runs weekly and creates an issue if new commits are available.

---

*Built by Cally + Betty · May 2026*
