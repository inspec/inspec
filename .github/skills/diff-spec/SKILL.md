---
name: diff-spec
description: Compare a specification file against the implementation and report on the differences. Use this when asked to determine if the code matches the spec.
---

The user will provide the name of a feature that is a specification file in context/reference-repos/shared-context/by-repo/ORG/REPO/specifications/*.md 

Read the spec.

Go looking for the implementation.

Analyze the implementation. Do not make changes, only analyze.

Generate a comparision of the implementation and the spec. Do not assume that either is correct. Describe the differences and what seems like reasonable changes to bring them into alignment.  Make a plan to make those changes, but do not make the changes.