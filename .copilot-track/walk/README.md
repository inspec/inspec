# Walk Track — README

## Goal
By the end of Walk, you can safely deliver **multi-file changes** by:
- Writing a plan before touching code
- Executing coordinated changes across 2–4 files without breaking CI
- Keeping docs in sync with every behavior change
- Producing review-ready PRs with risk awareness

## Completion Criteria
- [ ] At least one PR demonstrates plan-first multi-file execution
- [ ] Coverage or contract evidence included in at least one PR
- [ ] Documentation updated alongside behavior changes
- [ ] PRs include risk awareness and rollback guidance
- [ ] Evidence included consistently
- [ ] You can repeat the pattern on a real ticket

## Protocol (every exercise)
1. **Plan first** — write steps + files + risks before any diff
2. **Branch** `learn/walk/mohan-exN-slug` chained from previous exercise
3. **Implement** across 2–4 files
4. **Evidence** — coverage % or contract test output
5. **PR** — use the template in `pr-template.md`
6. **Push**

## Branch Chain
```
learn/crawl/mohan-ex15-resilience  ← Crawl end point
└── learn/walk/mohan-ex0-bootstrap
    └── learn/walk/mohan-ex1-<slug>
        └── learn/walk/mohan-ex2-<slug>
            └── ...
```

## Guardrails (always on)
- Keep PRs small and reversible; keep CI green (or attach local logs)
- No secrets in prompts or commits
- Exclude submodules/vendor from edits
- **Always write a plan before generating diffs**
- If a step gets hard: reduce scope but still produce a safe artifact + PR

## Difference from Crawl
| Crawl | Walk |
|-------|------|
| Single file changes | 2–4 file changes |
| Jump straight to code | Written plan before every diff |
| Basic test evidence | Coverage % or contract evidence |
| Simple PR structure | Full template with review focus + rollback |
