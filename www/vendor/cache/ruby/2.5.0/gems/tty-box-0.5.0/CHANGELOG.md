# Change log

## [v0.5.0] - 2019-10-08

### Added
* Add ability to create frames without specifying width or height
* Add #info, #warn, #success, #error ready frames for status messages inspired by conversation with Konstantin Gredeskoul(@kigster)

### Changed
* Change #frame to accept content as an argument in addition to a block
* Change to match titles with border styling

## [v0.4.1] - 2019-08-28

### Added
* Add example to demonstrate different line endings

### Fixed
* Fix to handle different line endings

## [v0.4.0] - 2019-06-05

### Changed
* Change gemspec to require Ruby >= 2.0.0
* Change to update tty-cursor dependency

### Fixed
* Fix issue with displaying box with colored content

## [v0.3.0] - 2018-10-08

### Added
* Add border parameters :top_left, :top_right, :bottom_left & :bottom_right to allow specifying values for box corners
* Add :ascii border type for drawing ASCII boxes

### Fixed
* Fix box color fill to correctly recognise missing borders and match the height and width
* Fix absolute content positioning when borders are missing

## [v0.2.1] - 2018-09-10

### Fixed
* Fix content alignment by @DannyBen

## [v0.2.0] - 2018-07-31

### Changed
* Change to stop positioning box without `:top` & `:left` coordinates
* Change to load manually required files in gemspec without using git

## [v0.1.0] - 2018-07-23

* Initial implementation and release

[v0.5.0]: https://github.com/piotrmurach/tty-box/compare/v0.4.1...v0.5.0
[v0.4.1]: https://github.com/piotrmurach/tty-box/compare/v0.4.0...v0.4.1
[v0.4.0]: https://github.com/piotrmurach/tty-box/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/piotrmurach/tty-box/compare/v0.2.1...v0.3.0
[v0.2.1]: https://github.com/piotrmurach/tty-box/compare/v0.2.0...v0.2.1
[v0.2.0]: https://github.com/piotrmurach/tty-box/compare/v0.1.0...v0.2.0
[v0.1.0]: https://github.com/piotrmurach/tty-box/compare/v0.1.0
