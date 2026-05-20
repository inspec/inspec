# Crawl Track — README

## What Is This Track?
A structured, prompt-driven learning path (18 exercises) for safely contributing to unfamiliar repos using GitHub Copilot.

## How Chain-PRs Work
Each exercise builds on the previous one using chained branches:
```
main → exercise-0-bootstrap → exercise-1-... → exercise-2-... → ...
```
- Each branch is created from the previous exercise's branch (not from `main`)
- PRs target the previous branch, creating a visible "learning chain" of diffs
- This keeps each PR small and reviewable

## Evidence in Every PR
Every PR **must** include evidence. Use the template in `../.copilot-track/pr-template.md`:
- Paste test output (copy/paste from terminal)
- Note risk level (low/medium) and rollback steps (`git revert <SHA>`)
- Link to any docs or diagrams changed

## Prompt Usage
Reusable prompts live in `.copilot-track/prompts.md`. Key ones:

| Prompt | When to use |
|--------|-------------|
| **Plan-first** | Start of every exercise — get a plan before writing code |
| **Write tests** | Before implementing — Arrange-Act-Assert format |
| **PR draft** | After implementation — fill the PR template |
| **Error handling** | Optional enhancement after core work is done |

## Guardrails (Always On)
- ✅ Keep PRs small and reversible
- ✅ Keep CI green (or attach local logs)
- ❌ No secrets in prompts or commits
- ❌ No edits in `vendor/`, `third_party/`, or submodule paths
- ⚠️ If a step gets hard: reduce scope, still produce a safe artifact + PR

## Directory Structure
```
ai-track-docs/          ← You are here (user-facing docs)
.copilot-track/
  crawl/                ← Per-exercise notes and artifacts
  prompts.md            ← Reusable Copilot prompts
  pr-template.md        ← PR template for all exercises
.github/
  instructions/
    exclude-submodules.instructions.md  ← Keeps Copilot out of vendor/
```
