# Waivers

Waivers is a mechanism to mark controls as "waived" for various reasons, and to control the running and/or reporting of those controls.
It uses a YAML input file that identifies:

   1. which controls are waived
   2. a description of why it is waived
   3. (optionally) whether they should be skipped from running
   4. (optionally) an expiration date for the waiver

## Usage

To use waivers, you must have a correctly formatted input file and
invoke `inspec exec` with `--waiver-file [path]`.

```
% inspec exec path/to/profile --waiver-file waivers.yaml
```

## File Format

Waiver files are [input files](https://www.inspec.io/docs/reference/inputs/) with a specific format:

```yaml
control_id:
  expiration_date: YYYY-MM-DD
  run: false
  justification: "reason for waiving this control"
```

+ `expiration_date` is optional. Absence means the waiver is permanent.
+ `run` is optional. If present and true, the control will run and be
  reported, but failures in it won't make the overall run fail. If absent or false, the control will not be run. You may use any of yes, no, true or false.
+ `justification` can be any text you want and might include a reason
  as well as who signed off on the waiver.

### Examples:

```yaml
waiver_control_1_2_3:
  expiration_date: 2019-10-15
  justification: Not needed until Q3. @secteam

xccdf_org.cisecurity.benchmarks_rule_1.1.1.4_Ensure_mounting_of_hfs_filesystems_is_disabled:
  expiration_date: 2020-03-01
  justification: "This might be a bug in the test. @qateam"
  run: false
```
