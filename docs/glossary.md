# InSpec Glossary

This document should help you become familiar with some of the terminology used by the InSpec project.

There are two ways to use it:

* A [text glossary](#text_glossary).  Learn the meaning of a word you have encountered.
* A [visual glossary](#visual_glossary).  Look at examples and see how the parts are labelled.  You can then use the text glossary to read details of each concept.

## Visual Glossary

### Motivating Example

Suppose we are interested in auditing cars.

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

_'MOONMAN'_ is an expected value.  Some matchers take an expected value; others do not.

#### it { should _be\_classy_ }

_be\_classy_ is a [resource-specific matcher](#resource_specific_matcher). It will return a yes-or-no value, based on whether Tony's car is classy or not.  (It is.  Tony is a classy guy.)

#### it { _should\_not_ have\_check\_engine\_light\_on }

_should\_not_ indicates this is a negated test. So, this test will pass if the matcher says "no".


### Advanced Syntax

```
describe foos('/path/to/foo.txt', ssl_verify: true).where { names == 'blah' } do
    its('jared') { should cmp >= 123 }
    its('jared.sort.first.monkey') { should be `loud` }
    its(['jared', 'monkey.with.dots']) { should be `loud` }
end
```

### Advanced Elements:

#### describe **foos**

  * `foos` is a _plural resource_

#### describe foos **('/path/to/foo.txt', ssl_verify: true)**

  * `'/path/to/foo.txt'` and `ssl_verify: true` are the _resource parameters_. Resources take one or more parameters.

### Filters:

#### describe foos ('/path/to/foo.txt', ssl_verify: true)**.where { names == 'blah' }** 

  * `.where  { names == 'blah' }` is an example of a **filter**. 
  * `{ names == 'blah' }` is an example of a _filter clause_ 
  * Some resources support one or more filters.
  * Filters are used on plural resources. 
  * Some resources, such as `etc_hosts` are explicitly plural, while others, such as `passwd` are implicitly plural. 

#### **{ names == 'my-name' && spots == true }** are filter criteria

  * `names` compares output to `blah`
  * `has spots` evaluates to `true` or `false`

### Properties:

#### **its('jared') { should cmp >= 123 }**

  * `jared` is the _property_

#### **{ should cmp >= 123 }** is a conditional statement that uses a matcher with an operator and expected value.

  * `cmp`  is the _matcher_
  * `>=` is the operator (some matchers accept operators)
  * `123` is the expected value

### Properties with advanced usage:

Some properties may have advanced usage:

#### **its `('jared.sort.first.monkey') { should be `loud` }`**

  * `jared.sort.first.monkey` is an example of the `jared` property with an advanced usage

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