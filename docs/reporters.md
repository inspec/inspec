---
title: InSpec Reporters
---

# InSpec Reporters

Introduced in InSpec 1.51.6

InSpec allows you to output your test results to one or more reporters. You can configure the reporter(s) using either the `--json-config` option or the `--reporter` option. While you can configure multiple reporters to write to different files, only one reporter can output to the screen(stdout).

## Syntax

You can specify one or more reporters using the `--reporter` cli flag. You can also specify a output by appending a path seperated by a colon.

Output json to screen.

```bash
inspec exec --reporter json
or
inspec exec --reporter json:-
```

Output cli to screen and write json to a file.

```bash
inspec exec --reporter cli json:/tmp/output.json
```

Output nothing to screen and write junit and html to a file.

```bash
inspec exec --reporter junit:/tmp/junit.xml html:www/index.html
```

Output json to screen and write to a file. Write junit to a file.

```bash
inspec exec --reporter json junit:/tmp/junit.xml | tee out.json
```

If you are using the cli option `--json-config` you can also set reporters.

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

This reporter includes all information about the profiles and test results in standard json format.

### json-min

This reporter is a redacted version of the json and only includes test results.

### documentation

This reporter is a very minimal text base report. It shows you which tests passed by name and has a small summary at the end.

### junit

This reporter outputs the standard junit spec in xml format.

### progress

This reporter is very condensed and gives you a `.`(pass), `f`(fail), or `*`(skip) character per test and a small summary at the end.

### json-rspec

This reporter includes all information from the rspec runner. Unlike the json reporter this includes rspec specific details.

### html

This renders html code to view your tests in a browser. It includes all the test and summary information.
