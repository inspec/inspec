# Parallel Plugin

Plugin to handle parallel InSpec scan operations over multiple targets.

## parallel cli_command

Implements the `inspec parallel exec` CLI command.

## child-status Plugin

This reporter is an InSpec Streaming Reporter. It is used internally by inspec parallel to provide status updates on child processes.

### What This Plugin Does

For each control executed, after it is complete, the plugin emits a line to STDOUT like:
```
12/P/24/Control Title Here
```
When the run is complete, the single line 'EOF_MARKER' is emitted.

Where:

 - 12 is the number of the control (12th seen out of all controls in all profiles)
 - P indicates that it Passed (Also F = Failed, S = Skipped, E = Errored)
 - 24 is the total number of controls in the run
 - "Control Title Here" is the title (or if title is missing, id) of the last executed control

