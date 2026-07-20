---
name: generate-release-notes
description: Generate release notes for InSpec based on the changes in CHANGELOG.md and the latest release notes.
---

You are a tool that helps user generate a new release note change for the coming InSpec release. Generate release notes for the determined version of InSpec (5 or 7) by following the steps below.

## Determine the InSpec version:
1. Read the `lib/inspec/version.rb` file from the current branch
2. Extract the VERSION string (e.g., "5.24.20" or "7.1.6")
3. Identify the major version (first number: 5 or 7)
4. Print in big letters the major version for which release notes are being generated. For example, if version is "5.24.20", print "GENERATING RELEASE NOTES FOR INSPEC 5". If version is "7.1.6", print "GENERATING RELEASE NOTES FOR INSPEC 7".

## Rebase current branch:

- If InSpec version is 5 - pull latest changes into inspec-5 branch and then rebase current branch with inspec-5 branch
- If InSpec version is 7 - pull latest changes into main branch and rebase current branch with main branch

## Determine the initial InSpec items that will go in the release notes:

You will do this by comparing ALL changes in CHANGELOG.md since the last stable release (and including all unreleased changes) with the latest release notes available at https://docs.chef.io/release_notes/inspec/.

If version is InSpec 5:
  - check CHANGELOG.md in inspec-5 branch
If version is InSpec 7:
  - check CHANGELOG.md in main branch

When generating the release notes:
1. Identify the latest stable released version (marked with `<!-- latest_stable_release -->`)
2. Collect ALL changes from:
   - The "Unreleased" section (if present)
   - The "Changes since X.Y.Z release" section (all PRs listed after the stable release version)
   - This includes all versions/patch releases between the last stable version and the current version
3. Filter out changes that are already present in the latest release notes for that major version

## Determine the initial train items that will go in the release notes:

When train gem has been updated in the InSpec release, include relevant train changes in the release notes:

1. **Identify train version updates**: Check the InSpec CHANGELOG for any train, train-core, or other train-* gem version bumps. Look for PRs that update these gems and note the old and new version numbers.

2. **Determine train versions and collect ALL changes**:
   - Find the old and new train version numbers being used (check `Gemfile.lock` or PR descriptions)
   - Research the train gem changelog to identify **ALL** changes between the old and new versions, including:
     - Bug fixes
     - Features and enhancements
     - Dependency updates (both direct dependency version changes AND dependency constraint changes)
     - Performance improvements
   - Focus on user-facing changes (bug fixes, features, enhancements) AND dependency updates that could impact InSpec users

3. **Apply filtering to train changes**: Use the same filtering rules as InSpec changes:
   - Include: bug fixes, features, enhancements, dependency updates, performance improvements
   - Exclude: documentation-only, refactors, CI/test-only changes
   - Include dependency updates from train if they update direct dependencies (not transitive ones)

4. **Categorize train changes**:
   - If the train change is part of an InSpec feature/fix PR: Club them together and mention it's "from train"
   - If the train change is independent: Include it as a separate item with a note that it's from train
   - For train dependency updates: Document each gem update on its own line (following the same format as InSpec dependency updates)
   - Do NOT create a separate "train" section

5. **Formatting train changes**: Include train changes in the relevant sections (Bug fixes, Enhancements, Improvements, Dependency Updates) with a mention of train:
   - Format for bug fixes: `- Description of change from train. (from train [#XXX](https://github.com/inspec/train/pull/XXX))`
   - Format for dependency updates: `- Updated gem_name from old_version to new_version (from train). ([#TRAIN_PR](https://github.com/inspec/train/pull/TRAIN_PR))`
   - Or when coupled with InSpec PR: `- Updated train from X to Y. ([#INSPEC_PR](link)) (train [#TRAIN_PR](link))`

6. **Integration rule**: Include train changes that directly impact InSpec functionality, end-user experience, OR dependency management. Skip only internal infrastructure or test-only changes in train.

## Apply filtering rules to both InSpec and train items:

### Rules to select changes required for release notes:

1. If the change is a bug fix and not a CI fix, it should be included in the release notes.
3. If the change is a new feature, it should be included in the release notes.
4. If the change is a documentation change, it should not be included in the release notes.
5. If the change is a refactor, it should not be included in the release notes.
8. If the change is a performance improvement, it should be included in the release notes.
9. If the change is a security fix, it should be included in the release notes.
10. If the change is in omnibus/ directory should NOT be included in the release notes (omnibus is packaging only).
11. If it is a NOTICE file change, do not include this in release notes.
12. If the change is only in the habitat/ directory (hooks, build scripts, or any other habitat-only files) and has no end-user facing value, it should NOT be included in the release notes. Only include habitat changes under Packaging if they directly affect how users install or consume InSpec (for example, adding a new platform or distribution channel).


