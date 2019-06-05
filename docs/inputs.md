# Chef InSpec Inputs

## What are Inputs?

Inputs are the "knobs" you can use to customize the behavior of Chef InSpec profiles. If a profile supports Inputs, you can set the inputs in a variety of ways, allowing flexibility.  Profiles that include other profiles can set inputs in the included profile, enabling a multi-layered approach to configuring profiles.

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
    it { should eq 11 } # The UK'S LOUDEST BAND
  end
end
```

When the above profile is executed, using (say) `inspec exec rock_critic`, you would see something like:

```
  11
     ×  should eq 10

     expected: 10
          got: 11

     (compared using ==)
Test Summary: 0 successful, 1 failure, 0 skipped
```

That clearly won't do; let's override that. Create a file, `custom_amps.yml`:

```yaml
amplifier_max_volume: 11
```

We can now run that with `inspec exec rock_critic --input_file custom_amps.yaml`:

```
  11
     ✔  should eq 11

Test Summary: 1 successful, 0 failures, 0 skipped
```

### Which profiles support Inputs?

The best way for a profile to indicate it supports inputs is to list them in the metadata file, `inspec.yml`. Any profile that has an `inputs` (or the deprecated `attributes`) section in its `inspec.yml` metadata file is [configuring](TODO - link) (and likely setting) inputs.

That said, any profile that uses the DSL keyword `input()` (or the deprecated `attribute()`) in the control source code supports inputs.  These profiles are *reading* (and possibly setting) Input values and using them to make decisions.

### How can I set Inputs?

As installed (without specialized plugins), Chef InSpec supports five ways of setting Inputs:

 * Inline in control code, using `input('input_name', value: 42)`.
 * In profile `inspec.yml` metadata files
 * Using the CLI option `--input-file somefile.yaml`
 * In kitchen-inspec, using the `verifier/inputs` settings (TODO - verify)
 * In the Audit Cookbook, using the `node[:audit][:inputs]`

In addition, Chef InSpec supports Input Plugins, which provide optional integrations to specific key-value stores. (TODO - mention new plugins)

### How does Input precedence work?

#### Simple Precedence

Briefly,

( cli-input-file or kitchen-inspec or audit-cookbook ) > metadata > inline DSL

In addition, for inherited profiles,

wrapper metadata > dependency metadata

This lets you override input values on the command line, as well as override child profile inline values from the parent profile.
This matches the general behavior of InSpec v3, while also making some edge cases easier to reason about.

#### The Details of Input Precedence

Whenever an input provider sets a value on an input, a *priority value* is assigned to the operation.  Over the life of the input, multiple assignments, with varying priority values, may occur. When the input is evaluated, the current value is determined by finding the setting event with the highest priority.

Note that this approach does not rely on execution order, nor does it rely on multiple named precedence levels. Each setting operation is preserved; this allows

Some input providers allow you to set a priority when you set the value.  For example, to set a priority of 50 in a metadata file, use:

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
| audit cookbook `node[:audit][:inputs]` | 40       |   No                |


### What happened to "Attributes"?

When originally introduced, the Input facility was named *Attributes*. This name was problematic, as the Chef Infra Client tool uses the same word to describe its parameterization system.

 * Chef attributes have a completely different and much more complex precedence system
 * Confusion about passing Chef Attributes into InSpec when using Audit Cookbook and kitchen-inspec

Based on these concerns, InSpec Attributes have been renamed to InSpec Inputs in Chef InSpec v4.

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
    it { should cmp input('expectation_dsl_input') } #
  end
end
```

### Setting Inputs in Control DSL

When you write `input('some_name', value: 'some_value')`, you are *setting* an input value in the DSL. Because the `value:` option is present, a new value will be set.  You may also pass any other option listed in the [input option reference](link TODO).

### Reading Inputs in Control DSL

When you call `input('some_name')`, with or without additional options, the value of the input will be resolved and returned. Note that this may involve sourcing the value from another provider, or overriding the value provided in the same call.

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

### Using inputs with Profile inheritance

## Setting Input values using `--input-file`

## Input Options Reference

### Name

Required `String`. This identifies the Input.

Allowed in: All. When used in DSL and Metadata, the name is unique with the current profile; when used in CLI input files, audit cookbook, and kitchen-inspec, the input is copied across all profiles using the same name.

### Value

Optional, any Ruby or YAML type. This is the value that will be available when you read the input. See [Reading Inputs](TODO - LINK).

Allowed in: All

### Type

Optional, `String`, one of `String`, `Numeric`, `Regexp`, `Array`, `Hash`, `Boolean`, or `Any`. If provided, the value with be checked to see if it is of the corresponding type. Note that `Regexp` indicates that the value itself should be a regular expression, not that it should match any particular one.

Allowed in: DSL, Metadata

### Required

Optional, `true` or `false`. If `true`, a control using the input will be failed if it [reads](TODO - LINK) the value when none has been set.

Allowed in: DSL, Metadata

### Priority

Optional, `Integer`, 0-100. Higher values make this assignment have higher precedence. This is an advanced feature.

Allowed in: DSL, Metadata

### Profile

Optional, `String`. Allows you to set an input in another profile from your profile.

Allowed in: DSL, Metadata

## Advanced Topics

### Debugging Inputs with the Event Log

TODO