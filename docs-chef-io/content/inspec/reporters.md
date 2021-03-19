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

Introduced in Chef InSpec 1.51.6

A `reporter` is a facility for formatting and delivering the results of a Chef InSpec auditing run.

Chef InSpec allows you to output your test results to one or more reporters. Configure the reporter(s) using either the `--reporter` option or as part of the general config file using the `--config` (or `--json-config`, prior to v3.6) option. While you can configure multiple reporters to write to different files, only one reporter can output to the screen(stdout).

## Syntax

You can specify one or more reporters using the `--reporter` cli flag. You can also specify a output by appending a path separated by a colon.

Output json to screen.

```bash
inspec exec example_profile --reporter json
# or explicitly specifying output to STDOUT:
inspec exec example_profile --reporter json:-
```

Output yaml to screen

```bash
inspec exec example_profile --reporter yaml
# or
inspec exec example_profile --reporter yaml:-
```

Output cli to screen and write json to a file.

```bash
inspec exec example_profile --reporter cli json:/tmp/output.json
```

Output nothing to screen and write junit and html to a file.

```bash
inspec exec example_profile --reporter junit2:/tmp/junit.xml html:www/index.html
```

Output json to screen and write to a file. Write junit to a file.

```bash
inspec exec example_profile --reporter json junit2:/tmp/junit.xml | tee out.json
```

If you wish to pass the profiles directly after specifying the reporters you will need to use the end of options flag `--`.

```bash
inspec exec --reporter json junit2:/tmp/junit.xml -- profile1 profile2
```

If you are using the cli option `--config`, you can also set reporters.

Output cli to screen.

```json
{
    "reporter": {
        "cli" : {
            "stdout" : true
        }
    }
}
```

Output cli to screen and write json to a file.

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

## Supported Reporters

The following are the current supported reporters:

### cli

This is the basic text base report. It includes details about which tests passed and failed and includes an overall summary at the end.

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

### junit2

This reporter outputs the standard JUnit spec in XML format and is recommended for all new users of JUnit.

#### junit

This legacy reporter outputs nonstandard JUnit XML and is provided only for backwards compatibility.

### progress

This reporter is very condensed and gives you a `.`(pass), `f`(fail), or `*`(skip) character per test and a small summary at the end.

### json-rspec

This reporter includes all information from the rspec runner. Unlike the json reporter this includes rspec specific details.

### html

This reporter is the legacy RSpec HTML reporter, which is retained for backwards compatibility. The report generated is not aware of profiles or controls, and only contains unsorted test information. Most users should migrate to the `html2` reporter for more complete data.

### html2

This reporter is an improved HTML reporter that contains full data about the structure of the profile, controls, and tests. The generated report renders HTML code for viewing your tests in a browser.

The `html2` reporter requires no configuration to function. However, two options--`alternate_css_file` and `alternate_js_file`--are available for customization. The options are set in the JSON-formatted configuration file that Chef InSpec consumes. For details, see [our configuration file documentation](/inspec/config/).

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

Specifies the full path to the location of a CSS file that will be read and inlined into the HTML report. The default CSS will not be included.

#### alternate_js_file

Specifies the full path to the location of a JavaScript file that will be read and inlined into the HTML report. The default JavaScript will not be included. The JavaScript file should implement at least a `pageLoaded()` function, which will be called by the `onload` event of the HTML `body` element.

## Automate Reporter

The `automate` reporter type is a special reporter which will send its results over the network to [Chef Automate]({{< relref "/automate/">}}). To use this reporter you must pass in the correct configuration via a json config `--config`.

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

#### stdout

This will either suppress or show the automate report in the CLI screen on completion

#### url

This is your Automate 2 url. Append `data-collector/v0/` at the end.

#### token

This is your Automate 2 token. You can generate this token by navigating to the admin tab of A2 and then api keys.

### Optional fields

#### insecure

This will disable or enable the ssl check when accessing the Automate 2 instance.

#### node_name

This will be the node name which shows up in Automate.

#### node_uuid

This will be the node UUID which shows up in Chef Automate. Use a single static UUID
per node for all your reports. You must specify a `node_uuid` in the Chef InSpec
configuration file if running Chef InSpec outside of an audit cookbook or another
environment where a `chef_guid` or `node_uuid` is already known to Chef InSpec.

#### environment

This will set the environment metadata for Automate.

## JSON-Automate Reporter

The `json-automate` reporter is a special reporter that prepares the data format used by the Automate reporter. `json-automate` does not communicate on the network; rather it simply produces the JSON report format that Automate would be consuming. Notably, the report is based on the `json` reporter, with the following modifications:

 * Controls that appear in child profiles are de-duplicated by ID, merging up into the parent profile.
 * Child profiles are deleted, flattening the report.

The `json-automate` reporter is primarily used for internal needs, but some users may find it useful if they want a JSON based reporter that merges controls.
