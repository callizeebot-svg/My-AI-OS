#!/usr/bin/env bash
# sync-upstream.sh — Pull latest changes from AI-OS (agent-native upstream)
# Run this whenever BuilderIO releases updates you want to pull in.
#
# Usage: ./scripts/sync-upstream.sh

set -e

UPSTREAM_REPO="https://github.com/callizeebot-svg/AI-OS.git"
UPSTREAM_REMOTE="ai-os-upstream"
UPSTREAM_BRANCH="main"

echo "Syncing from AI-OS upstream..."

# Add remote if not already present
if ! git remote | grep -q "^${UPSTREAM_REMOTE}$"; then
  git remote add "$UPSTREAM_REMOTE" "$UPSTREAM_REPO"
  echo "Added remote: $UPSTREAM_REMOTE"
fi

# Fetch latest from upstream
git fetch "$UPSTREAM_REMOTE" "$UPSTREAM_BRANCH"

echo ""
echo "Commits in AI-OS not yet in My-AI-OS:"
git log HEAD..${UPSTREAM_REMOTE}/${UPSTREAM_BRANCH} --oneline --no-merges

echo ""
echo "To merge upstream changes:"
echo "  git merge ${UPSTREAM_REMOTE}/${UPSTREAM_BRANCH} --allow-unrelated-histories"
echo ""
echo "To cherry-pick a specific commit:"
echo "  git cherry-pick <commit-hash>"
