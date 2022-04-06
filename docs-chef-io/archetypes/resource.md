+++
title = "{{ .Name }} resource"
draft = false
gh_repo = "inspec"
platform = "<PLATFORM>"

[menu]
  [menu.inspec]
    title = "{{ .Name }}"
    identifier = "inspec/resources/<PLATFORM>/{{ .Name }}"
    parent = "inspec/resources/<PLATFORM>"
+++
{{/* Run `hugo new -k resource inspec/resources/RESOURCE_NAME.md` to generate a new resource page. */}}
Use the `{{ .Name }}` Chef InSpec audit resource to test the configuration of...

## Installation

{{% inspec_installation %}}

This resource first became available in Chef InSpec vX.Y.Z.

## Syntax

```ruby
describe {{ .Name }} do
  #...
end
```

## Parameters

`PARAMETER`
: PARAMETER DESCRIPTION

`PARAMETER`
: PARAMETER DESCRIPTION

## Properties

`PROPERTY`
: PROPERTY DESCRIPTION

`PROPERTY`
: PROPERTY DESCRIPTION

## Examples

**EXAMPLE DESCRIPTION**

```ruby
describe {{ .Name }} do
  #...
end
```

**EXAMPLE DESCRIPTION**

```ruby
describe {{ .Name }} do
  #...
end
```

## Matchers

{{% inspec_matchers_link %}}

**MATCHER_NAME**

The `MATCHER_NAME` matcher tests the value of...

```ruby
its(`MATCHER_NAME`) { should cmp 'VALUE' }
```
