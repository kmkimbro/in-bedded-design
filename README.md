# Design Process for Claude Code — Skeleton

A design process that builds from real production code: brief → stage → build → review → handoff.

## What's in here

```
CLAUDE.md                      Always-on rules (build from production, new branch, organisms)
design-system.config.yaml      The ONE file to edit per repo: paths, Linear, Granola, stage rules
.claude/
  settings.json                Registers the branch-protection hook
  hooks/protect-main.sh        Blocks commits/pushes to main/master
  skills/
    design-project/            /design-project — runs the whole process
    brief-intake/              Guided 5W1H brief; asks about gaps (flag-and-continue)
    stage-gate/                Exploration vs production rules
    organism-manager/          Add / update / retire / check organisms
    add-persona/               Enter a persona from the template
    add-workflow/              Enter a workflow from the template
    add-research/              Turn a Granola call into a tagged research finding
  agents/
    builder.md                 Builds from real tokens/components on a branch
    reviewer.md                Read-only system check with fresh eyes
design-context/
  organisms/  personas/  workflows/  research/  briefs/
  templates/                   organism, persona, workflow, research-finding, brief
```

## Setting up on your work computer

1. **Copy** everything in this folder into the root of your work repo.
   If the repo already has a `CLAUDE.md` or `.claude/settings.json`, merge rather than overwrite.
2. **Make the hook executable:**
   ```
   chmod +x .claude/hooks/protect-main.sh
   ```
3. **Edit `design-system.config.yaml`:**
   - `paths.tokens` and `paths.components`: where your real tokens and components live
   - `git.base_branch`: usually `main`
   - `tickets.default_team`: your Linear team key
4. **Connect Linear and Granola to Claude Code** (Claude Code uses its own MCP setup, separate from the Claude app).
   Add each with `claude mcp add` using the MCP server URL from Linear's and Granola's docs, then run `/mcp` in Claude Code to sign in.
   Use project scope (`--scope project`) if you want the connection saved in the repo for teammates.
5. **Fill the design context:**
   - `/add-persona` and `/add-workflow` to enter personas and workflows from Figma
   - `/organism-manager` to add organisms as you finish them
6. **Commit** the `.claude/`, `design-context/`, `CLAUDE.md` and config to the repo.

## Using it

```
/design-project LIN-482                          from a Linear ticket
/design-project design-context/research/x.md     from a research finding
/design-project users can't bulk-edit invoices   from a description
/design-project                                  from nothing (it interviews you)
```

Other commands: `/brief-intake`, `/stage-gate`, `/organism-manager`, `/add-persona`, `/add-workflow`, `/add-research`.

## Moving this from your personal computer

Easiest: push this folder to a private Git repo, then clone or copy it at work. You get version history as you refine it.
Check your company's policy on bringing outside files onto work machines first.
