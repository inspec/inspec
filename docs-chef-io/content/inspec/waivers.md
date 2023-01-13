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

Waivers allow you to waive controls and to dictate the running and/or reporting of those controls. A waiver file identifies:

1. which controls are waived
1. a description of why it is waived
1. (optionally) whether they should be skipped from running
1. (optionally) an expiration date for the waiver

## Usage

Chef InSpec supports waiver files in YAML, JSON, or CSV file formats.

To use a waiver file, invoke `inspec exec` with `--waiver-file [path]`. For example:

```bash
inspec exec path/to/profile --waiver-file waivers.yaml
```

## Parameters

Specify the following parameters in the waiver file:

`control_id` **required**
: The ID of the control to be waived.

`expiration_date` **optional**
: The expiration date of the waiver file in YYYY-MM-DD format. Waiver files expire at 00:00 at the local time of the system on the specified date. Waiver files without an expiration date are permanent.

`run` **optional**
: If absent, `true`, or `yes`, the control will run and be
  reported, but failures in the control won't make the overall run fail. If `false` or `no`, the control will not run. You may use any of `yes`, `no`, `true`, or `false`. To avoid confusion, you should explicitly specify whether the control should run or not.

`justification` **required**
: A description of the waiver. This might include a reason for the waiver or the person who signed off on the waiver.

### Examples

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

| control_id                                                                                  | justification                            | run   | expiration_date          |
|---------------------------------------------------------------------------------------------|------------------------------------------|-------|--------------------------|
| waiver_control_1_2_3                                                                        | Not needed until Q3                      | TRUE  | 2019-10-15T00:00:00.000Z |
| xccdf_org.cisecurity.benchmarks_rule_1.1.1.4_Ensure_mounting_of_hfs_filesystems_is_disabled | This might be a bug in the test. @qateam | FALSE | 2020-03-01T00:00:00.000Z |
