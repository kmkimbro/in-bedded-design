---
name: add-research
description: Turn a customer call from Granola, or an insight from the user, into a synthesised research finding tagged to personas and workflows. Use when an important finding should be kept in the design context.
---

# Add Research

Raw calls stay in Granola. Only **synthesised findings** worth keeping go in `design_context.research`.

1. Get the source: a Granola meeting (search for it with the Granola connector) or something the user tells you.
2. Draft the finding with `design_context.templates/research-finding.md`:
   - one clear finding per file, written as a statement
   - the evidence: a short quote or paraphrase, plus the Granola meeting title and date
   - tags: the personas and workflows it relates to (by file name)
   - confidence: single call / several calls / validated
3. Before saving, check whether an existing finding already says the same thing. If so, add this as more evidence there instead of creating a duplicate, and raise its confidence.
4. **Contradiction check:** if the finding conflicts with a persona or workflow file, tell the user. The foundation may be out of date.
5. Show the draft to the user, then save to `design_context.research/YYYY-MM-DD-short-name.md`.
