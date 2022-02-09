##
# Do not add any code above this line.

##
# Do not add any other code to this code block. Simplecov
# only until the next code block:

if ENV["CI_ENABLE_COVERAGE"]
  require "simplecov/no_defaults"
  require "helpers/simplecov_minitest"

  SimpleCov.start do
    add_filter "/test/"
    add_group "Resources", ["lib/resources", "lib/inspec/resources"]
    add_group "Matchers", ["lib/matchers", "lib/inspec/matchers"]
    add_group "Backends", "lib/inspec/backend"
  end
end

##
#
# Do not add any other code from here until the end of this code
# block.
#
# Before ANYTHING else happens, this must happen:
#
# 1) require minitest/autorun
# 2) require rspec/core/dsl
# 3) override RSpec::Core::DSL.expose_globally! to do nothing.
# 4) require rspec
#
# Explanation: eventually, our tests get around to inspec/runner_rspec
# (and a few others), and they load rspec. By default, when rspec
# loads, it creates it's own global `describe` method, overwriting
# minitest's.
#
# Another aspect of rspec's expose_globally! is that it also messes
# with mocha's methods. Any tests that occur after our runner has run
# RSpec::Core::ExampleGroup.describe will fail if they use any mocha
# stubs (specifially any_instance) as the method will be gone. Don't
# know why, but the above sequence avoids that.
#
# Before this, the tests would get to the point of loading rspec, then
# all subsequently loaded spec-style tests would just disappear into
# the aether. Differences in test load order created differences in
# test count and vast differences in test time (which should have been
# a clue that something was up--windows is just NOT THAT FAST).

require "minitest/autorun"

require "rspec/core/dsl"
module RSpec::Core::DSL
  class << self
    alias expose_globally! expose_globally! # alias prevents duplicate warning
  end
  # rubocop:disable Lint/DuplicateMethods
  def self.expose_globally!
    # do nothing
  end
  # rubocop:enable Lint/DuplicateMethods
end
require "rspec"

# End of rspec vs minitest fight
########################################################################

require "webmock/minitest"
require "mocha/minitest"
require "inspec/log"
require "inspec/backend"
require "helpers/mock_loader"
require "helpers/resources"

TMP_CACHE = {} # rubocop: disable Style/MutableConstant

Inspec::Log.logger = Logger.new(nil)

def load_resource(*args)
  MockLoader.new.load_resource(*args)
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

  # Wire up Inspec.deprecator accordingly using mocha stubbing
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
  # TODO: push up to minitest
  def skip_until(y, m, d, msg)
    raise msg if Time.now > Time.local(y, m, d)

    skip msg
  end

  # These tests are being worked on. These are github issues for them.
  # Related: https://github.com/inspec/inspec/pull/5063
  def skip_windows!
    skip "These have never passed" if windows?
  end

  def unmock(&blk)
    # eg: resource = unmock { group "staff" }
    require "inspec/fetcher/mock"
    require "inspec/runner"

    # TODO: there is WAY too much magic going on in here
    runner = Inspec::Runner.new
    runner.add_target("inspec.yml" => "name: inspec-shell")
    profile = runner.target_profiles.first
    ctx = profile.runner_context

    ctx.load blk
  end
end

class InspecTest < Minitest::Test
  # shared stuff here
end
