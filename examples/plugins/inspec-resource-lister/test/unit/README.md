# Unit Testing Area for Example Plugins

## What Example Tests are Provided?

Here, since this is a CliCommand plugin, we provide two sets of unit tests:

 * plugin_def_test.rb - Would be useful in any plugin.  Verifies that the plugin is properly detected and registered.
 * cli_args_test.rb - Verifies that the expected commands are present, and that they have the expected options and args.

## What are Unit Tests?

Unit tests are tests that verify that the individual components of your plugin work as intended.  To be picked up by the Rake tasks as tests, each test file should end in `_test.rb`.

## Unit vs Functional Tests

A practical difference between unit tests and functional tests is that unit tests all run within one process, while functional tests might exercise a CLI plugin by shelling out to an inspec command in a subprocess, and examining the results.

