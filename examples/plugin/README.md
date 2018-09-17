# InSpec Plugin Example - Resource Lister

This plugin provides an example of building a plugin for use with [InSpec](https://inspec.io). Its functionality is simple, but useful: list resources included with InSpec.

## To Install this as a User

You will need InSpec v2.3 or later.

If you just want to use this (not learn how to write a plugin), you can so by simply running:

```
you@machine $ inspec plugin install inspec-resource-lister
```

You can then run:

```
you@machine $ inspec plugin help resource-lister
# ... Usage info

you@machine $ inspec plugin resource-lister ../some-profile

Resources found:
  13 aws_security_group
   2 json

15 controls total.
```

## Development of a Plugin

[Plugin Development]() is documented on the InSpec website.  Additionally, this example plugin has extensive comments explaining what is happening, and why.

### A Tour of the Plugin

One nice circuit of the plugin might be:
 * look at the gemspec, to see what the plugin thinks it does
 * look at the functional tests, to see the plugin proving it does what it says
