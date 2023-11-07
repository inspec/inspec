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

This page documents Chef InSpec's Audit Logging feature introduced in preview in InSpec 6.

## Usage

## Why Audit logs?

The Chef InSpec Audit Log is intended to capture a portion of the activity between the scanning workstation and the scanned target environment. Audit Logging is provided by the underlying connectivity library, Train.

Generally, Train is aware of three types of activities: Commands, File accesses, and API accesses. Audit Logging attempts to capture these activities, with some significant limitations in preview phase.

### Limitations of Audit Logging in InSpec 6 Preview

Audit Logging, currently in preview, as implemented in InSpec 6 and Train 4 has the following limitations:

 * No support for Test Kitchen or Chef Infra Compliance Phase
 * No support for API activity capture
 * Limited support for File operations: while file accesses will be captured, the specific operation may not.
 * Inconsistent and opt-in support across Train transports.

## Enabling Audit Logging

Audit Logging is a preview feature in Chef InSpec 6. Enable Audit Logging by setting an environment variable, `CHEF_PREVIEW_AUDIT_LOGGING` to any non-empty value. The next time you run `inspec exec` or `inspec shell`, the file `~/.inspec/logs/inspec-audit.log.TIMESTAMP.PID` will be created.

## Details of the Audit Log

For details of the Audit Log format and implementation, please refer to the (Train documentation)[https://github.com/inspec/train/blob/main/docs/audit_log.md].

## InSpec CLI options to configure the Audit log

The following options are available inside `inspec exec` and `inspec shell` to configure Chef InSpec's audit log.

`--audit-log-location=AUDIT_LOG_LOCATION`
: Audit log location to send diagnostic log messages to (default: '~/.inspec/logs/inspec-audit.log'). This value will have a unique suffix appended for each run.
