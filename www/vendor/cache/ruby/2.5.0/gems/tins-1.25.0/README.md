# Tins - Useful tools library in Ruby

## Description

Non yet.

## Badges

[![Code Climate](https://codeclimate.com/github/flori/tins.png)](https://codeclimate.com/github/flori/tins)

[![Code Coverage](https://codeclimate.com/github/flori/tins/coverage.png)](https://codeclimate.com/github/flori/tins)

## Changes


* 2018-11-14 Release 1.20.2
 - Fix ~x options
* 2018-11-14 Release 1.20.1
 - Add disabling boolean options in Tins::GO#go method.
* 2018-11-14 Release 1.20.0
 - Support default arguments in Tins::GO#go method.
* 2018-11-07 Release 1.19.0
 - Allow annotations without arguments
* 2018-11-02 Release 1.18.0
 - `thread_local` and `thread_global` with default block
* 2018-10-15 Release 1.17.0
 - Add Tins::TempIO::Enum class to wrap `temp_io` into Enumerator.
* 2017-12-05 Release 1.16.3
 - Improve `temp_io` method by not changing working dir.
* 2017-12-05 Release 1.16.2
 - Improve `temp_io` method with a given name.
* 2017-12-05 Release 1.16.1
 - Improve `temp_io` method with block
* 2017-11-29 Release 1.16.0
 - Prove `temp_io` method with block
* 2017-06-29 Release 1.15.0
 - Add support for smart duration formats with %D directive
* 2017-05-16 Release 1.14.0
 - Add visit proc to determine if file should be visited.
* 2017-05-14 Release 1.13.3
 - Fix some debugging warnings
* 2017-02-03 Release 1.13.2
  - Fix test on older rubies
* 2016-11-23 Release 1.13.1
  - Fix comparibility of Tins::Duration instances
* 2016-11-23 Release 1.13.0
  - Add expose method mostly for testing hidden methods.
* 2016-08-04 Release 1.12.0
  - Add Tins::Unit.parse? method to check for units in strings.
* 2016-07-12 Release 1.11.0
  - Provide Tins::Unit.format and Tins::Unit.parse methods.
* 2016-05-25 Release 1.10.2
  - Avoid some warnings.
* 2016-04-15 Release 1.10.1
  - Fix bug in go if a concatenated argument comes last.
* 2016-04-12 Release 1.10.0
  - Support mixed rest arguments in go argument parsing.
* 2016-03-10 Release 1.9.0
  - Add Tins::Duration for displaying durations.
* 2016-01-18 Release 1.8.2
  - Implement Tins::StringVersion::Version#dup and
    Tins::StringVersion::Version#clone.
* 2015-12-03 Release 1.8.1
  - Remove some backports already existant in the newer supported rubies.
* 2015-12-01 Release 1.8.0
  - Add `foo_of` and `foo_annotations` methods to instances of classes with
    annotated methods.
* 2015-11-09 Release 1.7.0
  - Officially require ruby >= 2.0 and use new hash syntax.
  - New feature attempt: sleep:-30 sleeps upto 30 seconds while retrying with
    an exponential waiting pattern.
  - Remove rotate and shuffle, recent rubies all support them.
  - Add an object oriented view on method signatures and use it to create
    method descriptions.
* 2015-08-13 Release 1.6.0
  - Add complete method for readline completion
* 2015-06-21 Release 1.5.4
 - Avoid %i syntax for now
* 2015-06-17 Release 1.5.3
  - Make it run on 1.9 again.
  - Avoid a warning in Time.dummy implementation.
* 2015-05-27 Release 1.5.2
  - Fix parameter naming for c-methods in method descriptions.
* 2015-04-24 Release 1.5.0/1.5.1
  - Implement bump logic for StringVersion
* 2015-04-23 Release 1.4.0
  - Add implement module helper method.
* 2015-03-03 Release 1.3.5
  - Don't automatically include #to method into Object, this can lead to some
    confusion.
* 2015-02-04 Release 1.3.4
  - Add some default alphabets to Tins::Token, e. g. Base64
  - Add changes to Readme

## Download

The homepage of this library is located at

* http://flori.github.com/tins

## Author

Florian Frank mailto:flori@ping.de

## License

This software is licensed under the MIT (Expat) license.
