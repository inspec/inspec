# Copilot Track – Crawl README

This folder is the **Crawl** stage of the AI-track scaffolding for the InSpec project.
It documents conventions that GitHub Copilot (and human contributors) should follow when
working within this repository under AI-assisted development.

---

## 1. Chain-PRs

**Chain-PRs** break large features or refactors into a sequential series of pull requests
where each PR builds on the merged state of its predecessor.

### Why chain-PRs?
- Smaller diffs are easier to review and less likely to introduce regressions.
- Each PR can be tested in CI independently, giving early signal on failures.
- Reviewers can focus on one logical change at a time.

### Convention
1. **Name PRs with a sequence prefix** — e.g., `[1/3]`, `[2/3]`, `[3/3]` in the title.
2. **Open all PRs upfront** (in draft if not ready) so reviewers see the full chain.
3. **Base each PR on the previous branch**, not on `main`, until the chain is ready to land.
   ```
   main ← PR-1 (branch: feat/my-feature-1)
                ← PR-2 (branch: feat/my-feature-2)
                         ← PR-3 (branch: feat/my-feature-3)
   ```
4. **Rebase forward** after each PR merges — rebase PR-2 onto `main`, then PR-3 onto PR-2's
   new base, etc.
5. **Link the chain** — each PR description must list all sibling PRs:
   ```
   Chain: #101 (merged) → **#102 (this PR)** → #103
   ```

### Copilot guidance
When Copilot generates a chain-PR, it should:
- Open the earliest unmerged PR in the chain.
- Keep each PR to a single logical concern (one subsystem, one resource, one test file group).
- Not skip the rebase step — always confirm the base branch is up-to-date before pushing.

---

## 2. Evidence in PRs

Every AI-assisted PR **must include evidence** that the change works as intended.
Evidence keeps reviewers informed and builds trust in AI-generated contributions.

### Required evidence blocks

Include an `## Evidence` section in every PR description:

```markdown
## Evidence

### Tests passing
\`\`\`
bundle exec rake test:unit
...
47 runs, 89 assertions, 0 failures, 0 errors
\`\`\`

### Linting clean
\`\`\`
bundle exec rubocop --format progress
...
Inspecting 312 files
312 files inspected, no offenses detected
\`\`\`

### Manual verification (if applicable)
\`\`\`
bundle exec inspec exec examples/profile --reporter cli
...
Profile: InSpec Profile (examples/profile)
...
0 failures
\`\`\`
```

### Accepted evidence types

| Type | When required |
|------|--------------|
| Unit test output | Always (for code changes) |
| RuboCop / linter output | Always (for code changes) |
| Functional test output | When CLI behaviour changes |
| `inspec exec` run | When resource or runner logic changes |
| Before/after comparison | When fixing a bug |
| Screenshots / logs | When UI or output format changes |

### What is NOT acceptable
- "Tests pass locally" with no output.
- Empty `## Evidence` sections.
- Evidence that only covers the happy path when edge cases exist.

---

## 3. Prompt Usage

This section records the prompts used to generate or guide AI contributions, making the
development process auditable and reproducible.

### Why record prompts?
- Enables other contributors to regenerate or extend AI output.
- Documents the intent behind a change in AI-assisted sessions.
- Supports post-hoc review of AI decision-making.

### Where to record prompts

Add a `## Copilot Prompts` section to the PR description or to a companion file in
`.copilot-track/crawl/prompts/` named `<PR-number>-<slug>.md`.

```markdown
## Copilot Prompts

**Session date:** 2026-05-20  
**Model:** Claude Sonnet 4.6 (claude-sonnet-4.6)

### Prompt 1 – Initial scaffolding
> Create ai-track-docs/ and .copilot-track/crawl/ scaffolding.
> Add SYSTEM-OVERVIEW.md, build-test.md, architecture.mmd.
> Add a short Crawl README explaining chain-PRs, evidence in PRs, and prompt usage.

**Output:** Created 4 files, no existing files modified.

### Prompt 2 – (next prompt here)
> …
```

### Prompt hygiene rules
1. **Copy the exact prompt** — do not paraphrase.
2. **Note the model** — model capability affects output; record the model ID.
3. **Record what was accepted vs. modified** — if you edited the AI output, note what changed.
4. **One prompt block per distinct task** — do not merge unrelated prompts.

---

## 4. Folder Structure

```
.copilot-track/
└── crawl/
    ├── README.md          ← This file
    └── prompts/           ← Per-PR prompt logs (created as needed)
        └── <PR>-<slug>.md
```

---

## 5. Quick Reference

| Convention | Rule |
|-----------|------|
| Chain-PR title | `[N/Total] feat: JIRA-ID – description` |
| Chain base branch | Previous PR's branch, not `main` |
| Evidence section | Required in every code-change PR |
| Prompt log | Required for every AI-assisted PR |
| Files not to touch | `VERSION`, `Gemfile.lock`, `.expeditor/`, submodules, vendor/ |
