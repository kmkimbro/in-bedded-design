# Design System Rules

These rules apply to **everyone and every AI coding tool** working on UI in this repo.
They're about following the design system, not about any particular process.
Paths live in `design-system.config.yaml`.

## 1. Tokens only
- Never hardcode colors, font sizes, font weights, line heights, spacing, radii, shadows, z-indexes or durations.
- Always use a token from `paths.tokens`. If the value you need doesn't exist as a token, use the closest token and flag it. Don't invent one.

## 2. Components only
- Use the components in `paths.components`. Read a component's source to confirm its real props and variants before using it.
- Never use a raw HTML element where a system component exists (e.g. use `<Button>`, not `<button>`; use the system input, not `<input>`).
- Never build a one-off version of something the system already has: buttons, inputs, dropdowns, menus, popovers, modals, drawers, cards, tabs, toasts.
- Never copy a component's code to change it locally. If a component can't do what you need, stop and flag it: it may need a new variant.

## 3. Organisms and layouts
- If an organism or layout in `design_context.organisms` covers what you're building, use it and follow its **Do / Don't** rules.
- Put actions and menus **only in the organism's or layout's action slots**. Don't add new menus, toolbars or action areas on top of a layout.
- If nothing fits, compose from system components and say so in the PR so it can be considered as a new organism.

## 4. UX guidelines
- When choosing between similar patterns (modal vs drawer, dropdown vs radio, toast vs banner, tabs vs accordion, menu vs visible buttons), check the decision guides in `design_context.ux_guidelines` and follow them.
- Don't add steps, clicks or confirmations to a known workflow in `design_context.workflows` without a reason.

## 5. When in doubt
Ask, or flag it in the PR. A flagged exception is fine; a silent one becomes design debt.
