# Chef InSpec Glossary

This document should help you become familiar with some of the terminology used by the Chef InSpec project.

There are two ways to use it:

* A [text glossary](#text-glossary). Learn the meaning of a word you have encountered.
* A [visual glossary](#visual-glossary). Look at examples and see how the parts are labelled. You can then use the text glossary to read details of each concept.

## Visual Glossary

### Motivating Example

Suppose we are interested in auditing cars. Let's suppose we have two Chef InSpec resources for auditing: `cars`, which searches for and filters groups of cars, and `car`, which performs detailed auditing of a single car.

### Basic Syntax

Let's look at some simple examples.

### Singular Resource Example

```inspec
describe car(owner: 'Tony Clifton') do
    it { should exist }
    its('license_plate') { should cmp 'MOONMAN' }
    it { should be_classy }
    it { should_not have_check_engine_light_on }
end
```

#### describe car(owner: 'Tony Clifton') do

_car_ is a [resource](#resource). Since we are talking about only one car, it is a [singular resource](#singular-resource).

#### describe car(_owner: 'Tony Clifton'_)

_owner_ is a [resource parameter](#resource-parameter) and _'Tony Clifton'_ is a resource parameter value.

#### _it { should exist }_

Each line within the resource block beginning with `it` or `its` is a [test](#test). Use [it](#it) to access [resource-specific matchers](#resource-specific-matcher), and use [its](#its) to access [properties](#property) of the [resource](#resource), which are in turn used with [universal matchers](#universal-matcher).

#### its('_license\_plate_') { should cmp 'MOONMAN' }

_license\_plate_ is a [property](#property) belonging to the [resource](#resource). Properties expose testable information about the resource. Some properties are numbers, some (like this one) are text, some are lists, and some are more complex objects. Properties are always used with [universal matchers](#universal-matcher).

#### its('license\_plate') { should _cmp_ 'MOONMAN' }

_cmp_ is a [universal matcher](#universal-matcher). `cmp` is a very flexible, loosely typed equality operator; here it checks to see if the license plate text is the same as the text 'MOONMAN'. Notice that the test operates on the license plate text (the property value) and not on the resource. You can find the full list of supported universal matchers on the [Universal Matcher page](https://www.inspec.io/docs/reference/matchers/).

#### its('license\_plate') { should cmp _'MOONMAN'_ }

_'MOONMAN'_ is an [expected result](#expected-result). Some matchers take an expected result; others do not.

#### it { should _be\_classy_ }

_be\_classy_ is a [resource-specific matcher](#resource-specific-matcher). It returns a yes-or-no value, based on whether Tony's car is classy or not. (It is. Tony is a classy guy.)

#### it { _should\_not_ have\_check\_engine\_light\_on }

_should\_not_ indicates this is a negated test. So, this test passes if the matcher says "no".

### Plural Resource Example

```inspec
  describe cars.where(color: /^b/) do
    it { should exist }
    its('manufacturers') { should include 'Cadillac' }
    its('count') { should be >= 10 }
  end
```

#### describe _cars_.where(color: /^b/) do

_cars_ is a [resource](#resource). Since we are potentially talking about many cars, it is a [plural resource](#plural-resource).

#### describe cars._where(color: /^b/)_ do

_where(color: /^b/)_ is a [filter statement](#filter-statement). Without a filter statement, `cars` simply selects all the cars in the world.

#### describe cars.where(_color: /^b/_) do

_color_ is a [filter criterion](#filter-criteria) along with its filter value, _/^b/_. Here, the criterion expresses that we want to select all cars whose colors begin with the letter 'b' - blue, brown, burgundy, etc.

#### _it { should exist }_

Each line within the resource block beginning with `it` or `its` is a [test](#test). Use [it](#it) to access [resource-specific matchers](#resource-specific-matcher), and use [its](#its) to access [properties](#property) of the [resource](#resource), which are in turn used with [universal matchers](#universal-matcher).

With plural resources, `exist` has a special meaning: did the filter match anything?

#### its('_manufacturers_') { should include 'Cadillac' }

_manufacturers_ is a [property](#property) of the [resource](#resource). Properties expose testable information about the resource. On plural resources, properties are almost always names in the plural, and almost always return a list of values. Here, the test returns a list of the car manufacturer names. Some list properties are de-duplicated; for example, you might have 10 cars, but if they are all Subarus and Cadillacs, it returns only two entries in the `manufacturers` property. Be sure to check the documentation for your resource.

#### its('manufacturers') { should _include_ 'Cadillac' }

_include_ is a [universal matcher](#universal-matcher). `include` works with lists, and checks to see if an expected result is present. Here, it checks to see if the list of manufacturers contains an entry with the text 'Cadillac'. Notice it operates on the manufacturers list (the property value) and not on the resource. You can find the full list of supported universal matchers on the [Universal Matcher page](https://www.inspec.io/docs/reference/matchers/).

#### its('manufacturers') { should include '_Cadillac_' }

_'Cadillac'_ is an [expected result](#expected-result). Some matchers take an expected result; others do not.

#### its('count') { should _be >=_ 10 }

_be >=_ is an [operator matcher](#operator matcher). It allows you to perform numeric comparisons. All plural resources have a `count` property.

## Text Glossary

### attribute

An _attribute_ is a parameter that Chef InSpec reads from a YAML file provided on the command line. You can use this feature either to change a [profile's](#profile) behavior by passing different attribute files or to store secrets that should not be directly present in a profile. Chef InSpec attributes are unrelated to Chef attributes.

The CLI syntax for attributes is documented under the [`inspec exec`](https://www.inspec.io/docs/reference/cli/#exec) command.

The syntax for accessing attributes within a profile is documented in the [profiles documentation](https://www.inspec.io/docs/reference/profiles/#profile-attributes).

### control

### control block

The _`control`_ keyword is used to declare a _`control block`_. Here, the word 'control' means a 'regulatory control, recommendation, or requirement' - not a software engineering construct. A `control block` has a name (which usually refers to the assigned ID of the regulatory recommendation it implements), metadata such as descriptions, references, and tags, and finally groups together related [describe blocks](#describe-block) to implement the checks.

### core resource

A [resource](#resource) that is included with InSpec; you are not required to install additional [plugins](#plugin) or depend on a [resource pack](#resource pack) to use the resource.

### custom resource

A [resource](#resource) that is _not_ included with InSpec. It may be a resource of your own creation, or one you obtain by depending on a [resource pack](#resource pack).

### describe

### describe block

The _`describe`_ keyword is used with a _`describe block`_ to refer to an Chef InSpec resource. You use the `describe` keyword along with the name of a [resource](#resource) to enclose related [tests](#test) that apply to the resource. Multiple describe blocks are usually grouped together in a [control](#control), but you can also use them outside of a control.

```Ruby
control 'Rule 1.1 - Color restrictions' do
  # Count only blue cars
  describe cars.where(color: 'blue') do
    its('count') { should eq 20 }
  end
end
```

### DSL

_DSL_ is an acronym for _Domain Specific Language_. It refers to the language extensions Chef InSpec provides to make authoring resources and controls easier. While Chef InSpec control files are use Ruby, the _Control DSL_ makes it easy to write controls without knowledge of Ruby by providing DSL keywords such as [describe](#describe), [control](#control), [it](#it) and [its](#its). See the [Chef InSpec DSL page](https://www.inspec.io/docs/reference/dsl_inspec/) for details about keywords available to control authors.

For [custom resource](#custom-resource) authors, an additional DSL is available - see the [Resource DSL page](https://www.inspec.io/docs/reference/dsl_resource/).

### expected result

When using a [matcher](#matcher), the _`expected result`_ is the value the matcher will compare against the [property](#property) being accessed.

In this example, the [`cmp`](https://www.inspec.io/docs/reference/matchers/#cmp) matcher is being used to compare the `color` property to the expected result 'black'.

```Ruby
describe car(owner: 'Bruce Wayne') do
  its('color') { should cmp 'black' }
end
```

### filter statement

When using a [plural resource](#plural-resource), a _`filter statement`_ is used to select individual test subjects using [filter criteria](#filter-criteria). A filter statement almost always is indicated by the keyword `where`, and may be repeated using method chaining.

A filter statement may use method call syntax (which allows basic criteria operations, such as equality, regex matching, and ruby `===` comparison) or block syntax (which allows arbitrary code).

In this example, `where(...)` is the filter statement.

```Ruby
# Count only blue cars
describe cars.where(color: 'blue') do
  its('count') { should eq 20 }
end
```

### filter criterion

### filter criteria

When using a [plural resource](#plural-resource), a _`filter criterion`_ is used to select individual test subjects within a [filter statement](#filter-statement). You may use multiple _`filter criteria`_ in a single filter statement.

When method-call syntax is used with the filter statement, you provide filter criteria as a Hash, with filter criteria names as keys, and conditions as the Hash values. You may provide test, true/false, or numbers, in which case the comparison is equality; or you may provide a regular expression, in which case a match is performed.

Here, `(color: blue)` is a single filter criterion being used with a filter statement in method-call syntax.

```Ruby
# Count only blue cars
describe cars.where(color: 'blue') do
  its('count') { should eq 20 }
end
```

When block-method syntax is used with the filter statement, you provide a block. The block may contain arbitrary code, and each filter criteria will be available as an accessor. The block will be evaluated once per row, and each block that evaluates to a truthy value will pass the filter.

Here, `{ engine_cylinders >= 6 }` is a block-syntax filter statement referring to one filter criterion.

```Ruby
# Vroom!
describe cars.where { engine_cylinders >= 6 } do
  its('city_mpg_ratings') { should_not include '4-star' }
end
```

### it

Within a [describe block](#describe), _`it`_ declares an individual [test](#test) directly against the [resource](#resource) (as opposed to testing against one of the resource's [properties](#property), as [its](#its) does). Though it is possible to use [universal matchers](#universal-matcher) with `it`, it is much more typical to use [resource-specific matchers](#resource-specific-matchers).

`it` may be used with `should`, or negated using `should_not`.

Here, `it { should ... }` declares a test, calling the `classy?` matcher on Tony Clifton's car.

```Ruby
describe car(owner: 'Tony Clifton') do
  it { should be_classy }
end
```

### its

Within a [describe block](#describe), _`its`_ declares an individual [test](#test) against a property of the [resource](#resource) (as opposed to testing directly against the resource itself, as [it](#it) does). You must use [universal matchers](#universal-matcher) with `its`; you cannot use [resource-specific matchers](#resource-specific-matchers).

`its` may be used with `should`, or negated using `should_not`.

The property to access is passed as a single string argument to `its`. As an advanced usage, if the property has methods you are interested in, you can call them using '`.`' within the string; even more advanced calling patterns are possible - see [the rspec-its documentation](https://github.com/rspec/rspec-its#usage).

Here, `its('fuzzy_dice') { should ... }` declares a test, testing against the `fuzzy_dice` property of Tony Clifton's car. Let's assume - Tony being Tony - that `fuzzy_dice` will return an Array.

```Ruby
describe car(owner: 'Tony Clifton') do
  its('fuzzy_dice') { should_not be_empty }
  its('fuzzy_dice.count') { should be >= 2 }
  its('fuzzy_dice.first.fuzziness') { should cmp 'outlandishly so' }
end
```

### matcher

A _`matcher`_ performs the actual assertions against [resources](#resource) or the [properties](#property) of resources. Matchers always return a true/false value. Matchers fall into two camps:

* [resource-specific matchers](#resource-specific-matchers), which operate directly on the resource, are used with [it](#it), and tend to be highly customized to the auditing needs of the resource
* [universal matchers](#universal-matchers), which operate on the properties of the resource, are used with [its](#its), and tend to be very generic, operating on text, numbers, and lists

Some matchers accept parameters, called [expected results](#expected-results).

For information on how RSpec matchers are related o Chef InSpec matchers, see [Chef InSpec and RSpec](https://www.inspec.io/docs/reference/inspec_and_friends/#rspec).

Here, `be_classy` is a resource-specific matcher operating directly on the `car`, while `cmp` is a universal matcher operating on the `manufacturer` property.

```Ruby
describe car(owner: 'Tony Clifton') do
  it { should be_classy }
  its('manufacturer') { should cmp 'Cadillac' }
end
```

### plural resource

A _`plural resource`_ is a [resource](#resource) that specializes in performing searches and represents multiple occurrences of the resource on the [target](#target) platform. Plural resources are used to audit counts, inspect group properties, and have the unique ability to enforce negative tests ("nothing like this should exist") often required by compliance standards. Plural resources are not intended to perform in-depth auditing of an individual; use [singular resources](#singular-resource) for that.

Plural resources nearly always have a name that ends in 's': `processes`, `aws_security_groups`, `cars`. Plural resources generally do not have [resource-specific matchers](#resource-specific-matcher). If they have properties, they are almost always list properties, meaning that they return a list of values, which may or may not be de-duplicated.

Plural resources support [filter statements](#filter-statement). See the [resource documentation](https://www.inspec.io/docs/reference/resources/) for details regarding which [filter criteria](#filter-criteria) are supported on each resource.

Here, `cars` is a plural resource.

```Ruby
describe cars.where(color: 'blue') do
  its('count') { should eq 20 }
  its('license_plates') { should include 'AUTOAZUL' }

  # License plates are unique, should have 20
  its('license_plates.count') { should cmp 20 }

  # Manufacturers are de-duplicated
  its('manufacturers') { should include 'Subaru' }
  its('manufacturers.count') { should be < 10 }
end
```

### profile

A _`profile`_ is a set of related [controls](#control) in a distributable form. You might have a locally-developed profile that your organization uses to define baseline security on all machines, or you might use a pre-defined profile that implements the requirements of a specific compliance standard. For full details about the capabilities of a profile, see the [profile documentation](https://www.inspec.io/docs/reference/profiles/).

Profiles may be distributed locally as a directory tree, as a tarball or zipfile at a URL, as a git repo, and several other ways. Profiles contain metadata, including versioning, and can setup dependency relationships with other profiles.

Aside from controls, profiles can also contain [custom resources](#custom-resource). If the profile contains only custom resources and no controls, we call it a [resource pack](#resource-pack).

### property

A fact about a [resource](#resource). Typically, you use the [its](#its) keyword to access the property and write a [test](#test) within a [describe block](#describe-block), and then use a [universal matcher](#universal-matcher) to make assertions about the value of the property.

Each resource has different properties. See the [resource documentation](https://www.inspec.io/docs/reference/resources/) for details.

Here, `manufacturer` is a property of the `car` resource.

```Ruby
describe car(owner: 'Tony Clifton') do
  its('manufacturer') { should cmp 'Cadillac' }
end
```

### reporter

An output format for the `inspec exec` command line. Several reporters are available, including JSON and JUnit; see the [inspec exec documentation](https://www.inspec.io/docs/reference/cli/#exec).

### resource

A _`resource`_ represents a category of things on the [target](#target) you wish to examine. For example, to check for the existence and permissions of a file, you would use the [`file`](https://www.inspec.io/docs/reference/resources/file/) resource. Chef InSpec offers dozens of different resources, from the highly specialized (such as `aws_security_group`, which examines firewall rules in AWS) to the very general (such as `command`, which runs a command and lets you examine its output).

Resources are generally categorized as either [singular](#singular-resource) or [plural](#plural-resource), though there are some irregular resources that cannot be cleanly considered one or the other.

Resources are used within a [describe block](#describe-block) to perform [tests](#test).

Here, `car` is a resource.

```Ruby
describe car(owner: 'Tony Clifton') do
  it { should be_classy }
end
```

### resource pack

A _resource pack_ is a type of [profile](#profile) that is used to distribute [custom resources](#custom-resource). This specialized type of profile contains no [controls](#control), but it does contain a `libraries` directory within which Ruby files define custom resources.

### resource parameter

_`resource parameters`_ are information passed to the resource when they are declared. Typically, resource parameters provide identifying information or connectivity information. Resource parameters are not the same as a [filter statement](#filter-statement).

Resource parameters vary from resource to resource; refer to the [resource documentation](https://www.inspec.io/docs/reference/resources/) for details.

Here, `owner: 'Tony Clifton'` is a resource parameter.

```Ruby
describe car(owner: 'Tony Clifton') do
  it { should be_classy }
end
```

### resource-specific matcher

A [matcher](#matcher) that operates directly on the [resource](#resource), as opposed to operating on a property as a [universal matcher](#universal matcher) does.

Resource-specific matchers often provide highly customized behavior. Check the [resource documentation](#https://www.inspec.io/docs/reference/resources/) to discover which resource-specific matchers are available for your resource.

For example, the hypothetical `car` resource defines a `classy?` method, which is exposed as the `be_classy` matcher in Chef InSpec tests.

```Ruby
describe car(owner: 'Tony Clifton') do
  it { should be_classy }
end
```

### singular resource

A [resource](#resource) intended to uniquely identify a single object on the [target](#target). Singular resources specialize in providing richer auditing capabilities via resource-specific matchers. Compare to [plural resources](#plural-resource).

### target

The _`target`_ is the OS or API on which Chef InSpec is performing audits. In Chef InSpec 1.x, this was always an operating system target (a bare metal machine, VM, or container). In Chef InSpec 2.x and later, this can be an OS target, or an API target, including cloud providers such as AWS. Chef InSpec is agentless, meaning that the Chef InSpec code and profiles remain on your workstation, and the target is remotely interrogated without installing anything.

### test

A _`test`_ is an individual assertion about the state of the [resource](#resource) or one of its [properties](#property). All tests begin with the keyword [it](#it) or [its](#its). Tests are grouped within a [describe block](#describe-block).

### universal matcher

A _universal matcher_ is a [matcher](#matcher) that can be used on the [properties](#property) of any type of [resource](#resource). For example, you can use the `cmp` matcher to check the value of properties without having to worry about Ruby type-casting. Universal matchers are almost always used with the [its](#its) keyword.

Universal matchers are documented on the [Universal Matchers](https://www.inspec.io/docs/reference/matchers/) page.

Here, we access the 'color' property, then use the `cmp` universal matcher to compare the property to the 'black' [expected result](#expected-result).

```Ruby
describe car(owner: 'Bruce Wayne') do
  its('color') { should cmp 'black' }
end
```