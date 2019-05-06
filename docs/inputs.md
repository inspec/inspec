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
  describe input('amplifier_max_volume') do
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

TODO - add proposed input listing CLI tool here

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

####

Briefly,

{ cli input-file, kitchen-inspec, audit-cookbook } > metadata > inline DSL

In addition, for inherited profiles,

wrapper metadata > dependency metadata

This lets you override input values on the command line, as well as override child profile inline values from the parent profile.
This matches the general behavior of InSPec v3, while also making some edge cases easier to reason about.

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

## Input Options

### Name

### Value

### Type

### Required

### Priority

### Profile

## Defining Inputs in Control Code

### Input Scope

## Configuring Inputs in Profile Metadata

### Using inputs with Profile inheritance

## Setting Input values using `--input-file`

## Practices to Avoid

### Routinely assigning Input values to variables

You may also see this anti-pattern in a control file:

```ruby
some_value = input('some_name', ...)
another_value = input('another_name', ...)
# additional variable-assignment code here...

control 'Some Control' do
  describe some_resource do
    # use the variable here, instead of using the input directly
    its('some_property') { should cmp some_value }
  end
end
```

 in which a control file has a long sequence of statements assigning Input values to variables, then using the variables within controls. This was required in the early days of inputs, but is no longer needed since [`input()` has broad scoping](TODO - link)

Instead, write the above example like this:

```ruby
# Omit unneeded variable assignments

control 'Some Control' do
  describe some_resource do
    # use the input directly here
    its('some_property') { should cmp input('some_name', ...) }
  end
end
```

# NameTODO

## Advanced Topic - Debugging Inputs
