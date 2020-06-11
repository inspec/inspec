# RSpec::Its [![Build Status](https://travis-ci.org/rspec/rspec-its.svg)](https://travis-ci.org/rspec/rspec-its)

RSpec::Its provides the `its` method as a short-hand to specify the expected value of an attribute.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-its'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-its

And require it as:

```ruby
require 'rspec/its'
```

## Usage

Use the `its` method to generate a nested example group with
a single example that specifies the expected value of an attribute of the
subject using `should`, `should_not` or `is_expected`.
The `its` method can also specify the block expectations of an attribute of the
subject using `will` or `will_not`.

`its` accepts a symbol or a string, and a block representing the example.

```ruby
its(:size)    { should eq(1) }
its("length") { should eq(1) }
```

You can use a string with dots to specify a nested attribute (i.e. an
attribute of the attribute of the subject).

```ruby
its("phone_numbers.size") { should_not eq(0) }
```

The following expect-style method is also available:

```ruby
its(:size) { is_expected.to eq(1) }
```

as is this alias for pluralized use:

```ruby
its(:keys) { are_expected.to eq([:key1, :key2]) }
```

The following block expect-style method is also available:

```ruby
its(:size) { will_not raise_error }
```

as is this alias for pluralized use:

```ruby
its(:keys) { will raise_error(NoMethodError) }
```

When the subject implements the `[]` operator, you can pass in an array with a single key to
refer to the value returned by that operator when passed that key as an argument.

```ruby
its([:key]) { is_expected.to eq(value) }
```

For hashes, multiple keys within the array will result in successive accesses into the hash. For example:

```ruby
subject { {key1: {key2: 3} } }
its([:key1, :key2]) { is_expected.to eq(3) }
```

For other objects, multiple keys within the array will be passed as separate arguments in a single method call to [], as in:

```ruby
subject { Matrix[ [:a, :b], [:c, :d] ] }
its([1,1]) { should eq(:d) }
```

Metadata arguments are supported.

```ruby
its(:size, focus: true) { should eq(1) }
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
