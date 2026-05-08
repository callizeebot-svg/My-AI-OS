# Current Work — What's Happening Now

> Last updated: 2026-05-08. Update this file whenever projects shift.

## Active Projects

### 1. Betty Brain OS (Primary)
- **Repo**: [Betty-brain-os](https://github.com/callizeebot-svg/Betty-brain-os)  
- **Status**: Active development
- **What's built**: Voice interface (Cartesia TTS), web shell in dashboard, bot system with hot-reload allow-list, session transcripts panel, named voice picker, Telegram bot integration
- **Next**: Integrating My-AI-OS as the shared context layer; building out agent-native app stack

### 2. My-AI-OS Setup (This repo)
- **Repo**: [My-AI-OS](https://github.com/callizeebot-svg/My-AI-OS)
- **Status**: Just created (2026-05-08)
- **Goal**: Persistent shared context that Claude and Betty always read from
- **Next**: Clone locally, wire into Claude Code global settings, keep context files updated

### 3. AI-OS (Upstream Mirror)
- **Repo**: [AI-OS](https://github.com/callizeebot-svg/AI-OS)
- **Status**: Mirror of BuilderIO/agent-native — do not modify directly
- **Purpose**: Framework source for app templates

### 4. Income Generation
- **Goal**: $10k/month within 6 months → path to $1M/year
- **Approach**: Multi-stream online business using AI tools
- **Status**: Early stage — Betty OS is the foundation for the tooling

## Open Questions / Decisions Needed

- Which agent-native apps to deploy first (Dispatch is the likely starting point)
- Where to host (Cloudflare Workers vs Vercel vs self-hosted)
- Database: SQLite local dev → Turso for production

## What Claude Should Know About Right Now

When I open a project and ask for help, assume:
1. I'm working across Betty-brain-os, My-AI-OS, and AI-OS simultaneously
2. Betty-brain-os is the main product; My-AI-OS is the context layer
3. I'm learning as I go — explain when something is non-obvious, but don't over-explain
4. Income/business goals are always in the background — prefer solutions that scale
