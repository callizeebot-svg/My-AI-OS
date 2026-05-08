#!/usr/bin/env bash
# sync-upstream.sh — ADVISORY ONLY
#
# This script READS and REPORTS on what AI-OS upstream has changed.
# It does NOT merge, apply, or modify anything.
#
# To apply an update, follow the manual process in UPDATE-PROCESS.md
#
# Usage: ./scripts/sync-upstream.sh

set -e

UPSTREAM_REPO="https://github.com/callizeebot-svg/AI-OS.git"
UPSTREAM_REMOTE="ai-os"

echo "======================================="
echo "AI-OS Upstream Watcher — Advisory Only"
echo "======================================="
echo ""

# Add remote if not already present
if ! git remote | grep -q "^${UPSTREAM_REMOTE}$"; then
  git remote add "$UPSTREAM_REMOTE" "$UPSTREAM_REPO"
fi

git fetch "$UPSTREAM_REMOTE" main --quiet

COUNT=$(git log HEAD..${UPSTREAM_REMOTE}/main --oneline --no-merges | wc -l | tr -d ' ')

if [ "$COUNT" -eq "0" ]; then
  echo "My-AI-OS is up to date. No changes in AI-OS upstream."
  exit 0
fi

echo "Found $COUNT new commit(s) in AI-OS upstream:"
echo ""
git log HEAD..${UPSTREAM_REMOTE}/main --oneline --no-merges
echo ""
echo "Files changed:"
git diff HEAD ${UPSTREAM_REMOTE}/main --name-only
echo ""
echo "======================================="
echo "NEXT STEPS — Do not merge without:"
echo "======================================="
echo "1. Security review (new deps? auth changes? outbound calls?)"
echo "2. Impact assessment (schema changes? API breaks? data effects?)"
echo "3. Cally's explicit approval"
echo "4. Following UPDATE-PROCESS.md for safe implementation"
echo ""
echo "See: cat UPDATE-PROCESS.md"
echo ""
echo "To view a specific commit's diff:"
echo "  git show ai-os/<commit-hash>"
