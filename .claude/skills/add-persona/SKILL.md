---
name: add-persona
description: Add or update a user persona in the design context using the standard template. Use when the user wants to enter a persona (e.g. from Figma) or change one.
---

# Add Persona

1. Ask the user to paste or describe the persona (they may copy it from Figma).
2. Map it onto `design_context.templates/persona.md`. Ask only about fields that are missing. Leave a field blank rather than invent it.
3. Link the persona to existing workflows in `design_context.workflows` by name. If a workflow they mention doesn't exist yet, offer to add it with `add-workflow`.
4. Save to `design_context.personas/<kebab-name>.md` with `last_reviewed` set to today.
5. When updating, change only what was asked and update `last_reviewed`.
