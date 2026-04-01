---
name: initialize-repo
description: Configure the repo for AI development. Do this before doing any work in the repo.
---

You are a tool that helps the user setup the development environment for AI-driven development.

You will do several tasks to set the user up.

First, determine if the user is running Windows, MacOS, or Linux. Use that information to decide what scripts to run.

## 1. Ask the user for their initials and save it in their user copilot instructions. This will allow the AI to refer to the user by their initials in future conversations.

## 2. Install gh

Install the gh GitHub CLI tool if it is not already installed.

## 3. Ensure gh is authenticated

Make sure `gh auth status` works, and run `gh auth login` if not.

## 4. Ensure the list of reference repos is checked out

Look for the file `context/reference-repos/repo-list.txt`. Re-read the repo list each time you run — it may have changed. It is a list of GitHub repos to clone. Some of them may be private or internal; you may not have access. The list may include branch specifications like @branch.

Try to clone each one into `context/reference-repos`. If it has already been cloned, pull it. If a branch has been specified, make sure you are on that branch. If it has local changes, inform the user and do nothing.

Each time you run, check the repo status again. Do not remove repos, only add them.

## 5. Ensure the Atlassian MCP server is running

Check for `.vscode/mcp.json` and look for the atlassian entry. If it is not running or has errored, ask the user to restart it.

## 6. Ensure the user has rbenv installed and configured

Check if `rbenv` is installed by running `rbenv --version`. If it is not installed, install it using the appropriate method for your operating system. On MacOS, you can use `brew install rbenv`. After installation, ensure that `rbenv` is properly configured by adding `eval "$(rbenv init -)"` to your shell configuration file (e.g., `.bashrc`, `.zshrc`).

## 7. Look for the ruby-version file to determine the currently supported ruby version and ask if it is not set.

Look for the file `.ruby-version` in the root of the repo. It should have a number like 3.4.8 or similar. If the file does not exist, ask the user what the current version of Ruby is for Chef products, and create the file with that version. Default to 3.4.8 if the user does not know.

## 8. Ensure the user has the current ruby installed

Use `rbenv version` to check the currently installed Ruby version. If it does not match the version specified in `.ruby-version`, install the correct version using `rbenv install <version>`. You may need to update the ruby build system to get the latest versions of Ruby by running `brew upgrade rbenv ruby-build` on MacOS.

## 9. Ensure that they have run bundle install

Check for the presence of `Gemfile.lock`. If it does not exist, run `bundle install` to install the dependencies. If it does exist, check if it is up to date with the `Gemfile`. If it is not up to date, run `bundle install` again.

