---
name: design-system
description: Find the right token, component, organism, layout or UX pattern for any UI work. Use whenever building, changing or reviewing UI in this repo, including pages, forms, menus, modals, tables and styling, even when the user doesn't mention the design system.
---

# Design System Lookup

Make following the design system the easy path. The rules are in `AGENTS.md`; this skill helps apply them quickly.
This is not the design process: no briefs, stages or branches here.

## 1. Before writing UI code
Read `design-system.config.yaml` for paths, then:

1. **Is there an organism or layout for this?** Search `design_context.organisms` by purpose and component names. If one fits, use it, follow its Do / Don't rules, and put actions only in its **action slots**.
2. **Which components?** Find them in `paths.components`. Open each one's source to check its real props and variants. Prefer an existing variant over custom styling.
3. **Choosing between similar patterns?** (modal vs drawer, dropdown vs radio, toast vs banner, tabs vs accordion, menu vs visible buttons): read the matching decision guide in `design_context.ux_guidelines` and follow it.
4. **Which tokens?** Look up every color, size, spacing, radius, shadow and duration in `paths.tokens`. Never write a raw value.
5. **Part of a known workflow?** If the screen appears in `design_context.workflows`, avoid adding steps, clicks or confirmations to it.

## 2. While writing
- Raw element where a component exists → use the component.
- Needed value has no token → use the closest token and leave a short comment flagging it.
- Component can't do what's needed → don't fork it. Say so, and suggest a new variant.
- Nothing fits → compose from components and mention it as a possible new organism.

## 3. Tell the user, briefly
Which organism, components and guides you used, plus anything flagged. One or two lines, not an essay.
