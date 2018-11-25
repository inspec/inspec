# Unit Testing Area for Plugins

## What Tests are Provided?

 * plugin_def_test.rb - Would be useful in any plugin.  Verifies that the plugin is properly detected and registered.
 <% if hooks.key?(:cli_command) %>
 * cli_args_test.rb - Tests the CLI options for a CLI Command plugin
 <% end %>

## What are Unit Tests?

Unit tests are tests that verify that the individual components of your plugin work as intended.  To be picked up by the Rake tasks as tests, each test file should end in `_test.rb`.

## Unit vs Functional Tests

A practical difference between unit tests and functional tests is that unit tests all run within one process, while functional tests might exercise a CLI plugin by shelling out to an inspec command in a subprocess, and examining the results.

