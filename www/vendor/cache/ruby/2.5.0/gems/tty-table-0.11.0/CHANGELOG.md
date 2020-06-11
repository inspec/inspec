# Change log

## [v0.11.0] - 2019-08-01

### Add
* Add ability to specify border separator as an Array, Proc value by Mitch VanDuyn(@catmando)

### Changed
* Change Indentation#indent to stop mutating input
* Change gemspec to load files directly
* Change to freeze strings
* Change to relax constraints on tty-screen & equatable
* Change to remove upper boundary on bundler dev dependency

## [v0.10.0] - 2018-02-18

### Changed
* Change to limit Ruby version to 2.0
* Change to use strings instead of verse
* Change Field to rely on Strings#display_width
* Change Operations to stop accepting table at initialization
* Change Operations#run_operations to #apply_to
* Change Border to remove padding configuration
* Change ColumnSet class to Columns stateless module
* Change Indentation class to stateless module

### Fixed
* Fix :resize option to honour :padding values

## [v0.9.0] - 2017-11-04

### Changed
* Change ColumnSet class to Columns
* Change gemset to require Ruby >= 2.0.0
* Change to update tty-screen dependency

## [v0.8.0] - 2017-02-27

### Changed
* Change necromancer dependency to fix Ruby 2.4.0
* Change to use relative paths to load files

## [v0.7.0] - 2017-01-15

### Changed
* Change loading of dependencies and required files
* Change pastel dependency version

## [v0.6.0] - 2016-10-26

### Changed
* Change to use unicode-display_width dependency
* Upgrade verse dependency

## [v0.5.0] - 2016-02-11

### Changed
* Upgrade pastel & tty-screen dependencies
* Remove unused parameters from Operations::Padding

### Fixed
* Fix all warnings

## [v0.4.0] - 2015-09-20

### Changed
* Update dependencies on tty-screen and pastel

## [v0.3.0] - 2015-07-06

### Changed
* Change benchmarks to reflect API
* Change dependency on tty-screen

## [v0.2.0] - 2015-03-30

### Added
* Add UTF-8 support for operations
* Add AlignmentSet for alignments storage
* Add tests for multilne column widths

### Changed
* Change Table each_with_index to iterate over rows
* Change Alignment operation to use AlignmentSet
* Change Columns to directly depend on table data
* Change Indentation to stop relying on renderer
* Change Border to accept padding as argument
* Change and extract padding operation
* Change Columns to ColumnConstraint and refactor enforce
* Remove padding from wrapped operation to fully rely on Verse.wrap
* Remove color renderer
* Remove adjust_padding from Columns

### Fixed
* Fix table rendering for UTF-8 content
* Fix alignment to allow for individual field alignment
* Fix bug with padding operation
* Fix table border and content coloring
* Fix bug with table rerendering to allow for multiple renders
* Fix bug with ANSI codes in table content

## [v0.1.0] - 2015-02-08

* Initial implementation and release

[v0.11.0]: https://github.com/piotrmurach/tty-table/compare/v0.10.0...v0.11.0
[v0.10.0]: https://github.com/piotrmurach/tty-table/compare/v0.9.0...v0.10.0
[v0.9.0]: https://github.com/piotrmurach/tty-table/compare/v0.8.0...v0.9.0
[v0.8.0]: https://github.com/piotrmurach/tty-table/compare/v0.7.0...v0.8.0
[v0.7.0]: https://github.com/piotrmurach/tty-table/compare/v0.6.0...v0.7.0
[v0.6.0]: https://github.com/piotrmurach/tty-table/compare/v0.5.0...v0.6.0
[v0.5.0]: https://github.com/piotrmurach/tty-table/compare/v0.4.0...v0.5.0
[v0.4.0]: https://github.com/piotrmurach/tty-table/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/piotrmurach/tty-table/compare/v0.2.0...v0.3.0
[v0.2.0]: https://github.com/piotrmurach/tty-table/compare/v0.1.0...v0.2.0
[v0.1.0]: https://github.com/piotrmurach/tty-table/compare/v0.1.0
