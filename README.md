# in:bedded design

A design system and design process for Claude Code, built on real production code.

It has two parts:
- **For everyone (engineers included):** design system rules that any AI coding tool follows, a lookup skill that makes the right component the easy choice, and a non-blocking design review on every pull request.
- **For designers:** a full design process, run with `/design-project`: brief → stage → build → review → handoff.

## What's in here

```
AGENTS.md                      Design system rules for everyone and every AI coding tool
CLAUDE.md                      Claude Code instructions (imports AGENTS.md)
design-system.config.yaml      The ONE file to edit per repo: paths, Linear, Granola, PR review, stage rules
.claude/
  settings.json                Registers the branch-protection hook
  hooks/protect-main.sh        Blocks commits/pushes to main/master
  skills/
    design-system/             Auto-loads for any UI work: finds the right component, organism, guideline
    design-project/            /design-project: runs the whole design process (designers)
    brief-intake/              Guided 5W1H brief; asks about gaps (flag-and-continue)
    stage-gate/                Exploration vs production rules
    organism-manager/          Add / update / retire / check organisms
    add-persona/               Enter a persona from the template
    add-workflow/              Enter a workflow from the template
    add-research/              Turn a Granola call into a tagged research finding
  agents/
    builder.md                 Builds from real tokens/components on a branch
    reviewer.md                Read-only design system + UX review (design process or PR mode)
ci/
  design-system-review.yml     GitHub Action: design review comments on every PR (non-blocking)
design-context/
  organisms/  personas/  workflows/  research/  briefs/
  ux-guidelines/               "When to use which" decision guides
  templates/                   organism, persona, workflow, research-finding, brief, ux-guideline
```

## How it helps engineers follow the design system

Nothing here blocks engineering. The aim is to make following the system easier than not following it.

| Layer | Who it affects | What it does |
|---|---|---|
| `AGENTS.md` | Anyone using an AI coding tool that reads it | Tokens only, components only, organism action slots, UX decision guides |
| `design-system` skill | Engineers using Claude Code | Loads automatically for UI work and looks up the right organism, component, guide and tokens |
| PR review (`ci/`) | Every pull request | One friendly summary comment, one-click suggested fixes, UX findings as questions, and a design debt count. Only reviews new code. |
| Lint rules | Everyone, in the editor | _Not included yet:_ add auto-fixing rules for hardcoded values and raw elements, suited to your framework |

## Setting up in your repo

1. **Copy** everything into the root of your product repo.
   If it already has a `CLAUDE.md`, `AGENTS.md` or `.claude/settings.json`, merge rather than overwrite.
2. **Make the hook executable:**
   ```
   chmod +x .claude/hooks/protect-main.sh
   ```
3. **Edit `design-system.config.yaml`:**
   - `paths.tokens` and `paths.components`: where your real tokens and components live
   - `git.base_branch`: usually `main`
   - `tickets.default_team`: your Linear team key
4. **Turn on PR review** (optional, recommended):
   - copy `ci/design-system-review.yml` to `.github/workflows/design-system-review.yml`
   - add an `ANTHROPIC_API_KEY` secret in the repo's GitHub settings
   - tell engineers what it is first: comments only, never blocking
5. **Connect Linear and Granola to Claude Code** (designers; Claude Code uses its own MCP setup, separate from the Claude app).
   Add each with `claude mcp add` using the MCP server URL from Linear's and Granola's docs, then run `/mcp` in Claude Code to sign in.
6. **Fill the design context:**
   - `/organism-manager` to add organisms and layouts, including their **action slots**
   - guides in `design-context/ux-guidelines/`, starting with selection and overlays
   - `/add-persona` and `/add-workflow` to enter personas and workflows
7. **Commit** it all to the repo.

## Using it

**Engineers:** nothing new to learn. Build UI as usual. Claude (and other tools that read `AGENTS.md`) follow the design system, and PRs get a design review comment.

**Designers:**
```
/design-project LIN-482                          from a Linear ticket
/design-project design-context/research/x.md     from a research finding
/design-project users can't bulk-edit invoices   from a description
/design-project                                  from nothing (it interviews you)
```

Other commands: `/brief-intake`, `/stage-gate`, `/organism-manager`, `/add-persona`, `/add-workflow`, `/add-research`.
