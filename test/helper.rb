
##
# Do not add any code above this line.

##
# Do not add any other code to this code block. Simplecov and
# coveralls only until the next code block:

require 'simplecov'
require 'coveralls'

SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
])

SimpleCov.start do
  add_filter '/test/'
  add_group 'Resources', 'lib/resources'
  add_group 'Matchers', 'lib/matchers'
  add_group 'Backends', 'lib/inspec/backend'
end

##
#
# Do not add any other code from here until the end of this code
# block.
#
# Before ANYTHING else happens, this must happen:
#
# 1) require minitest/autorun
# 2) alias describe to mt_describe
# 3) require rspec
# 4) disable_monkey_patching from rspec
# 5) alias mt_describe back to describe using change_global_dsl.
#
# Explanation: eventually, our tests get around to inspec/runner_rspec
# (and a few others), and they load rspec. When rspec loads, it
# creates it's own global `describe` method, overwriting minitest's.
# When you tell RSpec to disable_monkey_patching, instead of using
# remove_method, they use undef_method, which blocks access to our
# Kernel.describe. We then need to go back in and reactivate it in
# order for our tests to finish declaring their tests and eventually
# actually running.
#
# Before this, the tests would get to the point of loading rspec, then
# all subsequently loaded spec-style tests would just disappear into
# the aether. Differences in test load order created differences in
# test count and vast differences in test time (which should have been
# a clue that something was up--windows is just NOT THAT FAST).
#
# The OTHER way to fix this is to ban spec style tests in our
# codebase. This is a more rational approach but requires more work. I
# need these tests up and all running and dependable. We can make them
# right later.

require "minitest/autorun"

module Kernel
  alias mt_describe describe
end

require "rspec"

RSpec.configure do |config|
  config.disable_monkey_patching!
end

RSpec::Core::DSL.change_global_dsl do
  alias describe mt_describe
end

# End of rspec vs minitest fight
########################################################################

require 'webmock/minitest'
require 'mocha/setup'
require 'fileutils'
require 'pathname'
require 'tempfile'
require 'tmpdir'
require 'zip'
require 'json'

require 'inspec/base_cli'
require 'inspec/version'
require 'inspec/exceptions'
require 'inspec/fetcher'
require 'inspec/source_reader'
require 'inspec/reporters'
require 'inspec/backend'
require 'inspec/profile'
require 'inspec/runner'
require 'inspec/runner_mock'
require 'inspec/globals'
require 'inspec/impact'
require 'inspec/config'
require 'fetchers/mock'
require 'inspec/dependencies/cache'
require 'bundles/inspec-supermarket'
require 'train'

CMD = Train.create('local', command_runner: :generic).connection
TMP_CACHE = {}

Inspec::Log.logger = Logger.new(nil)

require "helpers/mock_loader"

def load_resource(*args)
  m = MockLoader.new(:ubuntu1404)
  m.send('load_resource', *args)
end

# Used to capture `Inspec.deprecate()` with warn action
def expect_deprecation_warning
  @mock_logger = Minitest::Mock.new
  @mock_logger.expect(:warn, nil, [/DEPRECATION/])
  Inspec::Log.stub :warn, proc { |message| @mock_logger.warn(message) } do
    yield
  end
  @mock_logger.verify
end

# Low-level deprecation handler. Use the more convenient version when possible.
# a_group => :expect_warn
# a_group => :expect_fail
# a_group => :expect_ignore
# a_group => :expect_something
# a_group => :tolerate # No opinion
# all => ... # Any of the 5 values above
# all_others => ... # Any of the 5 values above
def handle_deprecations(opts_in, &block)
  opts = opts_in.dup

  # Determine the default expectation
  opts[:all_others] = opts.delete(:all) if opts.key?(:all) && opts.count == 1
  expectations = {}
  expectations[:all_others] = opts.delete(:all_others) || :tolerate
  expectations.merge!(opts)

  # Expand the list of deprecation groups given
  known_group_names = Inspec::Deprecation::ConfigFile.new.groups.keys
  known_group_names.each do |group_name|
    next if opts.key?(group_name)
    expectations[group_name] = expectations[:all_others]
  end

  # Wire up Insepc.deprecator accordingly using mocha stubbing
  expectations.each do |group_name, expectation|
    inst = Inspec::Deprecation::Deprecator.any_instance
    case expectation
    when :tolerate
      inst.stubs(:handle_deprecation).with(group_name, anything, anything)
    when :expect_something
      inst.stubs(:handle_deprecation).with(group_name, anything, anything).at_least_once
    when :expect_warn
      inst.stubs(:handle_warn_action).with(group_name, anything).at_least_once
    when :expect_fail
      inst.stubs(:handle_fail_control_action).with(group_name, anything).at_least_once
    when :expect_ignore
      inst.stubs(:handle_ignore_action).with(group_name, anything).at_least_once
    when :expect_exit
      inst.stubs(:handle_exit_action).with(group_name, anything).at_least_once
    end
  end

  yield
end

# Use this to absorb everything.
def tolerate_all_deprecations(&block)
  handle_deprecations(all: :tolerate, &block)
end

def expect_deprecation_warning(group, &block)
  handle_deprecations(group => :expect_warn, all_others: :tolerate, &block)
end

def expect_deprecation(group, &block)
  handle_deprecations(group => :expect_something, all_others: :tolerate, &block)
end

class Minitest::Test
  raise "You must remove skip_now" if Time.now > Time.local(2019, 6, 14)

  def skip_until y,m,d,msg
    raise msg if Time.now > Time.local(y, m, d)
    skip msg
  end
end
