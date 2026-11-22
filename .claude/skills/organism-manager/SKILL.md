---
name: organism-manager
description: Add, update or retire an organism (a group of components with Do/Don't rules) in the design context. Use when the user creates or changes an organism, or when a build flags a candidate organism.
---

# Organism Manager

Organisms are the part of the system that changes most, so keep every file consistent.

## Add
1. Ask for (or take from a candidate organism in a handoff): name, purpose, the components it uses, and when to use it.
2. **Verify every component exists** in `paths.components`, using its real name in code. If one doesn't exist, say so. Don't write it in.
3. Ask for the Do / Don't rules. Suggest some based on the components and workflows, but the user decides.
4. Link related workflows and personas from `design-context/`.
5. Write the file from `design_context.templates/organism.md` into `design_context.organisms/<kebab-name>.md`. Set `status: active` and `last_updated` to today.

## Update
1. Read the current file.
2. Make only the requested changes, re-verify any components that were added, and update `last_updated`.
3. Add a line to the file's **Changelog** describing what changed.

## Retire
Set `status: retired`, add a changelog line saying why and what replaces it. Don't delete the file: briefs may still reference it.

## Check (on request)
Scan all organisms and report: components that no longer exist in code, organisms not updated in 6+ months, and organisms with no Do/Don't rules.
