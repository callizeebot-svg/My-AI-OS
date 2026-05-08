# Project: Betty Brain OS

- **Repo**: `https://github.com/callizeebot-svg/Betty-brain-os`
- **Local path**: `C:\Users\calli\Repos\Betty-brain-os`
- **Status**: Active — core functionality working

## What's Built

- **Voice interface** — Cartesia TTS + named voice picker; round-table layout for multi-voice
- **Web shell** — browser-based terminal inside the dashboard
- **Bot system** — Telegram bots with hot-reload allow-list; persisted session transcripts
- **Sessions panel** — view and review past conversations
- **Memory system** — file-based memory at `.claude/projects/.../memory/`

## Tech Stack

- Python (primary backend)
- Telegram Bot API
- Cartesia TTS API
- Whisper STT
- Claude API (Anthropic)
- Web dashboard (frontend)

## Recent Commits (as of 2026-05-08)

- `bf6ce22` — hot-reload allow-list + persisted session transcripts + Sessions panel
- `81930b5` — allow startup with empty allow-list for chat-id discovery
- `21d249b` — bootstrap .env into os.environ on package import
- `633720f` — web shell in dashboard; fix Cartesia model + harden voice picker
- `2f333f9` — named voice picker, round-table layout, fix stale-cfg bug

## What's Next

- Integrate My-AI-OS as always-loaded context source
- Connect to agent-native Dispatch app as external mission control
- Build out income-generating features on top of Betty stack

## Known Issues / Decisions

- Voice model selection: Cartesia preferred; keep model ID in config not hardcoded
- Bot allow-list: persisted in file, hot-reloaded — no restart needed
