---
name: add-workflow
description: Add or update a user workflow (the steps a persona takes to get a job done) in the design context using the standard template. Use when the user wants to enter or change a workflow.
---

# Add Workflow

1. Ask the user to paste or describe the workflow (they may copy it from Figma).
2. Map it onto `design_context.templates/workflow.md`. Steps must be numbered and in order. Ask only about missing fields.
3. Link it to:
   - the personas who do it (`design_context.personas`, by name)
   - the organisms used at each step (`design_context.organisms`, by name), where known
4. Save to `design_context.workflows/<kebab-name>.md` with `last_reviewed` set to today.
5. Also add this workflow to each linked persona's **Key workflows** list if it isn't there already.
