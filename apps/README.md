# Apps

This folder contains My-AI-OS app configurations — the actual agent-native apps that power Betty's capabilities.

## Source

All apps are built on the agent-native framework from [AI-OS](https://github.com/callizeebot-svg/AI-OS).

## Setup

```bash
# From the repo root, install dependencies
pnpm install

# Run a specific app
pnpm --filter dispatch dev

# Run all apps
pnpm dev
```

## App Stack

| App | Template | Mount | Status |
|-----|----------|-------|--------|
| Dispatch | `dispatch` | `/dispatch` | Planned |
| Mail | `mail` | `/mail` | Planned |
| Calendar | `calendar` | `/calendar` | Planned |
| Content | `content` | `/content` | Planned |
| Voice | `voice` | `/voice` | Planned |
| Forms | `forms` | `/forms` | Planned |

## Adding a New App

```bash
# From AI-OS repo root, then copy the generated app here
npx @agent-native/core create <app-name> --template=<template>
```
