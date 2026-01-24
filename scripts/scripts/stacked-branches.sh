#!/bin/bash
# stacked-branches.sh
# Creates stacked branches where each builds on the previous

set -e # Exit on error

# Configuration
BASE_BRANCH="refactor-access-level"
NUM_COMMITS=11
BRANCH_PREFIX="refactor/hook-conversion-part"

# Backup current branch
CURRENT_BRANCH=$(git branch --show-current)
BACKUP_BRANCH="backup/$CURRENT_BRANCH-$(date +%Y%m%d-%H%M%S)"
git branch "$BACKUP_BRANCH"
echo "✓ Backup created: $BACKUP_BRANCH"

# Get commit hashes (oldest first)
COMMITS=($(git log --reverse --format="%H" -n $NUM_COMMITS))

if [ ${#COMMITS[@]} -lt $NUM_COMMITS ]; then
  echo "Warning: Only found ${#COMMITS[@]} commits"
fi

PREVIOUS_BRANCH="$BASE_BRANCH"

for i in "${!COMMITS[@]}"; do
  BRANCH_NAME="$BRANCH_PREFIX-$((i + 1))"
  COMMIT_MSG=$(git log --format="%s" -n 1 "${COMMITS[$i]}")

  git checkout "$PREVIOUS_BRANCH" --quiet
  git checkout -b "$BRANCH_NAME" --quiet
  git cherry-pick "${COMMITS[$i]}" --quiet

  echo "✓ Created: $BRANCH_NAME"
  echo "  Commit: ${COMMITS[$i]:0:7} - $COMMIT_MSG"
  echo "  Based on: $PREVIOUS_BRANCH"

  PREVIOUS_BRANCH="$BRANCH_NAME"
done

# Return to original branch
git checkout "$CURRENT_BRANCH" --quiet

echo ""
echo "Done! Created ${#COMMITS[@]} stacked branches."
echo "Backup available at: $BACKUP_BRANCH"
echo ""
echo "To restore: git checkout $BACKUP_BRANCH"
