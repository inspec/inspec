# InSpec Glossary

This document should help you become familiar with some of the terminology used by the InSpec project.

There are two ways to use it:

* A [text glossary](#text_glossary).  Learn the meaning of a word you have encountered.
* A [visual glossary](#visual_glossary).  Look at examples and see how the parts are labelled.

## Visual Glossary

### Basic Syntax

```
describe foo('/path/to/foo.txt') do
    its('blah') { should cmp '123' }
    it { should exist }
    it { should be_reasonable }
    it { should_not be_ridiculous }
end
```
### Basic Elements:

#### describe **foo**, where

  * `foo` is the _resource_

#### describe foo **('/path/to/foo.txt')**, where

  * `'/path/to/foo.txt'` is the _resource parameter_

### Tests:

#### **its('blah') { should cmp '123' }** is an _individual test_, where

  * `blah` is a _property_
  * { should cmp '123' } is a _condition statement_
  * `should`  is the _condition_
  * `cmp`  is the _matcher_
  * `'123'`  is the _expected result_

#### **{ should exist }** is a _condition statement_, where

  * `should`  is the _condition_
  * `exist`  is the _matcher_

#### **{ should be\_reasonable }** is a _condition statement_, where

  * `should`  is the _condition_
  * `be_reasonable`  is the _matcher_

#### **{ should\_not be\_ridiculous }** is a _negative condition statement_, where

  * `should_not`  is the _negative condition_
  * `be_ridiculous`  is the _matcher_

### Advanced Syntax

```
describe foos('/path/to/foo.txt', ssl_verify: true).where { names == 'blah' } do
    its('jared') { should cmp >= 123 }
    its('jared.sort.first.monkey') { should be `loud` }
    its(['jared', 'monkey.with.dots']) { should be `loud` }
end
```

### Advanced Elements:

#### describe **foos**, where

  * `foos` is a _plural resource_

#### describe foos **('/path/to/foo.txt', ssl_verify: true)**, where

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
### universal matcher

A _universal matcher_ is a [matcher](#matcher) that can be used on any type of [resource](#resource). For example, you can use the `cmp` matcher to check the value of properties without having to worry about Ruby type-casting.  Universal matchers are documented on the [Universal Matchers](https://www.inspec.io/docs/reference/matchers/) page.