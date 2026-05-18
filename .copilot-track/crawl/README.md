# Copilot Track – Crawl Phase

This directory supports the **Crawl → Walk → Run** AI-assisted development ramp-up.

## What is "Crawl"?

Crawl PRs are small, low-risk, well-evidenced changes that build team confidence in AI-assisted workflows before moving to larger autonomous tasks.

---

## Chain-PRs

A **chain-PR** is a sequence of dependent pull requests where each builds on the previous one:

1. Each PR in the chain is small and independently reviewable.
2. Later PRs in the chain reference earlier ones in their description.
3. If an earlier PR needs changes, downstream PRs are rebased or recreated.

Use chain-PRs to break large features into digestible review units while keeping the full intent visible.

---

## Evidence in PRs

Every AI-assisted PR must include evidence of correctness:

- **Test results** – paste or link CI output showing tests pass.
- **Before/after** – show the behavioural difference (screenshots, logs, diff output).
- **Prompt reference** – note which prompt or instruction set guided the change (see below).
- **Review checklist** – confirm code style, security, and test coverage in the PR template.

---

## Prompt Usage

When a PR is generated with AI assistance:

1. Tag the PR with the `ai-assisted` label.
2. In the PR body, briefly describe the prompt or instruction used (e.g., "Used copilot-instructions.md workflow Step 2").
3. Do **not** paste full prompt transcripts — summarise intent and key constraints.
4. If the prompt came from a reusable `.prompt.md` file, reference it by path.

---

## Directory Contents

Place crawl-phase artefacts here:

| File | Purpose |
|------|---------|
| `README.md` | This file — process documentation |
| `*.prompt.md` | Reusable prompt templates (optional) |
| `evidence/` | Subfolder for logs/screenshots referenced by PRs (optional) |
