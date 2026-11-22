# Design Process — Always-On Rules

These rules apply to every session in this repo. They are never skipped.
Settings (paths, branch names, tools) live in `design-system.config.yaml` — read it before any design work.

## 1. Always build from production
- Use ONLY the real tokens (`paths.tokens`) and real components (`paths.components`) from the codebase.
- Never hardcode colors, font sizes, spacing, radii, shadows or durations. Always use a token.
- Never invent a component. If something needed doesn't exist, stop and say so, and suggest what it could be built from.
- Never copy a component's code to modify it locally. Use it as-is through its props and variants.
- Before using a component, read its source to confirm its real props and variants. Don't guess.

## 2. Always work on a new branch
- Before changing ANY file, create a new branch from `git.base_branch`, named as in the config
  (`design/LIN-482-short-name`, or `design/YYYY-MM-DD-short-name` when there is no ticket).
- Only skip this if the user explicitly says so in this conversation (e.g. "work on the current branch").
- Never commit or push to a protected branch. A hook enforces this.

## 3. Organisms
- Read the relevant organism files in `design_context.organisms` fresh for every build. Never rely on memory of them.
- Follow each organism's Do / Don't rules exactly.
- If no organism fits, compose from existing components, follow the closest organism's rules,
  and flag the result as a **candidate organism** in the handoff.

## 4. Users and evidence
- Personas and workflows in `design-context/` are the foundation: build for them.
- Raw customer calls live in Granola. Synthesised findings live in `design_context.research`.
- When you make a claim about users, cite where it came from (persona file, workflow file, research file, or Granola meeting).

## 5. Stage
- Every build is either **exploration** or **production**. If it's unknown, ask.
- Follow the stage rules in the config and in the `stage-gate` skill.

## Starting work
Use `/design-project` to run the full process: brief → stage → build → review → handoff.
