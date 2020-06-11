<div align="center">
  <a href="https://piotrmurach.github.io/tty" target="_blank"><img width="130" src="https://cdn.rawgit.com/piotrmurach/tty/master/images/tty.png" alt="tty logo" /></a>
</div>

# TTY::Color [![Gitter](https://badges.gitter.im/Join%20Chat.svg)][gitter]

[![Gem Version](https://badge.fury.io/rb/tty-color.svg)][gem]
[![Build Status](https://secure.travis-ci.org/piotrmurach/tty-color.svg?branch=master)][travis]
[![Build status](https://ci.appveyor.com/api/projects/status/j1nflklmnfrb2yrf?svg=true)][appveyor]
[![Code Climate](https://codeclimate.com/github/piotrmurach/tty-color/badges/gpa.svg)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/github/piotrmurach/tty-color/badge.svg)][coverage]
[![Inline docs](http://inch-ci.org/github/piotrmurach/tty-color.svg?branch=master)][inchpages]

[gitter]: https://gitter.im/piotrmurach/tty
[gem]: http://badge.fury.io/rb/tty-color
[travis]: http://travis-ci.org/piotrmurach/tty-color
[appveyor]: https://ci.appveyor.com/project/piotrmurach/tty-color
[codeclimate]: https://codeclimate.com/github/piotrmurach/tty-color
[coverage]: https://coveralls.io/github/piotrmurach/tty-color
[inchpages]: http://inch-ci.org/github/piotrmurach/tty-color

> Terminal color capabilities detection.

**TTY::Color** provides independent color support detection component for [TTY](https://github.com/piotrmurach/tty) toolkit.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tty-color'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tty-color

## Usage

**TTY::Color** allows you to check if terminal supports color:

```ruby
TTY::Color.color?    # => true
TTY::Color.support?  # => true
```

Also you can get the number of colors supported by the terminal:

```ruby
TTY::Color.mode # => 64
```

**TTY::Color** is just a module hence you can include it into your scripts directly:

```ruby
#!/usr/bin/env ruby

include TTY::Color

puts color?
```

## Command line tool

[tty-color-cli](https://github.com/piotrmurach/tty-color-cli) is a command line tool for the **TTY::Color**.

To check if terminal supports colors do:

```bash
color -s
```

And to check color mode:

```bash
color -m
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/piotrmurach/tty-color. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

1. Fork it ( https://github.com/piotrmurach/tty-color/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Code of Conduct

Everyone interacting in the TTY::Color project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/piotrmurach/tty-color/blob/master/CODE_OF_CONDUCT.md).

## Copyright

Copyright (c) 2016 Piotr Murach. See LICENSE for further details.
