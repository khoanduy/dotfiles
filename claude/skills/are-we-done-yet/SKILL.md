---
name: are-we-done-yet
description: Owns design discussion, plan file structure, and test-first execution - load whenever entering plan mode, and for any other multi-file or multi-step work whose plan will outlive a single context window. Not for one-line fixes or single-file changes.
---

# Design discussion (before any plan)

Nothing gets written - no plan sections, no files, no code - until the user has signed off.

Ask in rounds through `AskUserQuestion` until no open question remains. Cover:

- requirements and intent - the problem, who it is for, what done looks like, constraints
- alternatives - 2-3 approaches with their trade-offs, and a recommendation
- acceptance criteria - drafted together, the failure shape included
- scope - what is deliberately left out

A gap is a question to ask, not an answer to assume. Read the code first so questions are about
intent, not about facts the repo already answers.

Confirm each decision as it settles. Then close with a summary gate: the decisions, the acceptance
criteria, and what is out of scope, and wait for an explicit "agreed". A revision at the gate
reopens the discussion; it does not go straight to writing.

# Plan file structure

Extend the existing plan file. Do not create a second document.

## Sections, in order

- `## State` - one line, rewritten (never appended) each time work lands: what is done, which
  criterion is in progress, what is next. This is the first thing read after a compaction.
- `## Context` - why this change is happening: the problem or need, what prompted it, the
  intended outcome.
- `## Decisions taken` - one sentence per decision, in the form: in the context of X, facing Y,
  we chose Z over W, to achieve Q, accepting D. Naming W is the point - it is what stops a
  settled alternative coming back after a compaction.
- `## Changes` - numbered, per-file, ordered test-first: the test for a criterion comes before
  the code that satisfies it. Name existing functions and utilities to reuse.
- `## Acceptance criteria` - checkable statements about observable behavior, agreed before
  writing code, each naming the test that proves it (or the manual check, when it cannot be
  automated). One per shape that applies:
  - plain: "`GET /orders` returns results ordered by `created_at` descending"
  - on a trigger: "when the cursor is exhausted, the response omits `next_cursor`"
  - in a state: "while a migration is running against the table, writes return `503`, not a
    partial commit"
  - on failure: "if the cursor is malformed, the endpoint returns `400` with an error body,
    not a `500`"
  The failure shape is the one most often missing. Not a restatement of a task: "update the
  install script" is not a criterion, and a criterion nobody can check is not a criterion.
- `## Out of scope` - what was deliberately left out, and why.
- `## Validation` - how to verify each acceptance criterion end to end, written with the plan.
  It becomes a checklist once implementation starts; tick an item when it has been verified, not
  when it has been written.

The plan file is the artifact that survives compaction. Progress recorded only in the
conversation is lost when the window rolls, so update the file, not just the todo list.

# Execution: test-first

One loop per acceptance criterion, in the project's existing test framework:

1. Write the criterion's test.
2. Run that test alone. It must fail, and for the expected reason - note which in one line. A
   test that passes, or fails for another reason, is wrong; fix the test before writing code.
3. Write the minimum code to make it pass; rerun the targeted test.
4. Refactor only if the code needs it.

After the last criterion, run the full suite once. A criterion that cannot be automated (visual
layout, a live third-party integration) gets its manual check in `## Validation` instead of a
test.
