#!/usr/bin/env bash
# Blocks commits, merges and pushes to protected branches.
# Claude Code passes the tool call as JSON on stdin. Exit code 2 blocks the call
# and sends the stderr message back to Claude.

input="$(cat)"

# Only care about git commands that write history.
if ! printf '%s' "$input" | grep -Eq 'git[^"]*(commit|push|merge|rebase)'; then
  exit 0
fi

PROTECTED_REGEX='^(main|master)$'
current_branch="$(git -C "${CLAUDE_PROJECT_DIR:-.}" rev-parse --abbrev-ref HEAD 2>/dev/null)"

# Committing/merging while on a protected branch
if printf '%s' "$input" | grep -Eq 'git[^"]*(commit|merge|rebase)'; then
  if [[ "$current_branch" =~ $PROTECTED_REGEX ]]; then
    echo "Blocked: you are on '$current_branch', which is protected. Create a new branch first (see design-system.config.yaml for naming)." >&2
    exit 2
  fi
fi

# Pushing to a protected branch (explicitly, or implicitly from one)
if printf '%s' "$input" | grep -Eq 'git[^"]*push'; then
  if printf '%s' "$input" | grep -Eq 'git[^"]*push[^"]*[ :](main|master)([ "]|$)'; then
    echo "Blocked: pushing to a protected branch is not allowed. Push your design/ branch and open a pull request instead." >&2
    exit 2
  fi
  if [[ "$current_branch" =~ $PROTECTED_REGEX ]]; then
    echo "Blocked: you are on '$current_branch', which is protected. Push from a design/ branch instead." >&2
    exit 2
  fi
fi

exit 0
