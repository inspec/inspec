+++
title = "InSpec Audit Logging"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "InSpec Audit Logging"
    identifier = "inspec/reference/audit_logging.md InSpec Audit Logging"
    parent = "inspec/reference"
    weight = 60
+++

This page documents the InSpec's Audit Logging feature introduced in InSpec 6

## Usage

## Why Audit logs?

Audit logging is introduced to log commands that are executed or file operations that are happening on the target system when the User runs the `inspec exec` or `inspec shell` command. This feature is currently in the beta phase and has a limited logging mechanism. It also logs the Host and User information for some of the executions.

## How Audit logging feature can be enabled and for which InSpec commands?

To enable this feature, set the environment variable `CHEF_PREVIEW_AUDIT_LOGGING` to any non-empty value. The next time you run an InSpec scan using `inspec exec` or `inspec shell` it will create the audit log file `inspec-audit.log` inside the InSpec's default audit log location `~/.inspec/logs/`.

## InSpec CLI options to configure the Audit log

Following are the options available inside `inspec exec` and `inspec shell` to configure the InSpec's audit log.

`--audit-log-location=AUDIT_LOG_LOCATION`
: Audit log location to send diagnostic log messages to (default: '~/.inspec/logs/train-audit.log').

`--audit-log-size=N`
: Set audit log file size in bytes.(default: 2097152)

`--audit-log-frequency=AUDIT_LOG_FREQUENCY`
: Set audit log rotation frequency: daily(default), weekly, monthly (default: daily)
