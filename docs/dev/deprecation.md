# Centralized Deprecation Facility

## Overview

The centralized deprecation facility is used to deprecate (retire, withdraw, etc) features both within InSpec core code, InSpec core resources, plugins, and custom resources.

The most important goal of the deprecation facility was to collect decisions about what actions should be taken for a deprecation in a central place, so that it is easier to handle major version changes.

### Example

```
# In some code in Inspec core
def something_crufty
  Inspec.deprecate :old_feature, 'Don't call something_crufty anymore'
end
```

If that gets called, inspec will consult the deprecation configuration, and then execute one of four actions: warn, fail_control, exit, or ignore.

## Concepts

### Basic Concept: Anti-Feature Flags

In many applications, `feature flags` are used to deploy new feature code, without actually revealing it to the user.  When certain conditions are met, the deployment team enables the flags, and the feature goes live.

Inverting this idea, we could use flags to withdraw features. For example, if we wish to retire the `lusers` property on the `shadow` resource, we might add:

```
# In lib/resources/shadow.rb
def lusers
  Inspec.deprecate :old_shadow_fields, 'Please use the `users` property instead.'
end
```

Then, in `etc/deprecations.json` in version 3.5, we might add:
```
  "groups": {
    "old_shadow_features": { "action": "ignore" }
  }
```

This makes the deprecation silent - it is there and ready to be triggered, but has no effect yet.  We can add more deprecation declarations, using the `old_shadow_features` group.  Then, when we decide that we'll start warning about it in v4.0 and withdraw it in v5.0, we can simply change the config file - we don't have to change every deprecation:

For v4:
```
  "groups": {
    "old_shadow_features": { "action": "warn", "suffix": "Certain properties of shadow will be withdrawn in InSpec v5.0" }
  }
```

Now, a warning (fed through Inspec::Log.warn) will appear each time the property is accessed, but it will otherwise behave normally.

For v5, you have some choices as to how to harden the deprecation.  `fail_control` will fail any control the deprecation is used in; while `exit` will exit the inspec run entirely.

For v5:
```
  "groups": {
    "old_shadow_features": { "action": "exit", "suffix": "Certain properties of shadow were deprecated in v4 and have now been removed in v5." }
  }
```

Again, no need to update the deprecation calls; though in v6 it might make sense to remove the old code entirely.


### Groups

When you make a deprecation message, you add it to a group. InSpec will read the file `$INSPEC_INSTALL_ROOT/etc/deprecation.json` to determine the known groups - you may add to that file at any time.

If you make a deprecation using a group that is unknown, InSpec will by default treat it as a warning.  You can change that behavior by setting the "unknown_group_action" top-level property to any of the valid actions.

There are no restrictions on the number or the naming of groups; you can have as many or as few as needed.

### Message Assembly

For all actions except `ignore`, a message is assembled, consisting of:

 * The string 'DEPRECATION'
 * The value of the `prefix` field of the group, if any
 * The specific message provided by the deprecation declaration
 * The value of the `suffix` field of the group, if any
 * If possible, the string '(used at ' followed by a `path/file.rb:lineno` to help the user locate the deprecation in *their code*.

### Actions

#### exit

Issues an ERROR via Inspec::Log.error with the assembled message, then immediately exits the process via Inspec::UI. The reporters are not executed.  By default, the exit code will be 3; but you can set a different code using the `exit_status` property of the group in the config file.

#### fail_control

Checks to see if the code is being called within a control block; if so, raises a FailedResource exception with the assembled message, which causes the control to fail in the reporter.

If the code is outside a control, the `warn` action is triggered instead.

#### ignore

Does nothing; this is very useful for staging deprecations - you can have the deprecations in place, then enable them later.

#### warn

Issues a WARN to the Inspec::Log.warn facility with the assembled message.
