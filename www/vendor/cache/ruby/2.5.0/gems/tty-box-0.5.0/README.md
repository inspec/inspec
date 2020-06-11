<div align="center">
  <a href="https://piotrmurach.github.io/tty" target="_blank"><img width="130" src="https://github.com/piotrmurach/tty/blob/master/images/tty.png" alt="tty logo" /></a>
</div>

# TTY::Box [![Gitter](https://badges.gitter.im/Join%20Chat.svg)][gitter]

[![Gem Version](https://badge.fury.io/rb/tty-box.svg)][gem]
[![Build Status](https://secure.travis-ci.org/piotrmurach/tty-box.svg?branch=master)][travis]
[![Build status](https://ci.appveyor.com/api/projects/status/h9b88fk5xpya3fh1?svg=true)][appveyor]
[![Maintainability](https://api.codeclimate.com/v1/badges/dfac05073e1549e9dbb6/maintainability)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/github/piotrmurach/tty-box/badge.svg)][coverage]
[![Inline docs](http://inch-ci.org/github/piotrmurach/tty-box.svg?branch=master)][inchpages]

[gitter]: https://gitter.im/piotrmurach/tty
[gem]: http://badge.fury.io/rb/tty-box
[travis]: http://travis-ci.org/piotrmurach/tty-box
[appveyor]: https://ci.appveyor.com/project/piotrmurach/tty-box
[codeclimate]: https://codeclimate.com/github/piotrmurach/tty-box/maintainability
[coverage]: https://coveralls.io/github/piotrmurach/tty-box
[inchpages]: http://inch-ci.org/github/piotrmurach/tty-box

> Draw various frames and boxes in your terminal interface.

**TTY::Box** provides box drawing component for [TTY](https://github.com/piotrmurach/tty) toolkit.

![Box drawing](https://github.com/piotrmurach/tty-box/blob/master/assets/tty-box-drawing.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tty-box'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tty-box

## Contents

* [1. Usage](#1-usage)
* [2. Interface](#2-interface)
  * [2.1 frame](#21-frame)
  * [2.2 position](#22-position)
  * [2.3 dimension](#23-dimension)
  * [2.4 title](#24-title)
  * [2.5 border](#25-border)
  * [2.6 styling](#26-styling)
  * [2.7 formatting](#27-formatting)
  * [2.8 messages](#28-messages)
    * [2.8.1 info](#281-info)
    * [2.8.2 warn](#282-warn)
    * [2.8.3 success](#283-success)
    * [2.8.4 error](#284-error)

## 1. Usage

Using the `frame` method, you can draw a box in a terminal emulator:

```ruby
box = TTY::Box.frame "Drawing a box in", "terminal emulator", padding: 3, align: :center
```

And then print:

```ruby
print box
# =>
# ┌───────────────────────┐
# │                       │
# │                       │
# │                       │
# │   Drawing a box in    │
# │   terminal emulator   │
# │                       │
# │                       │
# │                       │
# └───────────────────────┘
```

## 2. Interface

### 2.1 frame

You can draw a box in your terminal window by using the `frame` method and passing a content to display. By default the box will be drawn around the content.

```ruby
print TTY::Box.frame "Hello world!"
# =>
# ┌────────────┐
# │Hello world!│
# └────────────┘
```

You can also provide multi line content as separate arguments.

```ruby
print TTY::Box.frame "Hello", "world!"
# =>
# ┌──────┐
# │Hello │
# │world!│
# └──────┘
```

Alternatively, provide a multi line content using newline chars in a single argument:

```ruby
print TTY::Box.frame "Hello\nworld!"
# =>
# ┌──────┐
# │Hello │
# │world!│
# └──────┘
```

Finally, you can use a block to specify content:

```ruby
print TTY::Box.frame do
  "Hello world!"
end
# =>
# ┌────────────┐
# │Hello world!│
# └────────────┘
```

You can also enforce a given box size without any content and use [tty-cursor](https://github.com/piotrmurach/tty-cursor) to position content whatever you like.

```ruby
box = TTY::Box.frame(width: 30, height: 10)
```

When printed will produce the following output in your terminal:

```ruby
print box
# =>
# ┌────────────────────────────┐
# │                            │
# │                            │
# │                            │
# │                            │
# │                            │
# │                            │
# │                            │
# │                            │
# └────────────────────────────┘
```

Alternatively, you can also pass a block to provide a content for the box:

```ruby
box = TTY::Box.frame(width: 30, height: 10) do
  "Drawin a box in terminal emulator"
end
```

When printed will produce the following output in your terminal:

```ruby
print box
# =>
# ┌────────────────────────────┐
# │Drawing a box in terminal   │
# │emulator                    │
# │                            │
# │                            │
# │                            │
# │                            │
# │                            │
# │                            │
# └────────────────────────────┘
```

### 2.2 position

By default, a box will not be positioned. To position your box absolutely within a terminal window use `:top` and `:left` keyword arguments:

```ruby
TTY::Box.frame(top: 5, left: 10)
```

This will place box 10 columns to the right and 5 lines down counting from the top left corner.

If you wish to center your box within the terminal window then consider using [tty-screen](https://github.com/piotrmurach/tty-screen) for gathering terminal screen size information.

### 2.3 dimension

At the very minimum a box requires to be given size by using two keyword arguments `:width` and `:height`:

```ruby
TTY::Box.frame(width: 30, height: 10)
```

If you wish to create a box that depends on the terminal window size then consider using [tty-screen](https://github.com/piotrmurach/tty-screen) for gathering terminal screen size information.

For example to print a box that spans the whole terminal window do:

```ruby
TTY::Box.frame(width: TTY::Screen.width, height: TTY::Screen.height)
```

### 2.4 title

You can specify titles using the `:title` keyword and a hash value that contains one of the `:top_left`, `:top_center`, `:top_right`, `:bottom_left`, `:bottom_center`, `:bottom_right` keys and actual title as value. For example, to add titles to top left and bottom right of the frame do:


```ruby
box = TTY::Box.frame(width: 30, height: 10, title: {top_left: 'TITLE', bottom_right: 'v1.0'})
```

which when printed in console will render the following:

```ruby
print box
# =>
# ┌TITLE───────────────────────┐
# │                            │
# │                            │
# │                            │
# │                            │
# │                            │
# │                            │
# │                            │
# │                            │
# └──────────────────────(v1.0)┘
```

### 2.5 border

There are three types of border `:ascii`, `:light`, `:thick`. By default the `:light` border is used. This can be changed using the `:border` keyword:

```ruby
box = TTY::Box.frame(width: 30, height: 10, border: :thick)
```

and printing the box out to console will produce:

```ruby
print box
# =>
# ╔════════════════════════════╗
# ║                            ║
# ║                            ║
# ║                            ║
# ║                            ║
# ║                            ║
# ║                            ║
# ║                            ║
# ║                            ║
# ╚════════════════════════════╝
```

You can also selectively specify and turn off border parts by passing a hash with a `:border` key. The border parts are:

```
                 :top
    :top_left ┌────────┐ :top_right
              │        │
        :left │        │ :right
              │        │
 :bottom_left └────────┘ :bottom_right
               :bottom
```

The following are available border parts values:

| Border values        | ASCII | Unicode Light | Unicode Thick |
| -------------------- |:-----:|:-------------:|:-------------:|
| :line                | `-`   | `─`           | `═`           |
| :pipe                | `\|`  | `\│`          | `\║`          |
| :cross               | `+`   | `┼`           | `╬`           |
| :divider_up          | `+`   | `┴`           | `╩`           |
| :divider_down        | `+`   | `┬`           | `╦`           |
| :divider_left        | `+`   | `┤`           | `╣`           |
| :divider_right       | `+`   | `├`           | `╠`           |
| :corner_top_left     | `+`   | `┌`           | `╔`           |
| :corner_top_right    | `+`   | `┐`           | `╗`           |
| :corner_bottom_left  | `+`   | `└`           | `╚`           |
| :corner_bottom_right | `+`   | `┘`           | `╝`           |

For example, to change all box corners to be a `:cross` do:

```ruby
box = TTY::Box.frame(
  width: 10, height: 4,
  border: {
    top_left: :cross,
    top_right: :cross,
    bottom_left: :cross,
    bottom_right: :cross
  }
)
```

```ruby
print box
# =>
# ┼────────┼
# │        │
# │        │
# ┼────────┼
```

If you want to remove a given border element as a value use `false`. For example to remove bottom border do:

```ruby
TTY::Box.new(
  width: 30, height: 10,
  border: {
    type: :thick,
    bottom: false
  })
```

### 2.6 styling

By default drawing a box doesn't apply any styling. You can change this using the `:style` keyword with foreground `:fg` and background `:bg` keys for both the main content and the border:

```ruby
style: {
  fg: :bright_yellow,
  bg: :blue,
  border: {
    fg: :bright_yellow,
    bg: :blue
  }
}
```

The above style configuration will produce the result similar to the top demo, a MS-DOS look & feel window.

### 2.7 formatting

You can use `:align` keyword to format content either to be `:left`, `:center` or `:right` aligned:

```ruby
box = TTY::Box.frame(width: 30, height: 10, align: :center) do
  "Drawing a box in terminal emulator"
end
```

The above will create the following output in your terminal:

```ruby
print box
# =>
# ┌────────────────────────────┐
# │ Drawing a box in terminal  │
# │          emulator          │
# │                            │
# │                            │
# │                            │
# │                            │
# │                            │
# │                            │
# └────────────────────────────┘
```

You can also use `:padding` keyword to further format the content using the following values:

```ruby
[1,3,1,3]  # => pad content left & right with 3 spaces and add 1 line above & below
[1,3]      # => pad content left & right with 3 spaces and add 1 line above & below
1          # => shorthand for [1,1,1,1]
```

For example, if you wish to pad content all around do:

```ruby
box = TTY::Box.frame(width: 30, height: 10, align: :center, padding: 3) do
  "Drawing a box in terminal emulator"
end
```

Here's an example output:

```ruby
print box
# =>
# ┌────────────────────────────┐
# │                            │
# │                            │
# │                            │
# │     Drawing a box in       │
# │     terminal emulator      │
# │                            │
# │                            │
# │                            │
# └────────────────────────────┘
#
```

### 2.8 messages

![Box messages](https://github.com/piotrmurach/tty-box/blob/master/assets/tty-box-messages.png)

#### 2.8.1 info

To draw an information type box around your content use `info`:

```ruby
box = TTY::Box.info("Deploying application")
```

And then print:

```ruby
print box
# =>
# ╔ ℹ INFO ═══════════════╗
# ║                       ║
# ║ Deploying application ║
# ║                       ║
# ╚═══════════════════════╝
```

#### 2.8.2 warn

To draw a warning type box around your content use `warn`:

```ruby
box = TTY::Box.warn("Deploying application")
```

And then print:

```ruby
print box
# =>
# ╔ ⚠ WARNING ════════════╗
# ║                       ║
# ║ Deploying application ║
# ║                       ║
# ╚═══════════════════════╝
```

#### 2.8.3 success

To draw a success type box around your content use `success`:

```ruby
box = TTY::Box.success("Deploying application")
```

And then print:

```ruby
print box
# =>
# ╔ ✔ OK ═════════════════╗
# ║                       ║
# ║ Deploying application ║
# ║                       ║
# ╚═══════════════════════╝
```

#### 2.8.4 error

To draw an error type box around your content use `error`:

```ruby
box = TTY::Box.error("Deploying application")
```

And then print:

```ruby
print box
# =>
# ╔ ⨯ ERROR ══════════════╗
# ║                       ║
# ║ Deploying application ║
# ║                       ║
# ╚═══════════════════════╝
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/piotrmurach/tty-box. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TTY::Box project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/piotrmurach/tty-box/blob/master/CODE_OF_CONDUCT.md).

## Copyright

Copyright (c) 2018 Piotr Murach. See LICENSE for further details.