### In case the change is a dependency update of any gem, check these things:

For these changes, inspect the files changes in the PR to determine following:

1. If the change is in any of the .gemspec file, it should be included in the release notes.
2. If the change is in a Gemfile.lock file, include this in the release notes ONLY if it includes updates to direct dependencies (not transitive/indirect dependencies).
3. The dependency update PRs with security label should be grouped under "Security fixes" section in the release notes.
4. Regular dependency updates in .gemspec should be grouped together (can be under "Dependency updates" section if there are multiple non-security updates).
5. When documenting dependency updates, always include each update on a separate line with the following format:
   - `Updated gem_name from old_version (or version constraints) to new_version (or version constraints). ([#XXXX](link))`
   - Example: `Updated nokogiri from < 1.18.10 to 1.18.10. ([#7946](https://github.com/inspec/inspec/pull/7946))`
   - Each gem update should be on its own line, not combined on a single line
6. IMPORTANT: Only include direct dependencies from Gemfile (not transitive ones updated only as a result of other gem updates).

### If the change is a test or CI/pipeline change, check these things:

For these changes, inspect the files changes in the PR to determine following:

1. If the change is only in a test directory and nothing in lib/ or habitat/ directory, it should not be included in the release notes.
2. If the change is an .expeditor/ directory, it should not be included in the release notes.

## Format the Release Notes:

We can use markdown formatting for this as used in release notes for InSpec here https://docs.chef.io/release_notes/inspec/.
And always prefer detailed, user-facing descriptions over technical jargon when describing changes.

Release notes should be organized into the following sections (include only sections that have content). Use the appropriate sections for each release:

### Main Sections (in order of appearance):

1. **Key features**: High-level overview of major new capabilities with links to detailed documentation
2. **Enhancements**: Single enhancements or improvements to specific resources/features
3. **Improvements**: General improvements, performance improvements, security improvements or multiple related improvements
4. **Bug fixes**: General bug fixes organized by area/component or resource
5. **Security fixes**: Security vulnerabilities, CVE fixes, or dependency security updates.
6. **Dependency updates**: Regular Gem and library updates.
7. **Packaging**: Packaging-related changes (new/removed platforms, build improvements)

### Formatting guidelines:

- **Simple format**: `- Brief description. ([#XXXX](https://github.com/inspec/inspec/pull/XXXX))`
- **Multi-line with context**: First describe the problem, then the solution, then link. Example:
  - "We improved notifications when running waivers. Previously, InSpec failed with an error; now it emits a warning and continues. ([#7339](link))"
- **Grouped items**: Group related changes under a feature/component heading with nested sub-bullets:
  ```
  - The resource_name resource has the following improvements:
    - Sub-improvement 1. ([#7001](link))
    - Sub-improvement 2 with context. ([#7002](link))
  ```
- **Nested subsections**: Use `####` headers for subsections within Bug fixes or other main sections:
  - Example: `#### Waiver files` or `#### Security fixes`
- **Resource-specific grouping**: When multiple fixes affect one resource, group them together
- **Include context**: Always explain what changed and why (the "before/after" or "problem/solution")
- **Code examples**: Include code examples when demonstrating feature usage
- **Train/dependencies**: Specify if update is from train/train-aws/train-core with appropriate PR link (e.g., `(train [#812](link))`)
- **User-facing descriptions**: Prioritize user impact and clarity over technical jargon
- **Feature documentation links**: Link to detailed documentation for new/improved features when available
- **Language quality**: All items in release notes must have correct grammar and clear language. Avoid awkward phrasings like "Fixed Fixes in..." - ensure each description clearly states what was improved or fixed and the benefit to users.

## Ask for user approval:

After the release notes content is generated, ask the user if they approve of it?

If they approve of it, save it in a tmp file.

Then check if user has an access for https://github.com/chef/chef-web-docs project. If user has access, clone the repo if it is not already cloned.

Create a new branch in local environment for this project, https://github.com/chef/chef-web-docs.

And commit changes in branch release-notes/inspec-<major-version.minor-version>.

If user approves it, then push the branch to remote and create a pull request for the same.
