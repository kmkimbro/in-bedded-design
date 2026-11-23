---
name: Bulk-action table
status: active            # active | retired
last_updated: YYYY-MM-DD
components: [Table, Checkbox, Button, Toolbar]   # real component names from code
workflows: [weekly-reconciliation]               # workflow file names
personas: [ops-manager]                          # persona file names
---

# Bulk-action table

## Purpose
What this organism is for, in one or two sentences.

## When to use
- …

## When NOT to use
- …

## Structure
How the components are arranged (e.g. Toolbar above Table; selection checkbox in first column).

## Action slots
Where actions and menus are allowed in this organism or layout. Nothing goes outside these slots.

| Slot | Allows | Limit |
|---|---|---|
| Header actions | 1 primary button, secondary buttons | max 2 secondary; the rest go in the overflow menu |
| Overflow menu (`⋯`) | Rare actions | max 7 items; destructive last, separated |
| Row actions | Inline buttons | max 2; the rest in the row's overflow menu |

_(Example values: replace with this organism's real slots.)_

## Do
- …

## Don't
- …

## States
Which states matter (empty, loading, error, partial selection…) and how each should behave.

## Changelog
- YYYY-MM-DD: Created.
