+++
title = "Chef InSpec Inputs"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Inputs"
    identifier = "inspec/reference/inputs.md Inputs"
    parent = "inspec/reference"
    weight = 30
+++

## What are Inputs?

Inputs are the "knobs" you can use to customize the behavior of Chef InSpec profiles.
If a profile supports inputs, you can set the inputs in a variety of ways, allowing
flexibility.  Profiles that include other profiles can set inputs in the included
profile, enabling a multi-layered approach to configuring profiles.

### A Simple Example

Suppose you have a profile named `rock_critic`. In its profile metadata file (inspec.yml):

```yaml
# Optionally declare inputs in the profile metadata
# This lets you set up things like type checking, etc.
inputs:
- name: amplifier_max_volume
  description: How loud the amplifiers can go
  type: numeric
  # More options, including value: and priority: are possible here
```

In the profile's control code:

```ruby
# Set a default value for an input.  This is optional.
input('amplifier_max_volume', value: 10)

control 'Big Rock Show' do
  describe input('amplifier_max_volume') do    # This line reads the value of the input
    it { should cmp 11 } # The UK'S LOUDEST BAND
  end
end
```

When the above profile is executed by using `inspec exec rock_critic`, you would see something like:

```
  ×  Big Rock Show: 10
     ×  10 is expected to cmp == 11

     expected: 11
          got: 10

     (compared using `cmp` matcher)
Profile Summary: 0 successful controls, 1 control failure, 0 controls skipped
```

That result clearly won't do. Let's override the input's default value.

We can now run that profile with `inspec exec rock_critic --input amplifier_max_volume=11`:

```
  ✔  Big Rock Show: 11
     ✔  11 is expected to cmp == 11

Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
```

### Which profiles support inputs?

