### 1.3.0 / 2019-04-09
[full changelog](http://github.com/rspec/rspec-its/compare/v1.2.0...v1.3.0)

Enhancements:
* Introduced `will` and `will_not` as to allow one line block expectations.
  (Russ Buchanan, #67)

### 1.2.0 / 2015-02-06
[full changelog](http://github.com/rspec/rspec-its/compare/v1.1.0...v1.2.0)

Breaking Changes:

Enhancements:
* Introduced `are_expected` as alias for `is_expected`

Bug fixes:
* Restored ability to pass key/value metadata parameters, broken by https://github.com/rspec/rspec-its/commit/71307bc7051f482bfc2798daa390bee9142b0d5a

### 1.1.0 / 2014-04-13
[full changelog](http://github.com/rspec/rspec-its/compare/v1.0.1...v1.1.0)

Breaking Changes:

Enhancements:
* For hashes, multiple array elements are treated as successive access keys
* Metadata arguments are now supported

Bug fixes:
* Enable `its` example selection by line number in command line


### 1.0.1 / 2014-04-13
[full changelog](http://github.com/rspec/rspec-its/compare/v1.0.0...v1.0.1)

Bug fixes:
* Maintain implicit subject in all cases (addresses problem with latest RSpec 3 version)

### 1.0.0 / 2014-02-07
[full changelog](http://github.com/rspec/rspec-its/compare/v1.0.0.pre...v1.0.0)

Breaking Changes:

Enhancements:
* Add `is_expected` support to match RSpec 3.0

Deprecations:

Bug Fixes:
* Report failures and backtrace from client perspective

### 1.0.0.pre / 2013-10-11

Features

* Initial extraction of `its()` functionality to separate gem

