---
name: design-project
description: Run the full design process for a new piece of work — brief, stage, build, review, handoff. Starts from a Linear ticket, a research file, a one-line description, or nothing.
argument-hint: "[LIN-123 | path/to/research.md | description | (empty)]"
disable-model-invocation: true
---

# Design Project — the conductor

You run the whole design process, step by step. Do not skip steps. Do not build before the brief is approved.

Input: `$ARGUMENTS` (may be empty).

## Step 0 — Load settings
Read `design-system.config.yaml` and `CLAUDE.md`. Use these paths and settings for everything below.

## Step 1 — Work out what you were given
- Matches `tickets.id_pattern` (e.g. `LIN-482`) → a Linear ticket. Fetch it with the Linear connector.
- A file path → a research file or note. Read it.
- Free text → a description of the problem.
- Empty → nothing yet. The brief intake will interview the user.

## Step 2 — Brief
Use the `brief-intake` skill with that input. It runs in this conversation, asks the user about gaps, and saves an approved brief to `design_context.briefs`.
Do not continue until the user has approved the brief.

## Step 3 — Ticket (only if there wasn't one)
If the work started without a Linear ticket and `tickets.offer_to_create` is true, ask:
"Want me to create a Linear ticket from this brief?"
- Yes → create it in `tickets.default_team` (ask which team if blank) with the brief's title, problem statement and success criteria. Use the new ID in the branch and brief names (rename the brief file).
- No → carry on with the date-based name.

## Step 4 — Stage
Use the `stage-gate` skill. Record the stage (exploration or production) in the brief.

## Step 5 — Branch
Create a new branch from `git.base_branch`:
- with ticket: `{branch_prefix}{TICKET-ID}-{short-name}`
- without: `{branch_prefix}{YYYY-MM-DD}-{short-name}`
Skip only if the user explicitly said to work on the current branch.

## Step 6 — Build
Delegate to the `builder` subagent. It cannot see this conversation, so pass it everything:
- the full path to the approved brief
- the stage and its rules (from the config)
- the branch name
- the organisms, personas and workflows the brief references

## Step 7 — Review
Delegate to the `reviewer` subagent with the branch name, the brief path and the stage.
If it reports **blocking** issues, send them back to the builder once to fix, then review again.

## Step 8 — Handoff
Tell the user, briefly:
- what was built and on which branch
- review results (anything still open)
- any **candidate organisms** flagged (offer to add them with the `organism-manager` skill)
- **production only:** if `brief.remind_gaps_before_pr` is true and the brief still has ⚠️ or ❌ items, list them and ask before opening the PR. Then open a pull request linked to the Linear ticket.
- **exploration:** list the variations and what each one tries. No PR unless asked.
