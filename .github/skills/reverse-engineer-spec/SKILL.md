---
name: reverse-engineer-spec
description: Reverse engineer a specification for the codebase based on a feature description by examining code, tests, and documentation. Use this when asked to write a spec from a feature descripton of an existing feature.
---

Your goal is to write a specification file for a feature or cluster of features. The user will describe what is in scope for the spec, and you will reverse engineer the spec by examining the code, tests, and documentation. You should use your best judgment to determine what is relevant to the spec based on the user's description.

Write the spec to the path context/reference-repos/shared-context/by-repo/inspec/inspec/specifications/FEATURE.md, where FEATURE is a short name for the feature or cluster of features. The spec should be written in markdown format and should include the following sections:

```markdown
## Intent

## Background

## Relevant JIRA tickets

## Behavior

## Interfaces

## Test Fixtures and Example Data

## Existing Implementation Assumptions
```

You may not have enough information to fill out all sections of the spec, and that's okay. Fill out as much as you can based on the information you have, and make note of any assumptions or areas where you need more information.  

Do not include implementation details. The spec should be able to be used to generate a new implementation. Where implementation details are necessary to understand the behavior, try to abstract them away or note them as assumptions.

## Level of Detail

Write at the level of detail of functional or externally verifiable behavior. Do not include internal implementation details that are not observable from the outside. The spec should be detailed enough to understand the expected behavior and interfaces, but should not include code-level details.  If an interface is defined to other software, do explain and expand on it, but you should not be talking about code internals. 

## Intended Use

Specification files are intended to be used to capture the intent and behavior of a feture without specifying implementation. If the feature needs to be regenerated, it can be, without regard to previous implementation.

## Style Notes

Use links to JIRA tickets if possible.

Do not use **bold**.

Do not use _italics_.

Prefer bullet lists and number lists to tables.

Use code blocks for any code snippets, including example data and test fixtures.