# GitHub Copilot Instructions for InSpec

## Project Overview

InSpec is an open-source infrastructure testing framework written in Ruby. It provides a domain-specific language (DSL) for describing security and compliance rules that can be shared between software engineers, operations, and security engineers.

## Additional Context Required

VERY IMPORTANT: If `context/reference-repos/shared-context/chef-global/standards` does not exist, abort the requested task immediately and do not attempt to continue. Insist the user run the initialize agent if at the CoPilot CLI, or run the /initialize prompt if in the VSCode chat.

To get started with AI-driven development, you must initialize the repo with the `initialize` agent or /initialize prompt. This will set up your environment, clone reference repos, and ensure you have the necessary tools installed. The remainder of this document assumes you have done this.

For more details about this project and where it fits in to our universe, see:
- Domain knowledge: `context/reference-repos/shared-context/*/domains`

## Project Background

Examine the `context/reference-repos/shared-context/*/background/` files to understand the details of the project, critical functionality, and peculiarities of the codebase. Load those files as needed when working on specific areas of the code, but don't load them unless specifically needed to avoid overwhelming your context.

Additionally, this project has additional developer documentation located at `dev-docs/` that is in-depth about certain topics.

## Workflow

Nearly all tasks should follow the workflow outlined in `context/reference-repos/shared-context/chef-global/standards/workflow.md`, which provides a step-by-step guide for analysis, implementation, testing, committing code, and creating pull requests.

Exceptions to this: exploration, experimentation,  and analysis tasks may deviate from this workflow, but any implementation work should adhere to it, and you may also write to temporary files without spec or JIRA. Exploratory and experimental work must be on a branch named `throwaway/*` and the branch should be deleted after the work is complete.

## Project Standards

See `context/reference-repos/shared-context/chef-global/standards/` for the organization's coding standards, including naming conventions, code formatting guidelines, tooling standards, and other best practices. Adhere to these standards in all code contributions.