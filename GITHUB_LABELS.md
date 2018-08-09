# Inspec Project GitHub Labeling Policies

## Stakes

The InSpec teams' intent is that issue/PR labelling be a low-stakes operation.

## Purpose

### Inspiration

We created many of the labels, after looking over the labelling system used by the Habitat project.  They have an [extensive label list](https://github.com/habitat-sh/habitat/labels) and a simple [description of their categories](https://github.com/habitat-sh/habitat/blob/master/CONTRIBUTING.md#issue-triage).

The inspec labels are a smaller list.

### For Humans

The goal for people is for the labeling system to be useful and practical:

 * Able to discover patterns (for example, clusters of issues around a certain aspect, such as UX)
 * Easy to find related issues when starting a batch of work ("I want to work on the website. What are all of ouor current issues with the website?")
 * Enable interested parties to search for issue / PR counts by their desired platform

The colors don't mean anything at this point; we've generally just accepted the default.

Currently, we have one anti-goal:

* Do not indicate priority or timeline information via labelling.  That's high-stakes, and quickly becomes out of date.  The Inspec team internally tracks its Chef, Inc. priorities; all other issues may be addressed on an as-needed, FOSS basis.

### For Machines

Several machines are interested in our labels, including:

 * the expeditor configuration uses labels to bump minor versions, and construct changelogs, sorting PRs by Type.
 * the GitHub search facility looks for certain labels to list opportunities to participate in FOSS projects

## Protocol

### Assigning Labels To Issues and PRs

Whether you are a community member or a team member, just go ahead and apply what you think is sensible.  It's low stakes.  If they need to be tweaked a bit, a team member will do it, and it's not a big deal. We just appreciate the effort!

### Adding, Changing and Removing Labels

Only InSpec team members can manage labels.

If you're a member of the community who has a suggestion, you can let us know on Community Slack, or by opening an issue.

#### Adding New Labels

Have a look at the existing list, and add something if it's clearly missing.  If it's not clear, talk it over in the team channel.  Err on the side of boldness; it's easy to merge them later if needed.  It's easier to merge things that are too finely distinguished than too separate things that were lumped together.

#### Changing Labels

A team member can edit the text, color or description of a label at anytime.  It's low stakes and non-destructive.

#### Removing labels

That is destructive.  If we're retiring a label, we should talk about it.

## A Bestiary of Labels

### Aspect

These labels reflect the aspects of the project as used by people: for example, Performance, Security, or UX.

### CLI

Directly indicates that the issue concerns an problem / feature request with the `inspec` executable.  Labels here refer to the specific subcommands.  This is a refinement of the `Component` group just for the CLI.

### Component

Refers to the major subsystems of Inspec.

### Platform

Refers to a problem specific to a particular platform.

### Release

Indicates that the issue is slated for a particular release, or to be backported.

### Status

Refers to the fate of the issue.  Note that Github handles Open/Closed for us; so we use this label group for things like marking a duplicate, or marking something "wontfix" (which we gently call "No Action").

### Type

Refers to the nature of the issue or PR: is it a Bug? A request for a new Feature?  This can be subjective in some cases.

### Uncategorized

Everything else.  Not everything has been ported over from the prior scheme.

