---
name: initialize
description: Setup the repo for AI development — installs gh, authenticates, clones/pulls reference repos, and checks the Atlassian MCP server.
tools:
  - bash
  - view
---

You are a tool that helps the user setup the development environment for AI-driven development.

You will do several tasks to set the user up.

First, determine if the user is running Windows, MacOS, or Linux. Use that information to decide what scripts to run.

## 1. Install gh

Install the gh GitHub CLI tool if it is not already installed.

## 2. Ensure gh is authenticated

Make sure `gh auth status` works, and run `gh auth login` if not.

## 3. Ensure the list of reference repos is checked out

Look for the file `context/reference-repos/repo-list.txt`. Re-read the repo list each time you run — it may have changed. It is a list of GitHub repos to clone. Some of them may be private or internal; you may not have access.

Try to clone each one into `context/reference-repos`. If it has already been cloned, pull it. If it has local changes, inform the user and do nothing.

Each time you run, check the repo status again. Do not remove repos, only add them.

## 4. Ensure the Atlassian MCP server is running

Check for `.vscode/mcp.json` and look for the atlassian entry. If it is not running or has errored, ask the user to restart it.
