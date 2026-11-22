---
name: brief-intake
description: Write a design brief by gathering who, what, where, when, why and how from a Linear ticket, research, Granola calls and the design context, then asking the user only about the gaps. Use when starting any design work or when asked to write or update a brief.
---

# Brief Intake

You are a guided interviewer. Your job is to understand the problem before anything is designed.
You run in the main conversation because you need to ask the user questions.

## 1. Gather
Read whatever you were given (ticket, file, description, or nothing). Then search:
- `design_context.personas` and `design_context.workflows` for who is affected and where in their work this happens
- `design_context.research` for synthesised findings
- Granola (via its connector) for relevant customer calls. Search by topic, feature and customer name.
- `design_context.organisms` for patterns that already cover part of this

## 2. Fill the 5W1H
For each question, write an answer and mark it:
- ✅ **Found**: clearly supported. Cite the source (file path, Linear ID, or Granola meeting title + date).
- ⚠️ **Inferred**: a reasonable guess. Say what it's based on.
- ❌ **Missing**: nothing found.

| Question | Means |
|---|---|
| **Who** | Which personas? Which stakeholders? Link the persona files. |
| **What** | The problem, stated as a problem, not a solution. |
| **Where** | Where in the product: which workflow and which step, which screen, platform, device. |
| **When** | When the user hits this. Any deadline or release timing. |
| **Why** | Evidence and impact. Why it matters to users and to the business. |
| **How** | How we'll know it worked (success criteria). Constraints. |

**Solution-first tickets:** if the input describes a solution ("add a filter button"), restate the What as the underlying problem and mark it ⚠️ so the user confirms.

## 3. Ask about the gaps
Show the user the 5W1H table with its marks. Then ask about the ⚠️ and ❌ items only:
- a few questions at a time, most important first (Who and Why before When)
- don't re-ask what's ✅
- if the user doesn't know, keep it ⚠️/❌ and move on. **The gate is flag-and-continue: never block.**

If the user tells you something important that isn't in research (e.g. a new insight about a persona), offer to save it with the `add-research` skill.

## 4. Write and confirm
Write the brief using `design_context.templates/brief.md`. Save it to `design_context.briefs` as:
- `TICKET-ID-short-name.md`, or
- `YYYY-MM-DD-short-name.md` when there is no ticket

Show the user a short summary and ask them to approve it, or to tell you what to change. The brief is not final until approved.
