# InSpec Concepts

## attribute

An _attribute_ is a parameter that InSpec can read from a YAML file provided on the command line.  You can use this feature to make a [profile's](#profile) behavior vary by passing different attribute files, or to store secrets that should not be directly present in a profile.  InSpec attributes are unrelated to Chef attributes.

The CLI syntax for attributes is documented under the [`inspec exec`](https://www.inspec.io/docs/reference/cli/#exec) command.

The syntax for accessing attributes within a profile is documented in the [profiles documentation](https://www.inspec.io/docs/reference/profiles/#profile-attributes).

## condition statement

## control
## core resource
## custom resource
## DSL
## expected result
## filter criteria
## matcher
## operator
## plural resource
## profile
## property
## reporter
## resource
## resource pack

A _resource pack_ is a type of [profile](#profile) that is used to distribute [custom resources](#custom_resource). This specialized type of profile contains no [controls](#control), but it does contain a `libraries` directory which where Ruby files define custom resources.

## resource parameter
## resource-specific matcher
## singular resource
## target
## universal matcher

A _universal matcher_ is a [matcher](#matcher) that can be used on any type of [resource](#resource). For example, you can use the `cmp` matcher to check the value of properties without having to worry about Ruby type-casting.  Universal matchers are documented on the [Universal Matchers](https://www.inspec.io/docs/reference/matchers/) page.