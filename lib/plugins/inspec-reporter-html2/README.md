# inspec-reporter-html2 Plugin

An "improved" HTML output reporter specifically for Chef InSpec. Unlike the default `html` reporter (which is RSpec-based), this reporter knows about Chef InSpec structures like Controls and Profiles, and includes full metadata such as control tags, etc.

## To Install This Plugin

This plugins ships with Chef InSpec. There is no need to install it.

It should appear when you run:

```
you@machine $ inspec plugin list
```

## How to use this plugin

To generate an HTML report using this plugin and save the output to a file named `report.html`, run:

```
you@machine $ inspec exec some_profile --reporter html2:report.html
```

Note the `2` in the reporter name; if you omit it and run `--reporter html` instead, you will run the legacy RSpec HTML reporter.

## Developing This Plugin

This plugin is part of the Chef InSpec source code. While it has its own tests, the general contribution policy is dictated by the Chef InSpec project at https://github.com/inspec/inspec/blob/master/CONTRIBUTING.md


