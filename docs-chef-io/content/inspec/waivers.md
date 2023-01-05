+++
title = "Waivers"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Waivers"
    identifier = "inspec/reference/waivers.md Waivers"
    parent = "inspec/reference"
    weight = 140
+++

Waivers is a mechanism to mark controls as "waived" for various reasons, and to
control the running and/or reporting of those controls. A waiver file identifies:

1. which controls are waived
1. a description of why it is waived
1. (optionally) whether they should be skipped from running
1. (optionally) an expiration date for the waiver

## Usage

To use waivers, you must have a correctly formatted input file and
invoke `inspec exec` with `--waiver-file [path]`.

```bash
inspec exec path/to/profile --waiver-file waivers.yaml
```

## File Format

Waiver files support YAML, JSON & CSV format.

```yaml
control_id:
  expiration_date: YYYY-MM-DD
  run: false
  justification: "reason for waiving this control"
```

OR

```json
{
  "control_id": {
    "expiration_date": "YYYY-MM-DD",
    "run": false,
    "justification": "reason for waiving this control"
  }
}
```

- `expiration_date` sets the day that the waiver file will expire in YYYY-MM-DD format. Waiver files expire at 00:00 at the local time of the system on the specified date. Waiver files without an expiration date are permanent. `expiration_date` is optional.
- `run` is optional. If absent or true, the control will run and be
  reported, but failures in it won't make the overall run fail. If present and false, the control will not be run. You may use any of yes, no, true or false. To avoid confusion, it is good practice to explicitly specify whether the control should run.
- `justification` can be any text you want and might include a reason
  as well as who signed off on the waiver.

### Examples:

Example in YAML:

```yaml
waiver_control_1_2_3:
  expiration_date: 2019-10-15
  justification: Not needed until Q3. @secteam

xccdf_org.cisecurity.benchmarks_rule_1.1.1.4_Ensure_mounting_of_hfs_filesystems_is_disabled:
  expiration_date: 2020-03-01
  justification: "This might be a bug in the test. @qateam"
  run: false
```

Example in JSON:

```json
{
  "waiver_control_1_2_3": {
    "expiration_date": "2019-10-15T00:00:00.000Z",
    "justification": "Not needed until Q3. @secteam"
  },
  "xccdf_org.cisecurity.benchmarks_rule_1.1.1.4_Ensure_mounting_of_hfs_filesystems_is_disabled": {
    "expiration_date": "2020-03-01T00:00:00.000Z",
    "justification": "This might be a bug in the test. @qateam",
    "run": false
  }
}
```

Example in CSV:

These file formats support the following fields in a file:

* `control_id`
  _Required_.
* `justification`
  _Required_.
* `run`
  _Optional_.
* `expiration_date`
  _Optional_.

![Waiver File Example](/images/inspec/waivers_file_excel.png)