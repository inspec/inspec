# Functional Tests for Example Plugin, Resource Lister

# Functional tests are used to verify the behavior of the plugin are as expected, to a user.
# Functional tests generally do not have inside knowledge of how the plugin works.

# Include our test harness
require_relative '../helper'

# Because InSpec is a Spec-style test suite, we're going to use Minitest::Spec
# here, for familiar look and feel. However, this isn't InSpec (or RSpec) code.
describe 'inspec list-resources core' do
  # Our helper.rb locates this library from the InSpec install that
  # Bundler installed for us. If we want its methods, we still must
  # import it.  Including it here will make it available in all child
  # 'describe' blocks.
  include CorePluginFunctionalHelper

  # When thinking up scenarios to test, start with the simplest.
  # Then think of each major feature, and exercise them.
  # Running combinations of features makes sense if it is very likely,
  # or a difficult / dangerous case.  You can always add more tests
  # here as users find subtle problems.  In fact, having a user submit
  # a PR that creates a failing functional test is a great way to
  # capture the reproduction case.
  # The simplest case:
  describe "when run without an argument" do

    # run_inspec_process_with_this_plugin is a helper provided by
    # CoreFunctionalHelper. It makes the InSpec that Bundler installed
    # think that this plugin we are currently testing is installed as a
    # user plugin, by writing a plugin config file in a temp dir.
    # To use it, just provide a command line, minus the word `inspec`.
    let (:outcome) { run_inspec_process_with_this_plugin('listresources core') }

    # Some tests through here use minitest Expectations, which attach to all
    # Objects, and begin with 'must' (positive) or 'wont' (negative)
    # See http://docs.seattlerb.org/minitest/Minitest/Expectations.html
    it("should exit successfully") { outcome.exit_status.must_equal(0) }
    it("should be silent on stderr") { outcome.stderr.must_be_empty }

    # A selection of core resources, just spot checking.
    # This is an example of using Ruby to define sets of tests.
    ['process', 'service', 'user', 'file'].each do |resource_name|
      it "should mention the '#{resource_name}' resource" do
        outcome.stdout.must_include(resource_name)
      end
    end

    # Check for the summary
    it "should mention the summary" do
      outcome.stdout.must_include('resources total')
    end
  end

  # Test the search pattern feature, in a couple of ways.
  describe "when run with a search pattern that matches things" do
    # Notice that the command line is changed here:
    # "list all resources that have the word user in them"
    let (:outcome) { run_inspec_process_with_this_plugin('listresources core user') }

    # Should be well-behaved...
    it("should exit successfully") { outcome.exit_status.must_equal(0) }
    it("should be silent on stderr") { outcome.stderr.must_be_empty }

    # Here, we want to know it DID match some things, and NOT some others.
    ['user', 'users'].each do |resource_name|
      it "should mention the '#{resource_name}' resource" do
        outcome.stdout.must_include(resource_name)
      end
    end
    ['process', 'service', 'file'].each do |resource_name|
      it "should NOT mention the '#{resource_name}' resource" do
        outcome.stdout.wont_include(resource_name)
      end
    end
  end
  describe "when run with a search pattern that matches nothing" do
    # Unlikely we'll have a resource with the string 'autogyro' in it.
    let (:outcome) { run_inspec_process_with_this_plugin('listresources core autogyro') }

    # Should be well-behaved...
    it("should exit successfully") { outcome.exit_status.must_equal(0) }
    it("should be silent on stderr") { outcome.stderr.must_be_empty }

    # Output lines should be just two, for the summary.
    it "should only have two output lines" do
      outcome.stdout.split("\n").count.must_equal(2)
    end

    # Check for the summary
    it "should mention a zero-resource summary" do
      outcome.stdout.must_include('0 resources total')
    end
  end

  # Exercise the summary option, which defaults to 'true'.
  describe "when run with the no-summary flag" do
    # Alter the command string to include the no-summary option
    let(:outcome) { run_inspec_process_with_this_plugin('listresources core --no-summary') }

    # Should be well-behaved...
    it("should exit successfully") { outcome.exit_status.must_equal(0) }
    it("should be silent on stderr") { outcome.stderr.must_be_empty }

    # Check for the summary
    it "should NOT mention summary" do
      outcome.stdout.wont_include('0 resources total')
    end
  end
end
