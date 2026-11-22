---
name: stage-gate
description: Ask whether the work is in exploration or production, and set the rules for the build. Use after a brief is approved and before anything is built.
---

# Stage Gate

Ask the user, unless they've already said:

> Is this **exploration** or **production**?

Record the answer in the brief under **Stage**.

## Exploration
- Build `stages.exploration.variations` distinct variations (from the config). Each takes a different approach to the problem, not a cosmetic change.
- Still use real tokens and components wherever they exist.
- New patterns are allowed, but each must be clearly labelled **NOT IN SYSTEM**, with a note on what it would need (new component? new organism?).
- Organism Do/Don't rules may be challenged, but say so explicitly in the handoff.
- Speed over completeness: main states only.
- No pull request unless the user asks.

## Production
- System only: no new patterns, no NOT IN SYSTEM elements. If something is missing, stop and flag it.
- Follow organism Do/Don't rules exactly.
- Cover every state in `stages.production.require_states` that applies.
- Meet `stages.production.accessibility` (labels, focus order, contrast via tokens, keyboard use).
- Before the PR: if the brief still has ⚠️ or ❌ items, list them for the user. A reminder, not a block.
- Open a pull request linked to the Linear ticket.

If the user is unsure, suggest exploration when the brief has several ⚠️/❌ items or no organism fits, and production when the problem is clear and existing organisms cover it.
