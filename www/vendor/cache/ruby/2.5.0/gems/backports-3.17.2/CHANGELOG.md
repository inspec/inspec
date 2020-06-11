# Changelog

All notable changes to this project will be documented in this file.

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

Note: [Next major version (X-mas 2020)](https://github.com/marcandre/backports/issues/139) will drop support for Ruby < 2.2.

## [3.17.1](https://github.com/marcandre/backports/compare/v3.17.0...v3.17.1) - 2020-04-09

### Fixed

Fix Range#size (Ruby 2.0) on Ruby 1.8.7 [#144]

## [3.17.0](https://github.com/marcandre/backports/compare/v3.16.2...v3.17.0) - 2020-03-06

### Added

* Ruby 2.6 backports

  * Range
    * `cover?` (with `Range` argument)

### Changed

Requiring features for a particular version of Ruby or `latest` is un-deprecated but
instead simply warned in verbose mode.

## [3.16.1](https://github.com/marcandre/backports/compare/v3.16.0...v3.16.1) - 2020-02-16

### Deprecated

Officially deprecate requiring features for a particular version of Ruby, `latest`, `std_lib` or `rails` backports.
Partly un-deprecated in 3.17.0!

### Fixed

`matrix` library when loaded in 2.7.0 [#141]

## [3.16.0](https://github.com/marcandre/backports/compare/v3.15.0...v3.16.0) - 2020-02-06

### Added

* Ruby 2.7 backports

  * Array
    * `intersection`

  * Comparable
    * `clamp` (with range)

  * Complex
    * `<=>`

  * Enumerable
    * `filter_map`
    * `tally`

  * Enumerator
    * `produce` (class method)

  * Time
    * `floor`, `ceil`

## [3.15.0] - 2019-05-15

### Added

  * Proc / Method
    * `<<`, `>>`

## 3.14.0 - 2019-04-29

### Added

  * Hash
    * `to_h` (with block)

## 3.13.0 - 2019-04-5

### Added

  * Hash
    * `merge`, `merge!`/`update` (with multiple arguments)

## 3.12.0 - 2019-02-20

### Added

* Ruby 2.6.0 backports
  * Array
    * `difference`, `union`
    * `to_h` (with block)

  * Enumerable
    * `chain`
    * `to_h` (with block)

  * Enumerator::Chain (use Enumerable#chain)
  * Kernel
    * `then`

* Additional backports for 2.5.0:
  * String
    * `undump`

## 3.11.0 - 2017-12-25

### Added

* Ruby version 2.5.0 backports
  * Array
    * `append`, `prepend`

  * Dir
    * `children`, `each_child`

  * Enumerable
    * `any?`, `all?`, `none?`, `one?` (with pattern argument)

  * Hash
    * `slice`
    * `transform_keys`

  * Integer
    * `sqrt`
    * `allbits?`, `anybits?` and `nobits?`

  * Kernel
    * `yield_self`

  * Module
    * `attr`, `attr_accessor`, `attr_reader`, `attr_writer` (now public)
    * `define_method`, `alias_method`, `undef_method`, `remove_method`
            (now public)

  * String
    * `delete_prefix`, `delete_prefix!`
    * `delete_suffix`, `delete_suffix!`

  * Struct
    * `new` (with `keyword_init: true`)

* `require 'backports/latest'` is now the way to require everything, but is
    discouraged

## 3.10.0 - 2017-10-17

### Added

* Additional features of 2.4.0
  * Enumerable
    * `uniq`
    * `sum`

  * Hash
    * `compact`
    * `transform_values`

## 3.9.0 - 2017-10-07

### Added

* From 2.4.0: `dup` for `true`, `false`, `nil`, Numeric
* From 2.2.0: `Method#super_method`

## 3.8.0 - 2017-04-26

### Added

* From 2.4.0: `String#match?`, `Regexp#match?`

* From 2.3.0:
  * unary `String#+`, `-`
  * Numeric: `positive?`, `negative?`
  * Hash: `to_proc`, `fetch_values`, `>`, `<`, `>=`, `<=`
  * Enumerable: `chunk_while`, `grep_v`
  * `{Array|Hash|Struct}#dig`
  * `Array#bsearch_index`

* From 2.2.0:
  * `Method#curry`
  * `String#unicode_normalize{|?|!}`
  * `Kernel#itself`
  * Float: `next_float`, `prev_float`

## 3.7.0 - 2017-03-28

Initiate work on backports of 2.2, 2.3, 2.4

### Added

* From 2.4.0:
  * `Comparable#clamp`

* From 2.2.0:
  * Enumerable: `slice_when`, `slice_after`

## 3.6.0 - 2014-02-14

### Added

* Additional features of 2.1.0
  * Bignum#bit_length
  * Fixnum#bit_length
  * Module#include (now public)

## 3.5.0 - 2014-02-3

### Added

* Additional features of 2.0.0
  * Range#size

## 3.4.0 - 2013-12-29

### Added

* Additional features of 2.1.0
  * Array#to_h, Enumerable#to_h

## 3.3.0 - 2013-04-03

### Fixed

* Moved `Proc#yield` & `Hash#key` from 1.8.7 to 1.9.1

## 3.2.0 - 2013-04-02

### Fixed

* Moved `Dir.mktmpdir` to the stdlib 'tmpdir' for Ruby 1.8.7

### Removed

* Removed `returning` as it is no longer part of Rails.

## 3.1.0 - 2013-03-05

### Added

* Backports can now be loaded separately!

### Fixed

* Small tweaks and fixes for many methods to pass more RubySpecs

## 3.0.0 - 2013-02-24

### Added

* Additional features of 2.0.0
  * Struct#to_h, NilClass#to_h, Hash#to_h
  * Hash#default_proc = nil
  * OpenStruct lib

* 1.8.7's Enumerator#with_index (it wasn't in the 1.8.7 NEWS file...)

## 2.8.0 - 2013-02-3

### Added

* Added some features of 2.0.0 (must be required explicitly until official
    release):
  * Array#bsearch
  * Range#bsearch

## 2.7.0 - 2013-01-14

### Added

* Features of 2.0.0 (must be required explicitly until official
    release):
  * Enumerable#lazy
  * Enumerator::Lazy

## 2.6.0 - 2012-05-29

### Removed

* Enumerable#join

## 2.5.0 - 2012-02-25

### Added

* Some features of 1.9.3:
  * IO::NULL
  * IO#advise
  * String#byteslice
  * String#prepend

## 2.4.0 - 2012-02-24

### Added

* Add backporting for libraries

* Bring libraries up to date:
  * Matrix
  * Prime
  * Set

* Some features of 1.9.3:
  * IO.write, IO.binwrite

* Forcing backports (must be required explicitly):
  * Hash#select (returns a Hash instead of an Array)
  * Enumerable / Array#map (returns an enumerator when called without a
        block)
  * String#length, size (for UTF-8 support)

## 2.3.0 - 2011-05-13

### Added

* `Enumerator::Yielder#<<`

## 2.2.0 - 2011-05-13

### Fixed

* Ruby 1.8.8 was officially cancelled; code was moved to Ruby 1.9.1 and
    README updated.

* `"".ord` now raises an error.

## 2.1.0 - 2011-04-16

### Added

* Proc#curry, #lambda (thanks Konstantine Haase)

## 2.0.0 - 2010-12-5

### Fixed

Change of major version because of two small changes that are not quite
compatible and because the minor version was getting quite high!

* Remove attempt at faking the new method missing. Unless you used
    `respond_to_missing` **and**
    `method(:some_method_handled_with_method_missing)`, you won't see a
    difference, except better performance (see issue #32) and this fixes some
    errors (see issue #34)

* Change behavior of array.flatten(0) to match Ruby 1.9 (i.e. return a dup
    of array, instead of array itself)

## 1.18.0 - 2010-06-19

### Added

* Some features of 1.9.1:

  * Math#log2, Math#log with base

### Fixed

* Enumerator#each in 1.8.6.

## 1.17.0 - 2010-05-17

### Added

* Some features of 1.9.2:

  * Array#repeated_combination, #repeated_permutation

## 1.16.2 - 2010-04-11

### Added

* Some features of 1.9.2:

  * Array#uniq, #uniq! (with block)
  * Array#product (with block)
  * Dir.home
  * Hash#keep_if, select!
  * Random (new class)

## 1.15.0 - 2010-02-23

### Added

* A features of 1.9.2:

  * Object#singleton_class

## 1.14.0 - 2010-02-3

### Added

* Some features of 1.9.2:

  * Array#rotate, rotate!
  * Array#keep_if, select!
  * Array#sort_by!
  * Enumerable#join
  * Enumerable#slice_before
  * Float::INFINITY, NAN
  * MatchData#==

## 1.13.0 - 2010-01-20

### Added

* Missing for 1.8.7 were
  * Array#permutation
  * Hash#hash  (was only inherited)
  * Hash#eql?  (was only inherited)

## 1.12.0 - 2009-12-4

### Added

* Finer grain includes (see README) require "backports/1.9"    # requires
    all ruby backports require "backports/1.9.1"  # requires all ruby
    backports up to 1.9.1 (but not 1.9.2)

* Backported all builtin methods of 1.8.8 (most of which where moved from
    the 1.9 backports)

* Refreshed README

## 1.11.0 - 2009-11-04

### Added

* Enumerable#flat_map / collect_concat (Ruby 1.9)

* Object#public_send (Ruby 1.9)

* Object#public_method (Ruby 1.9)

## 1.10.0 - 2009-09-29

### Added

* Enumerable#chunk (Ruby 1.9)

* Kernel#respond_to_missing? (Ruby 1.9)

* Completed Process.exec (Ruby 1.8.7)

## 1.9.0 - 2009-09-04

### Added

* In Ruby 1.9, most class methods of File accept filenames as String, or
    convertible via #to_str or #to_path.

* File#to_path is also an alias to File#path. These have been backported.

* File.binread (actually IO.binread)

* BasicObject available via "require 'backports/basic_object"

## 1.8.4 - 2009-09-03

### Added

`Dir.mktmpdir` for older version of 1.8.6

## 1.8.1 - 2009-09-01

### Added

The alias String#lines (Ruby 1.8.7)

## 1.8.0 - 2009-08-30

### Added

Backports can be required selectively:
* backports/1.8.7
* backports/1.9 (which include 1.8.7)
* rails

## 1.7.1 - 2009-08-20

### Fixed

`Enumerable#take` and `Enumerable#first(n)` are now returning as soon as possible.
Previously, `#each` was yielding one element too many. See redmine issue #1554.

## 1.7.0 - 2009-05-27

### Fixed

Porting all 1.8.7 features to rubinius was quite enlightening
(http://blog.marc-andre.ca/2009/05/schizo-ruby-puzzle.html ). Many
improvements were made to be consistent with MRI, e.g. converting arguments
using to_int if needed, etc... The changes are now reflected in 'backports'.

### Added

Some IO and ARGF methods were missing and are now complete.

## 1.6.6 - 2009-04-30

### Fixed

Important bug fix. `String#gsub` is left alone until I find a good way to modify
it.

## 1.6.0 - 2009-04-29

### Added

Completed backport to 1.8.7.

* Array
  * `extract_options!`

* Binding
  * `eval`

* Dir
  * `each`, `foreach`

* Enumerator
  * `new`
  * `with_object`
  * `next`, `rewind`

* Hash
  * Optional block for `delete_if, each, each_key, each_pair, each_value,
        reject!, select` (and ENV)

* Integer
  * moved stuff out of Fixnum
  * Optional block for `downto`, `times`, `upto`

* IO
  * Optional block for `each`, `each_line`, `each_byte`, `foreach` (and
        ARGF)

* Kernel
  * `loop`, `StopIteration`
  * +__method__+, +__callee__+

* Method
  * `name`, `owner`, `receiver`

* Module
  * `class_exec`, `module_exec`

* Numeric
  * `step`

* Object
  * `define_singleton_method`
  * `instance_exec`

* ObjectSpace
  * `each_object`

* Range
  * Optional block for `each`, `step`

* Regexp
  * `union`

* String
  * `try_convert`
  * `ascii_only?`
  * `bytesize`
  * `chr`
  * `clear`
  * `codepoints`, `each_codepoint`
  * `stringify_keys`, `stringify_keys!`
  * `each`, `each_line`, `each_byte`
  * `gsub`
  * `upto`

* Struct
  * `each`, `each_pair`

* Symbol
  * `<=>`, `casecmp`
  * `capitalize`, `downcase`, `next`, `succ`, `swapcase`, `upcase`
  * `=~, [], empty?, length, match, size`

* UnboundMethod
  * `name`, `owner`

## 1.5.0 - 2009-04-24

### Added

* Array (completed)
  * `combination`
  * `try_convert`
  * Optional block for `collect!, :map!, :each, :each_index, :reject,
        :reject!, :delete_if`
  * `pop`, `shift`
  * `product`

* Fixnum (completed)
  * `div`, `fdiv`
  * `succ`
  * `magnitude`

* Enumerable (completed)
  * `each_with_object`
  * `inject`
  * `max_by`, `min_by`, `minmax`, `minmax_by`
  * `reduce`
  * `to_a`

## 1.4.0 - 2009-04-21

### Added

* String
  * `rpartition`

* Proc
  * `yield`

## 1.3.0 - 2009-04-17

### Added

* Enumerable
  * `none?`

* Array
  * `sample`, `shuffle`, `shuffle!`

* String
  * `each_char`, `chars`
  * `partition`

Tests and fixes for `String#start_with?` and `String#end_with?`

## 1.2.0 - 2009-04-12

### Added

* Array
  * `reverse_each`
  * `cycle`

* Enumerable
  * `reverse_each`
  * `each_slice`, `each_cons`
  * `count`
  * `cycle`
  * `group_by`

* Hash
  * `default_proc=`

## 1.1.0 - 2009-04-11

### Added

* Array
  * `flatten`, `flatten!`
  * `find_index`, `index`

* Hash
  * `reverse_merge`, `reverse_merge!`

## 1.0.0 - 2009-04-2

* Initial release.

## Notes

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

[Unreleased]: https://github.com/marcandre/backports/compare/v3.16.0...HEAD
[3.16.0]: https://github.com/marcandre/backports/compare/v3.15.0...v3.16.0
[3.15.0]: https://github.com/marcandre/backports/compare/v3.14.0...v3.15.0
