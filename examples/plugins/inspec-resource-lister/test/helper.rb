# Test helper file for example plugins

# This file's job is to collect any libraries needed for testing, as well as provide
# any utilities to make testing a plugin easier.

# InSpec core provides a number of such libraries and facilities, in the file
# lib/pligins/shared/core_plugin_test_helper.rb . So, one job in this file is
# to locate and load that file.

require 'inspec/../plugins/shared/core_plugin_test_helper'

# You can select from a number of test harnesses.  Since InSpec uses Spec-style controls
# in profile code, you will probably want to use something like minitest/spec, which provides
# Spec-style tests.
require 'minitest/autorun'
require 'minitest/spec'
