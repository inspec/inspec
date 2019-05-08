# This unit test performs some tests to verify that the command line options for
# <%= plugin_name %> are correct.

# Include our test harness
require_relative '../helper'

# Load the class under test, the CliCommand definition.
require '<%= plugin_name %>/cli_command'

# Because InSpec is a Spec-style test suite, we're going to use Minitest::Spec
# here, for familiar look and feel. However, this isn't InSpec (or RSpec) code.
describe InspecPlugins::<%= module_name %>::CliCommand do

  # When writing tests, you can use `let` to create variables that you
  # can reference easily.

  # This is the CLI Command implementation class.
  # It is a subclass of Thor, which is a CLI framework.
  # This unit test file is mostly about verifying the Thor settings.
  let(:cli_class) { InspecPlugins::<%= module_name %>::CliCommand }

  # From this point onwards, this test file assumes you did not rename
  # the provided 'do_something' subcommand.  As you implement your plugin,
  # modify and add to the lines below to test your actual options.

  # This is a Hash of Structs that tells us details of options for the 'do_something' subcommand.
  let(:do_something_options) { cli_class.all_commands['do_something'].options }

  # To group tests together, you can nest 'describe' in minitest/spec
  describe 'the do-something subcommand' do

    # Some tests through here use minitest Expectations, which attach to all
    # Objects, and begin with 'must' (positive) or 'wont' (negative)
    # See http://docs.seattlerb.org/minitest/Minitest/Expectations.html

    # Option count OK?
    it "should take one option" do
      do_something_options.count.must_equal(1)
    end

    # Summary option
    describe "the summary option" do
      it "should be present" do
        do_something_options.keys.must_include(:summary)
      end
      it "should have a description" do
        do_something_options[:summary].description.wont_be_nil
      end
      it "should not be required" do
        do_something_options[:summary].required.wont_equal(true)
      end
      it "should have a single-letter alias" do
        do_something_options[:summary].aliases.must_include(:s)
      end
    end

    # Argument count
    # The 'do-something' command takes one optional argument. According to the
    # metaprogramming rules of Ruby, the do_something() method should thus have an
    # arity of -1. See http://ruby-doc.org/core-2.5.1/Method.html#method-i-arity
    # for how that number is caclulated.
    it "should take one optional argument" do
      cli_class.instance_method(:do_something).arity.must_equal(-1)
    end

  end
end
