+++
title = "Chef InSpec Audit Log"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Audit Log"
    identifier = "inspec/reference/audit_logging.md InSpec audit log"
    parent = "inspec/reference"
    weight = 60
+++

This page documents Chef InSpec's audit log. This is a preview feature starting in **Chef InSpec 6**.

The Chef InSpec audit log uses the Train library to capture activity between the scanning workstation and the scanned target environment.

The InSpec audit log captures the following event types:

- command events
- file use events

## Audit log limitations

The audit log has the following limitations:

- no support for API activity capture
- limited support for file operations: while file access is captured, specific operations may not be
- inconsistent and opt-in support across Train transports
- limited support for Test Kitchen

## Enable audit logging

The audit log is a preview feature in Chef InSpec 6.

Enable the audit logging by setting an environment variable, `CHEF_PREVIEW_AUDIT_LOGGING` to any non-empty value. The next time you run `inspec exec` or `inspec shell`, InSpec will create a log file at `~/.inspec/logs/inspec-audit-TIMESTAMP-PID.log`.

## Configure the audit log

The following options are available inside `inspec exec` and `inspec shell` to configure Chef InSpec's audit log.

`--audit-log-location=AUDIT_LOG_LOCATION`
: The directory that the audit log saves diagnostic log files to.

  Default: `~/.inspec/logs`.

  InSpec creates log files in the set directory using the following format: `inspec-audit-TIMESTAMP-PID.log`.

## More information

For details of the audit log format and implementation, refer to the (Train documentation)[https://github.com/inspec/train/blob/main/docs/audit_log.md].
