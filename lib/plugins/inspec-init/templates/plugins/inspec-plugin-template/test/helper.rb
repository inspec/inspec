# Test helper file for non-core plugins

# This file's job is to collect any libraries needed for testing, as well as provide
# any utilities to make testing a plugin easier.

# InSpec core provides a number of such libraries and facilities, in the file
# lib/plugins/shared/core_plugin_test_helper.rb . So, one job in this file is
# to locate and load that file.
require 'inspec/../plugins/shared/core_plugin_test_helper'

# Also load the InSpec plugin system. We need this so we can unit-test the plugin
# classes, which will rely on the plugin system.
require 'inspec/plugin/v2'

# Caution: loading all of InSpec (i.e. require 'inspec') may cause interference with
# minitest/spec; one symptom would be appearing to have no tests.
# See https://github.com/inspec/inspec/issues/3380

# You can select from a number of test harnesses.  Since InSpec uses Spec-style controls
# in profile code, you will probably want to use something like minitest/spec, which provides
# Spec-style tests.
require 'minitest/autorun' # loads all styles and runs tests automatically

# You might want to put some debugging tools here.  We run tests to find bugs, after all.
require 'byebug'
