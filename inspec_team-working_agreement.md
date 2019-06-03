# Overview
This document covers the working agreement used by the Chef InSpec team. Its goal is to make transparent the team's practices, processes, communication, and coordination functions.

## Scope
While the key audience of the working agreement is the Chef InSpec product and engineering team, it is expected that all contributors of Chef InSpec abide by the agreement if they are contributing code to the product.

# Practices
*(e.g. Test Driven Development, Pairing, etc)*

## Other
* Graphical software design technology
  * google slides is generally "good enough"
  * capture final approach in version control ... or GH issue?
  * must link or otherwise ensure searchability later
* When doing a pairing session, mention it in the group chat in case others want to watch and learn.
* Keep your calendar up to date. Make it a reliable place to know your availability.
* It's OK to iterate. For example, a new resource doesn't have to be 100% "feature complete" (whatever that means!)... if it adds value to our users, and their feedback can help make the next iteration better, it's worth shipping.
  * What we DO ship should still be our best work for the value that we choose to ship.
* We strictly follow SemVer, especially with regards to breaking changes.
  * Any breaking change must happen in a major release and be preceded by deprecation warnings.
* "Author" header comments at the top of source files can be removed when a file is touched. Git history shall serve as our authoritative source of who was involved in the development of our source code.
  * Copyright lines must remain

## Testing
* We embrace TDD as often as possible, which (practically) means tests for functionality exists on the same or a preceding commit.
* Testing requirements for community PRs
  * acknowledge it is currently a barrier
  * may have an initiative to improve in 2019H2
  * may adopt PRs - discuss in triage

## Architecture/Design
* Group discussion for new major tickets or responsibilities
  * We do Agile, and this tends to get covered in sprint planning.
* Software design / architecture is a group effort
  * done with pictures or prose, not code

# Processes
*(e.g. board, demos, etc)*
* Do engineering prod demos on Fridays for your new work!
  * Only demo completed (merged) work.
* When working on a contribution, we create a short-lived topic branch that contains the topic contribution.
  * Naming convention: `<initials/name>/<shortname>`
* Remember when creating an issue to add plenty of context - even things that are "obvious". Depending on when the issue is addressed, you may not be the one working on it so giving context to the assignee is important.

## History/Pull Requests
* Have a reasonable number of commits per PR.
 * For a typical PR, 1 is too few and 50 is too many.
 * As we work on a PR, we occasionally rebase to master. We always rebase prior to merge.
 * When merging a PR, we do not squash.
* Keep your PR Title and Description on topic for the entire change.
* Prefer small, frequent, coherent commits during development on your PR.  (see commits-per-PR note)
* Avoid stale PRs
 * Consider GH feature which allow "not-a-PR PRs"
 * Avoid WIP PRs by pairing and additional collaboration.
* Assign issues to yourself when working them.
  * Try to keep number of active assigned issues low.
  * If you're not working on an issue or seeing it through to completion then unassign.
* Break down overcomplicated issues into smaller issues and relate them accordingly.
  * To break down, pull out all info from the parent ticket then close it.
* When a PR resolves an open issue, use GitHub keywords in the PR description to automatically close the issue upon merge.
  * https://help.GitHub.com/articles/closing-issues-using-keywords/
* Use GitHub action words in the PR to close issues and create links in the GitHub UI

# Communication
*(e.g. leaving context, cross team coordination)*
* Keep conversations as public as possible.
  * Default to team chat rather than DMs
  * Default to GitHub issues or PR comments as much as possible
  * Also use community-slack inpsec-dev, but be sure to capture important conversations in a persistent medium
* Feedback on code reviews go in GitHub reviews.

## Chat
* Doesn't convey emotion well.
  * Emojis can help that.
* If conversations become tense in chat, shift to Zoom.
  * Please recap the conversation from zoom with any outcome. This way anyone who saw the conversation started in slack can see the outcome
  * Consider if the outcome should go on GitHub as well

## Etiquette
* Be aware
  * Be gentle and sensitive when telling another team member something that is obvious to you.
    * Don't call out ignorance - the field is way too large for us all to have been exposed to everything.
    * These are a good starting point: https://www.recurse.com/manual#sec-environment
  * Be gentle about the state of the codebase
    * Avoid insulting it
    * Avoid associating personal ownership as you critique something (e.g. "Ugh, you are doing X, yuck")
* Be thankful
  * Thank community members verbosely
  * Reach out to first time contributors and welcome them!
* Be a mentor
  * Explaining something to another person can be a great way to check knowledge
  * You also solidify your knowledge of a topic as a different rigor is required to teach that very topic
* Be curious
  * Don't hesitate to ask questions! Asking questions helps check if a topic has shared understanding among the team

## Miscellaneous
* Coffeeshops
  * Sure! but...
  * be respectful about background noise
  * mute while in a conference
* Slack
  * is an asynchronous communication medium
  * We will endeavor to respond to our colleagues in a timely manner, but there is no guarantee on response time.
  * @here messages in #inspec-team are completely acceptable; users should alter their own personal notification settings as they see fit.
  * Recommended Channels
    * #inspec
    * #inspec-dev
    * #general (treated like #random)
