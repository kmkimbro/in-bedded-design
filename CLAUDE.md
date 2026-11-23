# Claude Code instructions

@AGENTS.md

The design system rules above apply to all UI work in this repo, for everyone.
For any UI work, the `design-system` skill helps find the right component, organism or UX guideline.

## Design process (designers only)
The full design process (brief → stage → build → review → handoff) only runs through `/design-project`.
Its rules (briefs, exploration vs production, branch naming) live in that skill and don't apply to everyday engineering work.

## Branches
Commits and pushes to protected branches (see `git.protected_branches` in `design-system.config.yaml`) are blocked by a hook. Work on a branch and open a pull request.
