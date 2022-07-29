+++
title = "Chef InSpec Reporters"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Reporters"
    identifier = "inspec/reference/reporters.md Reporters"
    parent = "inspec/reference"
    weight = 50
+++

A `reporter` is a facility for formatting and delivering the results of a Chef InSpec auditing run. It is introduced in Chef InSpec 1.51.6.

Chef InSpec allows you to output your test results to one or more reporters.

Configure the reporter(s) using either the `--reporter` option or as part of the general config file using the `--config` (or `--json-config`, prior to v3.6) option. While you can configure multiple reporters to write to different files, only one reporter can output to the screen(stdout).

## Syntax

You can specify one or more reporters using the `--reporter` CLI flag. You can also specify an output by appending a path separated by a colon.

**Output json to screen**

```bash
inspec exec example_profile --reporter json
# or explicitly specifying output to STDOUT:
inspec exec example_profile --reporter json:-
```

**Output yaml to screen.**

```bash
inspec exec example_profile --reporter yaml
# or
inspec exec example_profile --reporter yaml:-
```

**Output cli to screen and write json to a file.**

```bash
inspec exec example_profile --reporter cli json:/tmp/output.json
```

**Output nothing to screen and write jUnit and HTML to a file.**

```bash
inspec exec example_profile --reporter junit2:/tmp/junit.xml html:www/index.html
```

**Output json to screen and write to a file. Write jUnit to a file.**

```bash
inspec exec example_profile --reporter json junit2:/tmp/junit.xml | tee out.json
```

If you wish to pass the profiles directly after specifying the reporters, you must use the end of options flag `--`.

```bash
inspec exec --reporter json junit2:/tmp/junit.xml -- profile1 profile2
```

Using the CLI option `--config`, you can also set reporters.

**Output cli to screen.**

```json
{
    "reporter": {
        "cli" : {
            "stdout" : true
        }
    }
}
```

**Output cli to screen and write json to a file.**

```json
{
    "reporter": {
        "cli" : {
            "stdout" : true
        },
        "json" : {
            "file" : "/tmp/output.json",
            "stdout" : false
        }
    }
}
```

**Output real-time progress to screen with a progress bar.**

```bash
inspec exec example_profile --reporter progress-bar
```

## Reporter Options

The following are CLI options that are used to modify reporter behavior. Many of these options allow you to limit the report size because some reporters (such as the json-automate reporter) limit on the total size of the report that can be processed.

`--diff`, `--no-diff`

: Include a `diff` comparison of textual differences in the failed test output (default: `true`).

: Use `--no-diff` to limit the size of the report output when tests contain large amounts of the text output.

`--filter-empty-profiles`

: Remove empty profiles (those containing zero controls, such as resource packs) from the reporter's output.

`--reporter-backtrace-inclusion`, `--no-reporter-backtrace-inclusion`

: Include a code backtrace in report data (default: `true`).

: The `--no-reporter-backtrace-inclusion` option may be used to limit report size when large code stack traces are present in the output.

`--reporter-include-source`

: (CLI reporter only) Include full source code of controls in the report.

`--reporter-message-truncation=N`

: Number of characters to truncate failure messages in report data (default: no truncation).

: This may be used to limit the size of reports when failure messages are exceptionally large.

`--enhanced-outcomes`

: Includes enhanced outcome of controls in report data.

: The control level status outcomes are `Passed`, `Failed`, `Not Applicable (N/A)`, `Not Reviewed (N/R)`, or `Error (ERR)`.

: Only supported for CLI, progress-bar, html2, json, json-automate, automate, and yaml reporters.

## Supported Reporters

The following are the currently supported reporters:

### CLI

This is the basic text base report. It includes details about tests that passed and failed and an overall summary at the end.

### json

This reporter includes all information about the profiles and test results in standard JSON format. You may optionally pass through arbitrary structured JSON data by setting a JSON configuration with the `--config` parameter.

For example:

```json
{
    "reporter": {
      "json": {
        "stdout": true,
        "passthrough": {
          "a": 1,
          "b": false
        }
      }
    }
}
```

### json-min

This reporter is a redacted version of the json and only includes test results.

### yaml

This reporter includes all information about the profiles and test results in standard yaml format.

### documentation

