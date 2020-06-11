## 1.3.1 (2015-04-05)

* Feature: [#53](https://github.com/savonrb/gyoku/pull/53) Improved serialization of hashes nested in arrays. Thanks to @riburkes for this!

## 1.3.0 (2015-03-30)

* Formally drop support for ruby 1.8.7

## 1.2.3 (2015-03-10)

# Feature: [#52](https://github.com/savonrb/gyoku/pull/52) Adds an :unwrap option that allows an array of hashes to be unwrapped into a single array xml node, rather than one per hash.

## 1.2.2 (2014-09-22)

* Fixed a bug introduced by making Gyoku threadsafe. Who knew that `$1` and the block variable that `#gsub` provides are not the same?

## 1.2.1 (2014-09-22)

* Fix : [#46](https://github.com/savonrb/gyoku/pull/46) Fixed an issue where Gyoku was not threadsafe. Gyoku should now be relatively more threadsafe due to less usage of global variables.

## 1.2.0 (2014-09-18)

* Feature: [#44](https://github.com/savonrb/gyoku/pull/44) support for sorting via :order! with a string key

## 1.1.1 (2014-01-02)

* Feature: [#38](https://github.com/savonrb/gyoku/pull/38) support for building nested Arrays
* Feature: [#36](https://github.com/savonrb/gyoku/pull/36) allow setting any objects content with :content!
* Deprecation:  Support for ree and ruby 1.8.7 will be going away soon.

## 1.1.0 (2013-07-26)

* Feature: [#30](https://github.com/savonrb/gyoku/pull/30) support for building Arrays
  of parent tags using @attributes.

* Fix: [#21](https://github.com/savonrb/gyoku/pull/21) stop modifying the original Hash.
  The original issue is [savonrb/savon#410](https://github.com/savonrb/savon/issues/410).

## 1.0.0 (2012-12-17)

* Refactoring: Removed the global configuration. This should really only affect the
  `Gyoku.convert_symbols_to` shortcut which was removed as well. If you're using Gyoku
  with Savon 2.0, there's now an option for that. If you're using Gyoku on itself,
  you can pass it the `:key_converter` option instead.

## 0.5.0 (2012-12-15)

Feature: [#19](https://github.com/savonrb/gyoku/pull/19) adds support for explicit XML attributes.

Feature: [#17](https://github.com/savonrb/gyoku/pull/17) adds an `:upcase` formula.

## 0.4.6 (2012-06-28)

* Fix: [#16](https://github.com/rubiii/gyoku/issues/16) Date objects were mapped like DateTime objects.

      Gyoku.xml(date: Date.today)  # => "<date>2012-06-28</date>"

* Fix: Time objects were also mapped like DateTime objects.

      Gyoku.xml(time: sunday)  # => "<time>16:22:33</time>"

## 0.4.5 (2012-05-28)

* Fix: [issue 8](https://github.com/rubiii/gyoku/issues/8) -
  Conflict between camelcase methods in Rails.

* Fix: [pull request 15](https://github.com/rubiii/gyoku/pull/15) -
  Gyoku generates blank attribute values if there are fewer attribute
  values in attributes! than elements.

* Fix: [issue 12](https://github.com/rubiii/gyoku/issues/12) -
  Don't remove special keys from the original Hash.

## 0.4.4

* Fix: [issue 6](https://github.com/rubiii/gyoku/issues/6) -
  `Gyoku.xml` does not modify the original Hash.

## 0.4.3

* Fix: Make sure `require "date"` when necessary.

## 0.4.2

* Fix: `Array.to_xml` so that the given :namespace is applied to every element
  in an Array.

## 0.4.1

* Fix: Alternative formulas and namespaces.

## 0.4.0

* Feature: Added alternative Symbol conversion formulas. You can choose between
  :lower_camelcase (the default), :camelcase and :none.

      Gyoku.convert_symbols_to :camelcase

  You can even define your own formula:

      Gyoku.convert_symbols_to { |key| key.upcase }

## 0.3.1

* Feature: Gyoku now calls Proc objects and converts their return value.

## 0.3.0

* Feature: Now when all Hash keys need to be namespaced (like with
  elementFormDefault), you can use options to to trigger this behavior.

      Gyoku.xml hash,
        :element_form_default => :qualified,
        :namespace => :v2

## 0.2.0

* Feature: Added support for self-closing tags. Hash keys ending with a forward
  slash (regardless of their value) are now converted to self-closing tags.

## 0.1.1

* Fix: Allow people to use new versions of builder.

## 0.1.0

* Initial version. Gyoku was born as a core extension inside the
  [Savon](http://rubygems.org/gems/savon) library.
