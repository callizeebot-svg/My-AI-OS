# How to Apply AI-OS Updates

> No update ever gets applied automatically. This is the required process every time.

## Step 1 — Get the Advisory Report

Run the watcher to see what changed:

```bash
./scripts/sync-upstream.sh
```

Or check the GitHub issue created by the weekly workflow.

## Step 2 — Security Review

Before touching anything, check the changed files for:

| Risk | What to look for |
|------|-----------------|
| New dependencies | New entries in `package.json` or `pnpm-lock.yaml` — research each one |
| Auth/secrets changes | Any changes to how API keys, sessions, or tokens are handled |
| Outbound network calls | New `fetch()`, `axios`, `http.request()` to unknown URLs |
| Data access changes | New database queries, schema changes, or data exports |
| Supply chain | New packages from unknown authors or with few downloads |

If anything looks suspicious — stop. Do not proceed.

## Step 3 — Impact Assessment

For each changed file, ask:

- Does this affect a template I'm using (dispatch, mail, calendar, content, voice, forms)?
- Does it change the database schema? (Could break my data or require migration)
- Does it change any API that my apps currently call?
- Is it a breaking change that would require code changes on my side?
- What's the benefit — is it worth the risk?

## Step 4 — Get Recommendation

Ask Betty (Claude) to review the diff and give a recommendation:

```
"Here are the changes in AI-OS: [paste diff]
Please review for security, assess the impact on my app stack,
and give me a recommendation on whether to apply this update."
```

## Step 5 — Cally's Approval

No update goes in without explicit "yes, proceed" from Cally. Not implied, not assumed.

## Step 6 — Safe Implementation

If approved:

```bash
# 1. Backup your context data first
cp -r context/ context-backup-$(date +%Y%m%d)/

# 2. Create an isolated branch
git checkout -b update/ai-os-$(date +%Y%m%d)

# 3. Cherry-pick ONLY the commits you want
git cherry-pick <specific-commit-hash>

# 4. Test everything
pnpm install
pnpm dev  # verify each app still works

# 5. Verify context/ folder is untouched
git diff main -- context/  # should be empty

# 6. Merge only after confirmation
git checkout main
git merge update/ai-os-$(date +%Y%m%d)
```

## What Is NEVER Touched During an Update

These are off-limits during any AI-OS update merge:

- `context/` — all your personal context files
- `.env` — your secrets
- `apps/*/AGENTS.md` — your Betty-specific customisations
- `packages/shared/` — your shared Betty context

If a merge would touch any of these, resolve the conflict by keeping YOUR version.

## Emergency Rollback

If something breaks after an update:

```bash
git log --oneline -10           # find the last good commit
git revert <bad-commit-hash>    # revert just that commit
# OR
git reset --hard <good-commit>  # nuclear option — wipes to known good state
```
