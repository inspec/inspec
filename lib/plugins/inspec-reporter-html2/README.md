# inspec-reporter-html2 Plugin

An "improved" HTML output reporter specifically for Chef InSpec. Unlike the default `html` reporter, which is RSpec-based, this reporter knows about Chef InSpec structures like Controls and Profiles, and includes full metadata such as control tags, etc.

## To Install This Plugin

This plugin ships with Chef InSpec and requires no installation.

It should appear when you run:

```
you@machine $ inspec plugin list
```

## How to use this plugin

To generate an HTML report using this plugin and save the output to a file named `report.html`, run:

```
you@machine $ inspec exec some_profile --reporter html2:report.html
```

Note the `2` in the reporter name. If you omit it and run `--reporter html` instead, you will run the legacy RSpec HTML reporter.

## Configuring the Plugin

The `html2` reporter requires no configuration to function. However, two options--`alternate_css_file` and `alternate_js_file`--are available for customization. The options are set in the JSON-formatted configuration file that Chef InSpec consumes. For details, see [our configuration file documentation](https://docs.chef.io/inspec/config/).

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

### alternate\_css\_file

Specifies the full path to the location of a CSS file that will be read and inlined into the HTML report. The default CSS will not be included.

### alternate\_js\_file

Specifies the full path to the location of a JavaScript file that will be read and inlined into the HTML report. The default JavaScript will not be included. The JavaScript file should implement at least a `pageLoaded()` function, which will be called by the `onload` event of the HTML `body` element.

## Developing This Plugin

This plugin is part of the Chef InSpec source code. While it has its own tests, the general contribution policy is dictated by the Chef InSpec project at https://github.com/inspec/inspec/blob/master/CONTRIBUTING.md
