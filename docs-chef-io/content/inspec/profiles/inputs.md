+++
title = "Chef InSpec Inputs"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Inputs"
    identifier = "inspec/profiles/Inputs"
    parent = "inspec/profiles"
    weight = 60
+++

Inputs allow you to customize the behavior of Chef InSpec profiles.

In [_profiles that accept inputs_](#profile-support), you can configure them using the following methods:

- Inline in [control code](#control-code)
- In the [`inspec.yml` file](#inspecyml-file)
- In the command line using the [`--input` option](#input-cli-option)
- In an input file that's invoked with the CLI [`--input-file` option](#input-file-cli-option)
- In [input plugins](#plugins)

Profiles that include other profiles can set inputs in the included profile, enabling a multi-layered approach to configuring profiles.

## Profile support

Profiles accept inputs from any input method as long as one or both of the following conditions exists:

- inputs are listed in the [`inspec.yml` file](#inspecyml-file)
- inputs are included in the [control source code](#control-code)

## Simple example

Suppose you have a profile named `rock_critic` and its profile `inspec.yml` metadata file includes the following inputs:

```yaml
# Optionally declare inputs in the profile metadata
# This lets you set up things like type checking, etc.
inputs:
- name: amplifier_max_volume
  description: How loud the amplifiers can go
  type: numeric
  # More options, including value: and priority: are possible here
```

In the profile's control code, define the value of the input using the `input` function:

```ruby
# Set a default value for an input. This is optional.
input('amplifier_max_volume', value: 10)

control 'Big Rock Show' do
  describe input('amplifier_max_volume') do    # This line reads the value of the input
    it { should cmp 11 }                       # The UK'S LOUDEST BAND
  end
end
```

When the above profile is executed by using `inspec exec rock_critic`, you would see something like:

```bash
  ×  Big Rock Show: 10
     ×  10 is expected to cmp == 11

     expected: 11
          got: 10

     (compared using `cmp` matcher)
Profile Summary: 0 successful controls, 1 control failure, 0 controls skipped
```

The control fails because the value is set to `10`, but the control expects `11`.
That result clearly won't do.

By default, inputs set using the CLI `--input` option override inputs defined in control code.
So, you can set the `amplifier_max_volume` to `11` and the control will pass.

```sh
inspec exec rock_critic --input amplifier_max_volume=11
```

which returns:

```bash
  ✔  Big Rock Show: 11
     ✔  11 is expected to cmp == 11

Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
```

## Set inputs

You can set inputs using one or more of the following methods. Each method has a different priority allowing them to override each other. Some methods allow you to modify their priority. For more information, see the [input priority documentation](#input-priority).

### `--input` CLI option

Use the `--input` option to set inputs and values directly on the command line.

Inputs set with the `--input` option have a priority of 50.

```sh
inspec exec my_profile --input input_name=input_value
```

You can set multiple inputs.

```sh
inspec exec my_profile --input input_name1=input_value1 name2=value2
```

If a CLI input value resembles a number, it will be converted to an Integer or
Float. Scientific notation is not recognized.

```sh
inspec exec my_profile --input amplifier_volume=-11
inspec exec my_profile --input water_depth=11.5
```

You can set inputs with complex values, such as arrays and hashes using either
YAML or JSON syntax. Just be sure to protect the string from the shell using single
quotes.

```sh
inspec exec my_profile --input alphabet='[a,b,c]'
inspec exec my_profile --input fruits='{a: apples, b: bananas, c: cantelopes}'
inspec exec my_profile --input json_fruit='{"a": "apples", "g": ["grape01", "grape02"] }'
```

Do not repeat the `--input` flag; that will override the previous setting.

As of Chef InSpec 4.12, this mechanism has the following limitations:

- No [input options](#input-options) may be set---only the name and value.
- Because the CLI is outside the scope of any individual profile and the inputs
  don't take options, the inputs are clumsily copied into every profile,
  effectively making the CLI mechanism global.

### `--input-file` CLI option

You can set inputs and values with a YAML file in the command line.

Inputs set the `--input-file` option have a priority of 40.

Create a YAML file using the following format:

```yaml
an_input: a_value
another_input: another_value
```

Invoke the input file using the `--input-file` option.

```sh
inspec exec my_profile --input-file <FILENAME>.yml
```

As of Chef InSpec 4.3.2, this mechanism has the following limitations:

- No [input options](#input-options) may be set---only the name and value.
- Because the CLI is outside the scope of any individual profile and the inputs
  don't take options, the inputs are clumsily copied into every profile,
  effectively making the CLI mechanism global.

### inspec.yml file

In the [`inspec.yml` file](/inspec/profiles/inspec_yml), you may add a section for inputs.
You may define inputs there, clearly setting options including values, type checking, and whether the input is
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

All [input options](#input-options) are supported in metadata files.

Defining inputs in profile metadata has two major advantages:

- The inputs and their configuration are listed explicitly in simple YAML in one place - a consumer of your profile does not need to read through the control code to find the inputs.
- You can set inputs in other profiles that you depend on using profile inheritance.

#### Profile inheritance

When your profile relies on another profile using the `depends` key in the metadata file, you can set---that is, override---the value of the input in the dependent profile by including the `profile` option and naming the dependent profile.

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

In **Chef InSpec 4+**, every input is namespaced. For example, you could have an
input named `wrapper/favorite_food` and one named `child/favorite_food`. If no
explicit profile option is set within the `wrapper` profile metadata file, then
`wrapper` is assumed to be the profile.

### Control Code

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

#### Setting Inputs

When you write `input('some_name', value: 'some_value')`, you are *setting* an input value in the DSL.
Because the `value:` option is present, a new value will be set.
You may also pass any other option listed in the
[input option reference](#input-options).

#### Reading Inputs

When you call `input('some_name')`, with or without additional options, the value of the input will be resolved and returned.
Note that this process may involve sourcing the value from another provider, using the value set in DSL, or overriding
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

### Plugins

You can also set inputs using custom input plugins, which retrieve values from external sources like secret stores or databases. Please check [RubyGems.org](https://rubygems.org/) for available InSpec input plugins.

#### Disabling Caching

Especially with plugins, you may want to re-evaluate inputs every time and not cache them.
By default, an existing input value is reused which can lead to problems if the retrieved values are expected to change.
An example for this is using `kitchen-inspec` with input plugins to connect to a Vault server for password retrieval.

To disable input caching, you can disable the cache from your Ruby code:

```ruby
Inspec::InputRegistry.instance.cache_inputs = false
```


## Input options

`name`

: The input name.

  Required

  Date type: `String`.

  Allowed in: all input methods.

  When used in control code and `inspec.yml` file, the name is unique within the
  current profile. When used in CLI input files, and kitchen-inspec,
  the input is copied across all profiles using the same name.

`description`

: Human-meaningful explanation of the input.

  Optional

  Data type: `String`

  Allowed in: control code, `inspec.yml` file

`value`

: The value that will be available when you read the input.
  See the [Reading Inputs](#reading-inputs-in-control-dsl) section for more information.

  Optional

  Data type: any Ruby or YAML type

  Allowed in: all input methods.

`type`

: If provided, Inspec will check the value of the input to see if it's of the corresponding type.
  Note that `Regexp` indicates that the input value itself should be a regular expression, not that it should
  match any particular regular expression.

  Optional

  Data type: `String`

  Allowed values:

  - `String`
  - `Numeric`
  - `Regexp`
  - `Array`
  - `Hash`
  - `Boolean`
  - `Any`

  Allowed in: control code, `inspec.yml` file

`required`

: If `true`, a control using the input will be failed
  if it [reads](#reading-inputs) the value when none has been set.

  Optional

  Data type: Boolean

  Allowed values: `true` or `false`.

  Allowed in: control code, `inspec.yml` file

`priority`

: Higher values have higher precedence.
  For more information, see the [input priority documentation](#input-priority).

  Optional

  Data type: `Integer`

  Allowed values: 0-100

  Allowed in: control code, `inspec.yml` file

`profile`

: Optional

  Data type: `String`.

  Sets an input in another profile from your profile.

  Allowed in: control code, `inspec.yml` file

`sensitive`

: Optional

  Date type: `true` or `false`.

  If `true`, the value of the input will be used normally
  during the `exec` run, but the value will be obscured as "***" in the "inputs" or
  "attributes" section of any [Reporter](/inspec/reporters/) that explicitly lists
  inputs (the `json` reporter is one such reporter). Note that this will not obscure
  input values that are used as test results.

  Allowed in: `inspec.yml` file

`pattern`

: Validates the input by matching it with the provided regular expression.

  Optional

  Date type: `Regexp`.

  Allowed in: control code, `inspec.yml` file

## Input priority

The following table lists the *default* priority for input methods in order from highest priority (50) to lowest priority (20).

| Input Provider                          | Priority | May change priority |
| --------------------------------------- | -------- | ------------------- |
| CLI `--input` option                    | 50       |   No                |
| inspec-kitchen `inputs:` section        | 40       |   No                |
| CLI `--input-file` option               | 40       |   No                |
| `inspec.yml` file in a wrapper cookbook | 35       |   Yes               |
| `inspec.yml` file                       | 30       |   Yes               |
| Inline control code                     | 20       |   Yes               |

### Priority override

An input can have multiple assignments with varying priority values.
When Chef InSpec evaluates an input, it determines the input value by finding the setting event with the highest priority.

You can set a priority using the [`priority` option](#input-options) in the following input methods:

- `inspec.yml` metadata file
- Control code

For example, to set a priority of 50 in an `inspec.yml` metadata file, use:

```yaml
inputs:
- name: very_important_input
  value: 12
  priority: 50
```

To set a priority in control code, use:

```ruby
input('also_important', value: 42, priority: 45)
```

### Priority debugging

If it's difficult to determine why InSpec is using a particular priority value, you can use the Event Log to determine what is happening.

First, use the `input_object()` DSL method.
This method is like `input()` in that it looks up an input, but instead of evaluating the current value, it returns the underlying `Inspec::Input` object.

```ruby
puts input_object('troublesome_input').diagnostic_string
```

Or

```ruby
require 'pp'
pp input_object('troublesome_input').events
```

`diagnostic_string` assembles the Event Log into a printable log message for
convenience.

The Event Log contains entries for every time that the value changed, as well as
one for when the input was first created. When possible, stack probing is used
to determine file and line numbers. Most importantly, you will see priority numbers;
remember that highest priority wins; order only matters to break a tie.

## InSpec Attributes

When originally introduced, the Input facility was named *Attributes*. This name
was problematic, because:

- The Chef Infra tool uses the same word to describe its parameterization system.
- Chef Infra attributes have a completely different and much more complex precedence system.
- This caused confusion about passing Chef Infra attributes into InSpec when using Audit Cookbook and kitchen-inspec.

Based on these concerns, InSpec attributes have been renamed to InSpec inputs in Chef InSpec v4.

Support for using the DSL keyword `attribute()`, the metadata field `attributes:`, and the corresponding kitchen-inspec and audit cookbook values are anticipated to continue through Chef InSpec v5.
