# InSpec Glossary

This document should help you become familiar with some of the terminology used by the InSpec project.

There are two ways to use it:

* A [text glossary](#text_glossary).  Learn the meaning of a word you have encountered.
* A [visual glossary](#visual_glossary).  Look at examples and see how the parts are labelled.  You can then use the text glossary to read details of each concept.

## Visual Glossary

### Motivating Example

Suppose we are interested in auditing cars.  Let's suppose we have two InSpec resources for  auditing: `cars`, which can search for and filter groups of cars, and `car`, which can perform detailed auditing of a single car.

### Basic Syntax

Let's look at some simple examples.

### Singular Resource Example

```
describe car(owner: 'Tony Clifton') do
    it { should exist }
    its('license_plate') { should cmp 'MOONMAN' }
    it { should be_classy }
    it { should_not have_check_engine_light_on }
end
```

#### describe _car_(owner: 'Tony Clifton') do

_car_ is a [resource](#resource).  Since we are only talking about one car, it is a [singular resource](#singular_resource).

#### describe foo(_owner: 'Tony Clifton'_)

_owner_ is a [resource parameter](#resource_parameter) along with _'Tony Clifton'_, a resource parameter value.

#### _it { should exist }_

Each line within the resource block that begins with `it` or `its` is a [test](#test).  Use [it](#it) to access [resource-specific matchers](#resource_specific_matcher), and use [its](#its) to access [properties](#property) of the [resource](#resource), which are then used with [universal matchers](#universal_matcher).

#### its('_license_plate_') { should cmp 'MOONMAN' }

_license_plate_ is a [property](#property) of the [resource](#resource).  Properties expose information about the resource for you to test. Some properties are numbers, some (like this one) are text, some are lists, and some are more complex objects.  Properties are always used with [universal matchers](#universal_matcher).

#### its('license_plate') { should _cmp_ 'MOONMAN' }

_cmp_ is a [universal matcher](#universal_matcher).  `cmp` is a very flexible, loosely typed equality operator; here it is checking to see if the license plate text is the same as the text 'MOONMAN'.  Notice it is operating on the license plate text (the property value); it does not operate on the resource.  You can find the full list of supported universal matchers on the [Universal Matcher page](https://www.inspec.io/docs/reference/matchers/).

#### its('license_plate') { should cmp _'MOONMAN'_ }

_'MOONMAN'_ is an [expected result](#expected_result).  Some matchers take an expected result; others do not.

#### it { should _be\_classy_ }

_be\_classy_ is a [resource-specific matcher](#resource_specific_matcher). It will return a yes-or-no value, based on whether Tony's car is classy or not.  (It is.  Tony is a classy guy.)

#### it { _should\_not_ have\_check\_engine\_light\_on }

_should\_not_ indicates this is a negated test. So, this test will pass if the matcher says "no".

### Plural Resource Example

```
  describe cars.where(color: /^b/) do
    it { should exist }
    its('manufacturers') { should include 'Cadillac' }
    its('count') { should be >= 10 }
  end
```

#### describe _cars_.where(color: /^b/) do

_cars_ is a [resource](#resource).  Since we are potentially talking about many cars, it is a [plural resource](#plural_resource).

#### describe cars._where(color: /^b/)_ do

_where(color: /^b/)_ is a [filter statement](#filter_statement).  Without a filter statement, `cars` would simply select all the cars in the world.

#### describe cars.where(_color: /^b/_) do

_color_ is a [filter criterion](#filter_criteria) along with its filter value, _/^b/_.  Here, the criterion is expressing that we want to select all cars whose colors begin with the letter 'b' - blue, brown, burgundy, etc.

#### _it { should exist }_

Each line within the resource block that begins with `it` or `its` is a [test](#test).  Use [it](#it) to access [resource-specific matchers](#resource_specific_matcher), and use [its](#its) to access [properties](#property) of the [resource](#resource), which are then used with [universal matchers](#universal_matcher).

With plural resources, `exist` has a special meaning: did the filter match anything?

#### its('_manufacturers_') { should include 'Cadillac' }

_manufacturers_ is a [property](#property) of the [resource](#resource).  Properties expose information about the resource for you to test. On plural resources, properties are almost always names in the plural, and almost always return a list of values.  Here, it would be a list of the names of the manufacturers of the cars. Some list properties are de-duplicated; for example, you might have 10 cars, but if they are all Subarus and Cadillacs, you will only have two entries in the `manufacturers` property. Be sure to check the documentation for your resource.

#### its('manufacturers') { should _include_ 'Cadillac' }

_include_ is a [universal matcher](#universal_matcher).  `include` works with lists, and checks to see if an expecteddd result is present. Here, it is checking to see if the list of manufacturers contains an entry with the text 'Cadillac'. Notice it is operating on the manufacturers list (the property value); it does not operate on the resource.  You can find the full list of supported universal matchers on the [Universal Matcher page](https://www.inspec.io/docs/reference/matchers/).

#### its('manufacturers') { should include '_Cadillac_' }

_'Cadillac'_ is an [expected result](#expected_result).  Some matchers take an expected result; others do not.

#### its('count') { should _be >=_ 10 }

_be >=_ is an [operator matcher](#operator matcher). It allows you to perform numeric comparisions. All plural resources have a `count` property.

### Advanced Syntax

#### Block-Filter Syntax
```
```

#### Method Access on Properties
```
```

#### Using Resources without Describe Blocks
```
```

## Text Glossary

### attribute

An _attribute_ is a parameter that InSpec can read from a YAML file provided on the command line.  You can use this feature to make a [profile's](#profile) behavior vary by passing different attribute files, or to store secrets that should not be directly present in a profile.  InSpec attributes are unrelated to Chef attributes.

The CLI syntax for attributes is documented under the [`inspec exec`](https://www.inspec.io/docs/reference/cli/#exec) command.

The syntax for accessing attributes within a profile is documented in the [profiles documentation](https://www.inspec.io/docs/reference/profiles/#profile-attributes).

### condition statement

### control
### core resource
### custom resource
### DSL
### expected result
### filter statement
### filter criteria
### it
### its
### matcher
### operator
### plural resource
### profile
### property
### reporter
### resource
### resource pack

A _resource pack_ is a type of [profile](#profile) that is used to distribute [custom resources](#custom_resource). This specialized type of profile contains no [controls](#control), but it does contain a `libraries` directory which where Ruby files define custom resources.

### resource parameter
### resource-specific matcher
### singular resource
### target
### test
### universal matcher

A _universal matcher_ is a [matcher](#matcher) that can be used on any type of [resource](#resource). For example, you can use the `cmp` matcher to check the value of properties without having to worry about Ruby type-casting.  Universal matchers are documented on the [Universal Matchers](https://www.inspec.io/docs/reference/matchers/) page.