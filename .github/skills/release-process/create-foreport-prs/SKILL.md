---
name: create-foreport-prs
description: Create foreported PRs for the changes that have already shipped with previous versions of InSpec.
---

You are a tool that helps user create foreported PRs for the changes that have already shipped with previous versions of InSpec. 

# Ask the user
- From which version we are going to foreport.
- To which version we are going to foreport.

## Version and branch mapping
- InSpec 5 -> inspec-5 branch
- InSpec 6 -> inspec-6 branch
- InSpec 7 -> main branch

## Determine list of changes that needs to be foreported

### Approach: Use CHANGELOG-based filtering

**IMPORTANT:** Only consider PRs from the **last 2 releases** of the source version to keep the foreport list focused and relevant.

**Steps to identify candidates:**

1. **Extract PRs from CHANGELOG**: Look at the source version's CHANGELOG.md for the last 2 releases
   - Identify the latest and second-latest release versions in CHANGELOG
   - Extract all PR numbers from "Merged Pull Requests" sections in those releases
   
2. **Check if changes are already in target branch**: For each PR from step 1, check if the equivalent changes already exist in the target branch
   - The PR number may be different, but the changes (files modified) should be similar
   - Use git history to verify if the same commits/changes are present
   - If the changes are already in target branch, skip it (no need to foreport)
   - If the changes are missing from target branch, it's a candidate for foreporting

3. **Analyze files in each candidate**: For PRs missing from target branch, examine what files were changed

Same logic will follow for any PR foreporting.

Foreporting can only happen from a lower version to a higher version.

## Rules to filter out from the initial list of changes:

**IMPORTANT** For this we need to analyse the PR changes one by one.

Ignore the foreporting for PRs in following cases:

- **Backported/Foreported PRs** - PRs with "Backport" or "Foreport" in the commit message or title (these are already from newer versions and should not be re-foreported)
- **Revert PRs** - PRs with "Revert" in the title or commit message (these are infrastructure/release management, not feature/fix changes)
- **NOTICE file changes only** - Changes only in NOTICE file are release/version tracking and should not be foreported
- If the change is in .github/ directory
- If the change is in .expeditor/ directory
- If the change is in habitat/ directory (EXCEPTION: Some legitimate bug fixes in habitat files may need to be foreported - evaluate case-by-case)
- If the change is in omnibus/ directory
- If the change is in version.rb file (In this case, make sure to alert the user about this PR, so that analysis can be done manually)

### Special handling for Gemfile.lock changes:

**IMPORTANT:** If a PR includes changes to **Gemfile.lock** but also includes real code changes:

1. **Alert the user** that this PR contains Gemfile.lock changes
2. **Show the user what versions were changed** (e.g., "train upgraded from 3.16.3 to 3.16.5")
3. **Ask the user to manually verify**:
   - Are these dependency versions needed in the target branch?
   - Should the versions be updated to match the source branch?
   - Are there version conflicts with other dependencies in the target branch?
4. **Mark as "NEEDS MANUAL REVIEW"** and let the user decide if it should be foreported or handled separately

**If a PR ONLY changes Gemfile.lock (no code changes):** Exclude it - lock file changes are version/build-specific and should not be automatically foreported.

This ensures that critical dependency updates are not missed, while allowing the user to make informed decisions about version compatibility.

### Detection of actual candidates (file content comparison):

When checking if a PR is "already in target branch":
- Do NOT rely on commit hashes or last-modified commits (they differ across branches)
- For each file changed by the PR, use `git diff source_branch:file target_branch:file` to compare actual file contents
- If the diff is empty (no output), the file contents are identical - PR is already in target branch
- If the diff shows differences, the PR's changes are missing from target branch - include it as a candidate for foreporting
- Ignore copyright/license header differences in diffs (they often differ between branches)
- Minor formatting or whitespace differences also indicate the PR should be skipped (changes already present with different formatting)

## Foreport PR in following steps:

 - Create a local branch with name foreport-<PR-NO-WHICH-IS-FOREPORTED> with that branch as base to which we are foreporting. For ex: If we are foreporting to InSpec 7 then it means we are going to take main as base. The version and branch mapping is also mentioned in ## Version and branch mapping section
 - Cherry-pick merge commit of that PR which we have selected for foreporting.
 - Ask the user to verify the local changes first before pushing changes to remote.
 - Ask the user to verify the PR title and description before creating the PR.
 - Create PRs for each change with title starting from "FOREPORT: ", followed by PR title.
 - Copy the PR description from the PR which is being foreported to main.
 - Also append "Foreports #<PR-NO-WHICH-IS-FOREPORTED>" in the end of description in PR.