The best way for a profile to indicate it supports inputs is to list them in the
metadata file, `inspec.yml`. Any profile that has an `inputs` (or the deprecated
`attributes`) section in its `inspec.yml` metadata file is
[configuring](#configuring-inputs-in-profile-metadata) inputs.

That said, any profile that uses the DSL keyword `input()` (or the deprecated
`attribute()`) in the control source code supports inputs.  These profiles are
*reading* (and possibly setting) input values and using them to make decisions.

### How can I set Inputs?

As installed (without specialized plugins), Chef InSpec supports several ways of setting inputs:

- Inline in control code, using `input('input_name', value: 42)`.
- In profile `inspec.yml` metadata files
- Using the CLI option `--input name1=value1 name2=value2...` to read directly from the command line
- Using the CLI option `--input-file somefile.yaml` to read inputs from files
- In kitchen-inspec, using the `verifier/inputs` settings

In addition, Chef InSpec supports Input Plugins, which can provide optional integrations to specific key-value stores.

### How does Input precedence work?

#### Simple Precedence

Briefly:

inline DSL < metadata < ( cli-input-file or kitchen-inspec ) < cli --input

In addition, for inherited profiles:

dependent profile metadata < wrapper profile metadata

This precedence lets you override input values on the command line, as well as
override child profile inline values from the parent profile.
This description matches the general behavior of InSpec v3, while also making
some edge cases easier to reason.

#### The Details of Input Precedence

Whenever an input provider sets a value on an input, a *priority value* is
assigned to the operation.  Over the life of the input, multiple assignments with
varying priority values may occur. When the input is evaluated, the current value
is determined by finding the setting event with the highest priority.

Note that this approach does not rely on execution order, nor does it rely on
multiple named precedence levels. Each setting operation is preserved and this
allows the user to [debug](#debugging-inputs-with-the-event-log) the history of
the input values.

Some input providers allow you to set a priority when you set the value.  For
example, to set a priority of 50 in a metadata file, use:

```yaml
inputs:
- name: very_important_input
  value: 12
  priority: 50
```

To set a priority in DSL, use:
```ruby
input('also_important', value: 42, priority: 45)
```

As packaged, Chef InSpec uses the following priority values:

| Input Provider                         | Priority | May change priority |
| -------------------------------------- | -------- | ------------------- |
| Inline DSL                             | 20       |   Yes               |
| Metadata                               | 30       |   Yes               |
| Metadata in a wrapper cookbook         | 35       |   Yes               |
| CLI `--input-file` option              | 40       |   No                |
| inspec-kitchen `inputs:` section       | 40       |   No                |
| CLI `--input` option                   | 50       |   No                |

### What happened to "Attributes"?

When originally introduced, the Input facility was named *Attributes*. This name
was problematic, because:

- The Chef Infra tool uses the same word to describe its parameterization system.
- Chef Infra attributes have a completely different and much more complex precedence system.
- This caused confusion about passing Chef Infra attributes into InSpec when using Audit Cookbook and kitchen-inspec.

Based on these concerns, InSpec attributes have been renamed to InSpec inputs in Chef InSpec v4.

Support for using the DSL keyword `attribute()`, the metadata field `attributes:`, and the corresponding kitchen-inspec and audit cookbook values are anticipated to continue through Chef InSpec v5.

## Working with Inputs in Control Code

### Input Scope

Inputs are available throughout the InSpec profile DSL. You can use them anywhere.

```ruby
# some_controls.rb

input('outer_input', value: 1) # here

control 'control-1' do
  input('control_dsl_input', value: 2) # here too
  describe some_resource do
    input('test_dsl_input', value: 3) # even here
    it { should cmp input('expectation_dsl_input') } # and yes here too
  end
end
```

### Setting Inputs in Control DSL

When you write `input('some_name', value: 'some_value')`, you are *setting* an
input value in the DSL. Because the `value:` option is present, a new value will
be set.  You may also pass any other option listed in the
[input option reference](#input-options-reference).

### Reading Inputs in Control DSL

When you call `input('some_name')`, with or without additional options, the value
of the input will be resolved and returned. Note that this process may involve
sourcing the value from another provider, using the value set in DSL, or overriding
the value provided in the same call.

```ruby
# You can use the value in a Ruby variable
some_var = input('some_input_name')

# Or more directly in a resource parameter
describe file(input('important_path')) do
  it { should exist }
end

# Or as the resource itself (this could be a string, here)
describe input('some_setting') do
  it { should cmp 'correct_value' }
end

# Or as the expected value
describe file('/etc/httpd/httpd.conf') do
  its('owner') { should_not cmp input('webserver_user') }
end
```

The value returned can be used anywhere a Ruby value is used.

## Configuring Inputs in Profile Metadata

Each Chef InSpec profile has a metadata file at the top level named `inspec.yml`.
In that file, you may add a section for inputs. You may define inputs there,
clearly setting options including values, type checking, and whether the input is
required.

```yaml
name: my_profile
inputs:
- name: webserver_user  # Name is the only required field
- name: favorite_fruit
  value: banana         # You can set a value; priority is 30 for metadata
- name: meaning_of_life
  type: Numeric
  value: 42
  required: true
  priority: 70
  sensitive: true
```

All [input options](#input-options-reference) are supported in metadata files.

There are two major advantages to defining inputs in profile metadata:

1. The inputs and their configuration are listed explicitly in simple YAML in
one place - a consumer of your profile does not need to read through the control
code to find the inputs.
1. You can set inputs in other profiles that you depend on using profile inheritance.

### Using inputs with Profile inheritance

When your profile relies on another profile using the `depends` key in the metadata file, you can set — that is, override — the value of the input in the dependent profile by including the `profile` option and naming the dependent profile.


```yaml
# child inspec.yml
name: child
inputs:
- name: favorite_food
  value: pizza
```

```yaml
# wrapper inspec.yml
name: wrapper
depends:
- name: child
  path: ../child
inputs:
- name: favorite_food
  value: broccoli
  profile: child       # <----- REQUIRED to override the value in InSpec 4
```

In Chef InSpec 4+, every input is namespaced. For example, you could have an
input named `wrapper/favorite_food` and one named `child/favorite_food`. If no
explicit profile option is set within the `wrapper` profile metadata file, then
`wrapper` is assumed to be the profile.

## Setting Input values using `--input-file`

You may also provide inputs and values via YAML files on the command line. The
format can be seen below:

```yaml
an_input: a_value
another_input: another_value
```

CLI-input-file-set inputs have a priority of 40.

As of Chef InSpec 4.3.2, this mechanism has the following limitations:

1. No [input options](#input-options-reference) may be set - only the name and value.
1. Because the CLI is outside the scope of any individual profile and the inputs
   don't take options, the inputs are clumsily copied into every profile,
   effectively making the CLI mechanism global.

## Setting Input values using `--input`

You may also provide inputs and values directly on the command line:

```yaml
inspec exec my_profile --input input_name=input_value
```

To set multiple inputs, say:
```yaml
inspec exec my_profile --input input_name1=input_value1 name2=value2
```

If a CLI input value resembles a number, it will be converted to an Integer or
Float. Scientific notation is not currently recognized.

```yaml
inspec exec my_profile --input amplifier_volume=-11
inspec exec my_profile --input water_depth=11.5
```

You may set inputs with complex values, such as arrays and hashes using either
YAML or JSON syntax. Just be sure to protect the string from the shell using single
quotes.

```yaml
inspec exec my_profile --input alphabet='[a,b,c]'
inspec exec my_profile --input fruits='{a: apples, b: bananas, c: cantelopes}'
inspec exec my_profile --input json_fruit='{"a": "apples", "g": ["grape01", "grape02"] }'
```

Do not repeat the `--input` flag; that will override the previous setting.

CLI-set inputs have a priority of 50.

As of Chef InSpec 4.12, this mechanism has the following limitations:

1. No [input options](#input-options-reference) may be set - only the name and
   value.
1. Because the CLI is outside the scope of any individual profile and the inputs
   don't take options, the inputs are clumsily copied into every profile,
   effectively making the CLI mechanism global.

## Setting Input values using Plugins

Inputs can also be set by custom input plugins, which retrieve values from external sources like secret stores or databases. Please check [RubyGems.org](https://rubygems.org/) for available InSpec input plugins.

### Disabling Caching for Inputs

Especially with plugins, it can be desirable to re-evaluate inputs every time and not cache them. By default, an existing input value is reused which can lead to problems if the retrieved values are expected to change. An example for this is using `kitchen-inspec` with input plugins to connect to a Vault server for password retrieval.

To disable input caching, you can disable the cache from your Ruby code:

```ruby
Inspec::InputRegistry.instance.cache_inputs = false
```

## Input Options Reference

### Name

Required `String`. This option identifies the input.

Allowed in: All. When used in DSL and Metadata, the name is unique within the
current profile. When used in CLI input files, and kitchen-inspec,
the input is copied across all profiles using the same name.

### Description

Optional `String`. Human-meaningful explanation of the input.

Allowed in: DSL, Metadata

### Value

Optional, any Ruby or YAML type. This is the value that will be available when
you read the input. See the [Reading Inputs](#reading-inputs-in-control-dsl) section
for more information.

Allowed in: All

### Type

Optional, `String`. This value must be one of `String`, `Numeric`, `Regexp`,
`Array`, `Hash`, `Boolean`, or `Any`. If provided, the value of the input will
be checked to see if it is of the corresponding type. Note that `Regexp` indicates
that the input value itself should be a regular expression, not that it should
match any particular regular expression.

Allowed in: DSL, Metadata

### Required

Optional, `true` or `false`. If `true`, a control using the input will be failed
if it [reads](#reading-inputs-in-control-dsl) the value when none has been set.

Allowed in: DSL, Metadata

### Priority

Optional, `Integer`, 0-100. Higher values make this assignment have higher
precedence. This is an advanced feature.

Allowed in: DSL, Metadata

### Profile

Optional, `String`. Allows you to set an input in another profile from your profile.

Allowed in: DSL, Metadata

### Sensitive

Optional, `true` or `false`. If `true`, the value of the input will be used normally
during the `exec` run, but the value will be obscured as "***" in the "inputs" or
"attributes" section of any [Reporter](/inspec/reporters/) that explicitly lists
inputs (the `json` reporter is one such reporter). Note that this will not obscure
input values that are used as test results.

Allowed in: Metadata

### Pattern

Optional, `Regexp`. This feature validates the input by matching it with the provided regular expression.

Allowed in: DSL, Metadata

## Advanced Topics

### Debugging Inputs with the Event Log

If it is difficult to determine why a particular value is being used, you can use
the Event Log to determine what is happening.

First, use the `input_object()` DSL method. This method is like `input()` in that
it looks up an input, but instead of evaluating the current value, it returns
the underlying `Inspec::Input` object.

```ruby
puts input_object('troublesome_input').diagnostic_string

# Or
require 'pp'
pp input_object('troublesome_input').events
```

`diagnostic_string` assembles the Event Log into a printable log message for
convenience.

The Event Log contains entries for every time that the value changed, as well as
one for when the input was first created. When possible, stack probing is used
to determine file and line numbers. Most importantly, you will see priority numbers;
remember that highest priority wins; order only matters to break a tie.
