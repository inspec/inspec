<div align="center">
  <a href="https://piotrmurach.github.io/tty" target="_blank"><img width="130" src="https://github.com/piotrmurach/tty/blob/master/images/tty.png" alt="tty logo" /></a>
</div>

# TTY::Table [![Gitter](https://badges.gitter.im/Join%20Chat.svg)][gitter]

[![Gem Version](https://badge.fury.io/rb/tty-table.svg)][gem]
[![Build Status](https://secure.travis-ci.org/piotrmurach/tty-table.svg?branch=master)][travis]
[![Build status](https://ci.appveyor.com/api/projects/status/8fxrbawbyomqd979?svg=true)][appveyor]
[![Code Climate](https://codeclimate.com/github/piotrmurach/tty-table/badges/gpa.svg)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/github/piotrmurach/tty-table/badge.svg?branch=master)][coverage]
[![Inline docs](http://inch-ci.org/github/piotrmurach/tty-table.svg?branch=master)][inchpages]

[gitter]: https://gitter.im/piotrmurach/tty
[gem]: http://badge.fury.io/rb/tty-table
[travis]: http://travis-ci.org/piotrmurach/tty-table
[appveyor]: https://ci.appveyor.com/project/piotrmurach/tty-table
[codeclimate]: https://codeclimate.com/github/piotrmurach/tty-table
[coverage]: https://coveralls.io/github/piotrmurach/tty-table
[inchpages]: http://inch-ci.org/github/piotrmurach/tty-table

> A flexible and intuitive table formatting.

**TTY::Table** provides independent table formatting component for [TTY](https://github.com/piotrmurach/tty) toolkit.

## Features

* Table behaves like an array with familiar API [see](#2-interface)
* Create table once and render using custom view renderers [see](#3-rendering)
* Rendering provides many display options [see](#33-options)
* Easy custom border creation [see](#352-custom)
* Supports multibyte character encodings

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tty-table'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tty-table

## Contents

* [1. Usage](#1-usage)
* [2. Interface](#2-interface)
  * [2.1 Initialization](#21-initialization)
  * [2.2 Iteration](#22-iteration)
  * [2.3 Access](#23-access)
  * [2.4 Size](#24-size)
* [3. Rendering](#3-rendering)
  * [3.1 Render](#31-render)
  * [3.2 Renderer](#32-renderer)
    * [3.1.1 Basic renderer](#311-basic)
    * [3.1.2 ASCII renderer](#312-ascii-renderer)
    * [3.1.3 Unicode renderer](#313-unicode-renderer)
  * [3.3 Options](#33-options)
  * [3.4 Alignment](#34-alignment)
  * [3.5 Border](#35-border)
    * [3.5.1 Parts](#351-parts)
    * [3.5.2 Custom](#352-custom)
    * [3.5.3 Separator](#353-separator)
    * [3.5.4 Style](#354-style)
  * [3.6 Filter](#36-filter)
  * [3.7 Multiline](#37-multiline)
  * [3.8 Padding](#38-padding)
  * [3.9 Resize](#39-resize)
  * [3.10 Width](#310-width)

## 1. Usage

First, provide **TTY::Table** with headers and data:

```ruby
table = TTY::Table.new ['header1','header2'], [['a1', 'a2'], ['b1', 'b2']]
```

Then simply call `render` on the instance with with border type as first argument:

```ruby
table.render(:ascii)
# =>
#  +-------+-------+
#  |header1|header2|
#  +-------+-------+
#  |a1     |a2     |
#  +-------+-------+
#  |b1     |b2     |
#  +-------+-------+
```

## 2. Interface

### 2.1 Initialization

**TTY::Table** can be created in variety of ways. The easiest way is to pass 2-dimensional array:

```ruby
table = TTY::Table[['a1', 'a2'], ['b1', 'b2']]
table = TTY::Table.new [['a1', 'a2'], ['b1', 'b2']]
table = TTY::Table.new rows: [['a1', 'a2'], ['b1', 'b2']]
```

Alternatively you can specify rows one by one inside block:

```ruby
table = TTY::Table.new do |t|
  t << ['a1', 'a2']
  t << ['b1', 'b2']
end
```

You can add rows of data after initialization:

```ruby
table = TTY::Table.new
table << ['a1','a2']
table << ['b1','b2']
```

In addition to rows you can specify table header:

```ruby
table = TTY::Table.new ['h1', 'h2'], [['a1', 'a2'], ['b1', 'b2']]
table = TTY::Table.new header: ['h1', 'h2'], rows: [['a1', 'a2'], ['b1', 'b2']]
```

or cross header with rows inside a hash like so

```ruby
table = TTY::Table.new [{'h1' => ['a1', 'a2'], 'h2' => ['b1', 'b2']}]
```

### 2.2 Iteration

Table behaves like an Array so `<<`, `each` and familiar methods can be used:

```ruby
table << ['a1', 'a2', 'a3']
table << ['b1', 'b2', 'b3']
table << ['a1', 'a2'] << ['b1', 'b2']  # chain rows assignment
```

In order to iterate over table rows including headers do:

```ruby
table.each { |row| ... }                       # iterate over rows
table.each_with_index  { |row, index| ... }    # iterate over rows with an index
```

### 2.3 Access

In order to reference the row at `index` do:

```ruby
table = TTY::Table.new [['a1','a2'], ['b1','b2']]
table[0]                    # => ['a1','a2']
table.row(0)                # => ['a1','a2']
table.row(i) { |row| ... }  # return array for row(i)
```

Negative indices count backwards from the end of table data (`-1` is the last element):

```ruby
table[-1]   # => ['b1','b2']
```

To reference element at given row(i) and column(j) do:

```ruby
table[i, j]   # return element at row(i) and column(j)
table[0,0]    # => 'a1'
```

To specifically reference column(j) do:

```ruby
table.column(j) { ... }   # return array for column(j)
table.column(0)           # => ['a1','b1']
table.column(name)        # return array for column(name), name of header
```

An `IndexError` is raised for indexes outside of data range.

### 2.4 Size

In order to query the number of rows, columns or size do:

```ruby
table.rows_size        # return row size
table.columns_size     # return column size
table.size             # return an array of [row_size, column_size]
```

### 2.5 Orientation

## 3 Rendering

**TTY-Table** rendering process means you can create tabular data once and then create different renderers to match your needs for formatting the data.

### 3.1 Render

Given a table:

```ruby
table = TTY::Table.new ['header1','header2'], [['a1', 'a2'], ['b1', 'b2']]
```

Once you have an instance of `TTY::Table` you can decorate the content using the `render` method. In order to display a basic whitespace delimited view do:

```ruby
table.render(:basic)
# =>
#  header1 header2
#  a1      a2
#  b1      b2
```

This will use so called `:basic` renderer with default options. The other renderers are `:ascii` and `:unicode`.

The `render` method can accept as a second argument the [rendering options](#33-options) either as hash value:

```ruby
table.render(:basic, alignments: [:left, :center])
```

or inside a block:

```ruby
table.render(:basic) do |renderer|
  renderer.alignments= [:left, :center]
end
```

### 3.2 Renderer

**TTY::Table** has a definition of `TTY::Table::Renderer` which allows you to provide different view for your tabular data. It comes with few initial renderers built in such as `TTY::Table::Renderer::Basic`, `TTY::Table::Renderer::ASCII` and `TTY::Table::Renderer:Unicode`.

Given a table of data:

```ruby
table = TTY::Table.new ['header1','header2'], [['a1', 'a2'], ['b1', 'b2']]
```

You can create a special renderer for it:

```ruby
multi_renderer = TTY::Table::Renderer::Basic.new(table, multiline: true)
```

and then call `render`

```ruby
multi_renderer.render
```

This way, you create tabular data once and then create different renderers to match your needs for formatting the data.

#### 3.2.1 Basic Renderer

The basic render allows for formatting table with whitespace without any border:

```ruby
renderer = TTY::Table::Renderer::Basic.new(table)
```

```ruby
renderer.render
# =>
#  header1 header2
#  a1      a2
#  b1      b2
```

This is the same as calling `render` directly on table:

```ruby
table.render
```

#### 3.2.2 ASCII Renderer

The ascii renderer allows for formatting table with ASCII type border.

Create an instance of ASCII renderer:

```ruby
renderer = TTY::Table::Renderer::ASCII.new(table)
```

and then call `render` to get the formatted data:

```ruby
renderer.render
# =>
#  +-------+-------+
#  |header1|header2|
#  +-------+-------+
#  |a1     |a2     |
#  |b1     |b2     |
#  +-------+-------+
```

This is the same as calling `render` directly on table instance with `:ascii` as the first argument:

```ruby
table.render(:ascii)
```

#### 3.2.3 Unicode Renderer

The uniocde renderer allows for formatting table with Unicode type border.

Create an instance of Unicode renderer:

```ruby
renderer = TTY::Table::Renderer::Unicode.new(table)
```

and then call `render` to get the formatted data:

```ruby
renderer.render
# =>
#  ┌───────┬───────┐
#  │header1│header2│
#  ├───────┼───────┤
#  │a1     │a2     │
#  │b1     │b2     │
#  └───────┴───────┘
```

This is the same as calling `render` directly on table instance with `:unicode` as the first argument:

```ruby
table.render(:unicode)
```

### 3.3 Options

Rendering of **TTY-Table** includes numerous customization options:

```ruby
alignments     # array of cell alignments out of :left, :center and :right,
               # default :left
border         # hash of border options - :characters, :style and :separator
border_class   # a type of border to use such as TTY::Table::Border::Null,
               # TTY::Table::Border::ASCII, TTY::Table::Border::Unicode
column_widths  # array of maximum column widths
filter         # a proc object that is applied to every field in a row
indent         # indentation applied to rendered table, by default 0
multiline      # if true will wrap text at new line or column width,
               # when false will escape special characters
padding        # array of integers to set table fields padding,
               # by default [0,0,0,0]
resize         # if true will expand/shrink table column sizes to match
               # the terminal width, otherwise if false will rotate
               # table vertically. By default set to false
width          # constrain the table total width, by default dynamically
               # calculated based on content and terminal size
```

The `render` method can accept as a second argument the above options either as hash value:

```ruby
table.render(:basic, alignments: [:left, :center])
```

or inside a block:

```ruby
table.render(:basic) do |renderer|
  renderer.alignments= [:left, :center]
end
```

### 3.4 Alignment

By default all columns are `:left` aligned.

You can align each column individuall by passing `alignments` option to table renderer:

```ruby
table.render :ascii, alignments: [:center, :right]
# =>
#  +-------+-------+
#  |header1|header2|
#  +-------+-------+
#  |  a1   |     a2|
#  |  b1   |     b2|
#  +-------+-------+
```

Alternatively you can align all columns with `alignment` option:

```ruby
table.render :ascii, alignment: [:center]
# =>
#  +-------+-------+
#  |header1|header2|
#  +-------+-------+
#  |  a1   |  a2   |
#  |  b1   |  b2   |
#  +-------+-------+
```

If you require a more granular alignment you can align individual fields in a row by passing `:alignment` option like so:

```ruby
table = TTY::Table.new header: ['header1', 'header2']
table << [{value: 'a1', alignment: :right}, 'a2']
table << ['b1', {value: 'b2', alignment: :center}]
```

and then simply render:

```ruby
table.render(:ascii)
# =>
#  +-------+-------+
#  |header1|header2|
#  +-------+-------+
#  |     a1|a2     |
#  |b1     |  b2   |
#  +-------+-------+
```

### 3.5 Border

To print border around data table you need to specify `renderer` type out of `basic`, `ascii`, `unicode`. By default `basic` is used. For instance, to output unicode border:

```ruby
table = TTY::Table.new ['header1', 'header2'], [['a1', 'a2'], ['b1', 'b2']]
table.render :unicode
# =>
#  ┌───────┬───────┐
#  │header1│header2│
#  ├───────┼───────┤
#  │a1     │a2     │
#  │b1     │b2     │
#  └───────┴───────┘
```

or by creating unicode renderer:

```ruby
renderer = TTY::Table::Renderer::Unicode.new(table)
renderer.render
```

#### 3.5.1 Parts

The following are available border parts:

| Part          | ASCII | Unicode |
| ------------- |:-----:|:-------:|
|  top          | `-`   | `─`     |
|  top_mid      | `+`   | `┬`     |
|  top_left     | `+`   | `┌`     |
|  top_right    | `+`   | `┐`     |
|  bottom       | `-`   | `─`     |
|  bottom_mid   | `+`   | `┴`     |
|  bottom_left  | `+`   | `└`     |
|  bottom_right | `+`   | `┘`     |
|  mid          | `-`   | `─`     |
|  mid_mid      | `+`   | `┼`     |
|  mid_left     | `+`   | `├`     |
|  mid_right    | `+`   | `┤`     |
|  left         | `|`   | `│`     |
|  center       | `|`   | `│`     |
|  right        | `|`   | `│`     |

Using the above border parts you can create your own border with the `border` helper:

```ruby
table = TTY::Table.new ['header1', 'header2'], [['a1', 'a2'], ['b1', 'b2']
table.render do |renderer|
  renderer.border do
    mid          '='
    mid_mid      ' '
  end
end
# =>
#  header1 header2
#  ======= =======
#  a1      a2
#  b1      b2
```

#### 3.5.2 Custom

You can also create your own custom border by subclassing `TTY::Table::Border` and implementing the `def_border` method using internal DSL methods like so:

```ruby
class MyBorder < TTY::Table::Border
  def_border do
    left         '$'
    center       '$'
    right        '$'
    bottom       ' '
    bottom_mid   '*'
    bottom_left  '*'
    bottom_right '*'
  end
end
```

Next pass the border class to your table instance `render_with` method

```ruby
table = TTY::Table.new ['header1', 'header2'], [['a1', 'a2'], ['b1', 'b2']
table.render_with MyBorder
# =>
#  $header1$header2$
#  $a1     $a2     $
#  *       *       *
```

#### 3.5.3 Separator

In addition to specifying border characters you can force the table to render a separator line on each row like:

```ruby
table = TTY::Table.new ['header1', 'header2'], [['a1', 'a2'], ['b1', 'b2']]
table.render do |renderer|
  renderer.border.separator = :each_row
end
# =>
#  +-------+-------+
#  |header1|header2|
#  +-------+-------+
#  |a1     |a2     |
#  +-------+-------+
#  |b1     |b2     |
#  +-------+-------+
```

If you want more control you can provide an array of rows *after* which a separator will be added:

```ruby
table = TTY::Table.new ['header1', 'header2'], [['a1', 'a2'], ['b1', 'b2'], ['c1', 'c2']]
table.render do |renderer|
  renderer.border.separator = [0, 2]
end
# =>
#  +-------+-------+
#  |header1|header2|
#  +-------+-------+
#  |a1     |a2     |
#  |b1     |b2     |
#  +-------+-------+
#  |c1     |c2     |
#  +-------+-------+
```

**Note:** if you supply a detailed list of rows to separate, then the separator between the header and the rows
will not be automatically added.

You can also give the separator option a proc to control where the separators are:

```ruby
table = TTY::Table.new ['header1', 'header2'],
                       [['a1', 'a2'], ['b1', 'b2'], ['c1', 'c2'], ['d1', 'd2']]
table.render do |renderer|
  renderer.border.separator = ->(row) { row == 0 || (row+1) % 2 == 0} # separate every two rows
end
# =>
#  +-------+-------+
#  |header1|header2|
#  +-------+-------+
#  |a1     |a2     |
#  |b1     |b2     |
#  +-------+-------+
#  |c1     |c2     |
#  |d1     |d2     |
#  +-------+-------+
```

Finally you can also position a separator using the `:separator` key word in place of a row:

```ruby
table = TTY::Table.new ['header1', 'header2'],
                       [:separator, ['a1', 'a2'], ['b1', 'b2']]
table << :separator << ['c1', 'c2']  # you can push separators on too!
table.render
# =>
#  +-------+-------+
#  |header1|header2|
#  +-------+-------+
#  |a1     |a2     |
#  |b1     |b2     |
#  +-------+-------+
#  |c1     |c2     |
#  +-------+-------+
```

#### 3.5.4 Style

If you want to change the display color of your border do:

```ruby
table.render do |renderer|
  renderer.border.style = :green
end
```

All [supported colors](https://github.com/piotrmurach/pastel#3-supported-colors) are provided by the **Pastel** dependency.

### 3.6 Filter

You can define filters that will modify individual table fields value before they are rendered. A filter can be a callable such as proc. Here's an example that formats

```ruby
table = TTY::Table.new ['header1', 'header2'], [['a1', 'a2'], ['b1', 'b2']]
table.render do |renderer|
  renderer.filter = Proc.new do |val, row_index, col_index|
    if col_index == 1 and !(row_index == 0)
      val.capitalize
    else
      val
    end
  end
end
# =>
#  +-------+-------+
#  |header1|header2|
#  +-------+-------+
#  |a1     |A2     |
#  +-------+-------+
#  |b1     |B2     |
#  +-------+-------+
```

To color even fields red on green background add filter like so

```ruby
pastel = Pastel.new

table.render do |renderer|
  renderer.filter = proc do |val, row_index, col_index|
    col_index % 2 == 1 ? pastel.red.on_green(val) : val
  end
end
```

### 3.7 Multiline

Renderer options may include `multiline` parameter. When set to `true`, table fields will wrap at their natural line breaks or the column widths(if provided).

```ruby
table = TTY::Table.new [ ["First", '1'], ["Multi\nLine\nContent", '2'], ["Third", '3']]
table.render :ascii, multiline: true
# =>
#  +-------+-+
#  |First  |1|
#  |Multi  |2|
#  |Line   | |
#  |Content| |
#  |Third  |3|
#  +-------+-+
```

When `multiline` is set to `false`, all line break characters will be escaped. In cases when the column widths are set, the content will be truncated.

```ruby
table = TTY::Table.new [["First", '1'], ["Multiline\nContent", '2'], ["Third", '3']]
table.render :ascii, multiline: false
# =>
#  +------------------+-+
#  |First             |1|
#  |Multiline\nContent|2|
#  |Third             |3|
#  +------------------+-+
```

### 3.8 Padding

Renderer also accepts `padding` option which accepts array with arguments similar to CSS padding.

```ruby
[2,2,2,2]  # => pad left and right with 2 characters, add 2 lines above and below
[1,2]      # => pad left and right with 2 characters, add 1 line above and below
1          # => pad left and right with 1 character, and 1 lines above and below
```

Therefore, to apply padding to the example table do:

```ruby
table.render(:ascii, padding: [1,2,1,2])
# =>
#  +---------+---------+
#  |         |         |
#  | header1 | header2 |
#  |         |         |
#  +---------+---------+
#  |         |         |
#  | a1      | a2      |
#  |         |         |
#  |         |         |
#  | b1      | b2      |
#  |         |         |
#  +---------+---------+
```

However, when adding top or bottom padding to content with line breaks, the `multiline` option needs to be set to `true` to allow for rows to span multiple lines. For example:

```ruby
table = TTY::Table.new header: ['head1', 'head2']
table << ["Multi\nLine", "Text\nthat\nwraps"]
table << ["Some\nother\ntext", 'Simple']
```

would render as:

```ruby
table.render :ascii, multiline: true, padding: [1,2,1,2]
# =>
#  +---------+----------+
#  |         |          |
#  |  h1     |  head2   |
#  |         |          |
#  +---------+----------+
#  |         |          |
#  |  Multi  |  Text    |
#  |  Line   |  that    |
#  |         |  wraps   |
#  |         |          |
#  |         |          |
#  |  Some   |  Simple  |
#  |  other  |          |
#  |  text   |          |
#  |         |          |
#  +---------+----------+
```

### 3.9 Resize

### 3.10 Width

To control table's column sizes pass `width`, `resize` options. By default table's natural column widths are calculated from the content. If the total table width does not fit in terminal window then the table is rotated vertically to preserve content.

The `resize` property will force the table to expand/shrink to match the terminal width or custom `width`. On its own the `width` property will not resize table but only enforce table vertical rotation if content overspills.

```ruby
header = ['h1', 'h2', 'h3']
rows   = [['aaa1', 'aa2', 'aaaaaaa3'], ['b1', 'b2', 'b3']]
table = TTY::Table.new header, rows
table.render width: 80, resize: true
# =>
#  +---------+-------+------------+
#  |h1       |h2     |h3          |
#  +---------+-------+------------+
#  |aaa1     |aa2    |aaaaaaa3    |
#  |b1       |b2     |b3          |
#  +---------+-------+------------+
```

## Contributing

1. Fork it ( https://github.com/piotrmurach/tty-table/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Copyright

Copyright (c) 2015 Piotr Murach. See LICENSE for further details.
