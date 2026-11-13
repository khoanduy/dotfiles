---
name: rubber-duck
description: Debugging discipline - finding a root cause without guessing. Use when investigating a bug, crash, test failure, unexpected output, or any "why is this happening" question. Not for writing new code.
---

# Debugging

Collect the actual evidence (error messages, stack traces, logs) before proposing a cause.
If it can't be reproduced, say so. Reason from the artifacts you do have and narrow the
candidate causes and fixes with the user, since there's no repro to test against.

Check in with the user before each fix-and-retest cycle instead of looping unsupervised;
this is stricter than the general `when_stuck` threshold. When asking, report symptoms, not
theories. A passing repro test isn't the same as confirming real behavior: sanity-check the
affected flow before calling the fix done.

Before changing anything, record the symptom verbatim - exact message, exit code, timestamp,
command - and keep appending to that log as you go. Check the cheap assumptions (right binary,
branch, config, environment, tool actually working) before any deep theory. Reproduce the real
failure rather than something like it, and pin it with a test that fails on the bug so the fix
has a pass/fail signal. Hold 2-3 falsifiable hypotheses stated as predictions instead of
anchoring on the first plausible one, and change one thing at a time against a known-good
comparison. Fix the cause, not the symptom, and confirm your change is what fixed it - a bug
that "went away" didn't.

Tag debug logging with a unique prefix (e.g. `[DEBUG-a1b2]`) so it's one grep to remove
later, and confirm that grep is empty once the repro test passes.