This reporter is a very minimal text base report. It shows you which tests passed by name and has a small summary at the end.

### jUnit2

This reporter outputs the standard JUnit spec in XML format and is recommended for all new users of JUnit.

#### jUnit

This legacy reporter outputs nonstandard JUnit XML and is provided only for backward compatibility.

### progress

This reporter is very condensed and provides you a `.`(pass), `f`(fail), or `*`(skip) character per test and a small summary at the end.

### progress-bar

This reporter outputs the real-time progress of a running InSpec profile using a progress bar and prints the running control's ID with an indicator of the control's status (`Passed`, `failed`, or `skipped`).

For example:

![Progress Bar Reporter Outcome](/images/inspec/reporter_outcome_progress_bar.png)

And reporter outcome with `--enhanced-outcomes` option:

![Progress Bar Reporter Outcome with enhanced outcomes](/images/inspec/reporter_outcome_progress_bar_enhanced_outcomes.png)

### json-rspec

This reporter includes all information from the Rspec runner. Unlike the json reporter, this includes Rspec-specific details.

### HTML

This reporter is the legacy RSpec HTML reporter retained for backward compatibility. The report generated is unaware of profiles or controls and only contains unsorted test information. Most users should migrate to the `html2` reporter for more complete data.

### HTML2

This reporter is an improved HTML reporter that contains full data about the structure of the profile, controls, and tests. The generated report renders HTML code for viewing your tests in a browser.

The `html2` reporter requires no configuration to function. However, options `--alternate_css_file` and `alternate_js_file--` are available for customization. The options are set in the JSON-formatted configuration file that Chef InSpec consumes.

For details, see [our configuration file documentation](/inspec/config/).

For example:

```json
{
  "version": "1.2",
  "plugins": {
    "inspec-reporter-html2": {
      "alternate_js_file":"/var/www/js/my-javascript.js",
      "alternate_css_file":"/var/www/css/my-style.css"
    }
  }
}
```

#### alternate_css_file

Specifies the full path to the location of a CSS file that is read and inlined into the HTML report. The default CSS is not included.

#### alternate_js_file

Specifies the full path to the location of a JavaScript file that is read and inlined into the HTML report. The default JavaScript is included. The JavaScript file should implement at least a `pageLoaded()` function, which is called by the `onload` event of the HTML `body` element.

## Automate Reporter

The `automate` reporter type is a special reporter which sends its results over the network to [Chef Automate]({{< relref "/automate/">}}). To use this reporter, you must pass in the correct configuration via a json config `--config`.

Example config:

```json
{
    "reporter": {
        "automate" : {
            "stdout" : false,
            "url" : "https://YOUR_A2_URL/data-collector/v0/",
            "token" : "YOUR_A2_ADMIN_TOKEN",
            "insecure" : true,
            "node_name" : "inspec_test_node",
            "environment" : "prod"
        }
    }
}
```

### Mandatory fields

`stdout`
: Either suppress or shows the automate report in the CLI screen on completion.

`url`
: Automate 2 url. Append `data-collector/v0/` at the end.

`token`
: Automate 2 tokens. You can generate this token by navigating to the **admin** tab of A2 and then clicking **API keys**.

### Optional fields

`insecure`
: Disables or enables the SSL check when accessing the Automate 2 instance.

`node_name`
: Node name which shows up in Automate.

`node_uuid`
: Node UUID, which shows up in Chef Automate. Use a single static UUID per node for all your reports. You must specify a `node_uuid` in the Chef InSpec configuration file if running Chef InSpec outside of an audit cookbook or another environment where a `chef_guid` or `node_uuid` is already known to Chef InSpec.

`environment`
: Sets the environment metadata for Automate.

## JSON-Automate Reporter

The `json-automate` reporter is a special reporter that prepares the data format used by the Automate reporter. `json-automate` does not communicate on the network; instead, it simply produces the JSON report format that Automate would be consuming. Notably, the report is based on the `json` reporter, with the following modifications:

- Controls appearing in child profiles are de-duplicated by ID, merging into the parent profile.
- Child profiles are deleted, flattening the report.

The `json-automate` reporter is primarily used for internal needs, but some users may find it helpful if they want a JSON-based reporter that merges controls.
