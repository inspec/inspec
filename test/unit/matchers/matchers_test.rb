require "minitest/autorun"
require "rspec/matchers"
require "rspec/expectations"
require "matchers/matchers"

require "pry"

describe "inspec matchers" do
  describe "cmp matcher" do
    include RSpec::Matchers

    ##
    # This is the LHS of what rspec is doing internally when you say:
    #
    # expect(expression).to be expected_value

    if ::RSpec::Expectations::ExpectationTarget.method(:for).arity == 1
      # rspec-expectations 3.8.5+
      def rspec_expect(value, &block)
        ::RSpec::Expectations::ExpectationTarget.for(value, &block)
      end
    else
      # rspec-expectations 3.8.4-
      def rspec_expect(value, &block)
        ::RSpec::Expectations::ExpectationTarget.for(value, block)
      end
    end

    ##
    # Assert using the `cmp` matcher.

    def assert_cmp(expect, actual)
      # expect(Account.new.balance).to eq(Money.new(0))
      # => expect(actual).to cmp expect

      actual = rspec_expect actual
      expect = cmp expect

      assert_operator actual, :to, expect
    end

    ##
    # Refute using the `cmp` matcher.

    def refute_cmp(expect, actual)
      actual = rspec_expect actual
      expect = cmp expect

      assert_raises RSpec::Expectations::ExpectationNotMetError do
        actual.to expect
      end
    end

    it "String cmp String" do
      assert_cmp "happy", "happy"
      assert_cmp "HAPPY", "happy" # case insensitive
      refute_cmp "happy", "unhappy"
      refute_cmp "happy", nil
    end

    it "String cmp String w/o ==" do
      # String, String, op!==, normal op call?
      skip "TODO: how to test w/ other ops?"
    end

    it "String cmp String w/ versions " do
      assert_cmp "1.0", "1.0"
      refute_cmp "1.0.0", "1.0"
      refute_cmp "1.0", nil
    end

    it "Regexp cmp String" do
      assert_cmp(/abc/, "xxx abc zzz")
      refute_cmp(/yyy/, "xxx abc zzz")
      refute_cmp(/yyy/, nil)
    end

    it "Regexp cmp Int" do
      assert_cmp(/42/, 42)
      refute_cmp(/yyy/, 42)
      refute_cmp(/yyy/, nil)
    end

    it "String (int) cmp Integer" do
      assert_cmp "42", 42
      refute_cmp "42", 420
      refute_cmp "42", nil
    end

    it "String (bool) cmp Bool" do
      assert_cmp "true", true
      assert_cmp "TRUE", true
      refute_cmp "true", false
      assert_cmp "false", false
      assert_cmp "FALSE", false
      refute_cmp "false", true
      refute_cmp "false", nil
    end

    it "Int cmp String(int)" do
      assert_cmp 42, "42"
      refute_cmp 420, "42"
      refute_cmp 420, nil
    end

    it "Int cmp String(!int)" do
      refute_cmp 42, :not_int
      refute_cmp 42, nil
    end

    it "Float cmp Float" do
      assert_cmp 3.14159, 3.14159
      refute_cmp 3.14159, 42.0
      refute_cmp 3.14159, nil
    end

    it "Float cmp String(float)" do
      assert_cmp 3.14159, "3.14159"
      refute_cmp 3.14159, "3.1415926"
      refute_cmp 3.14159, nil
    end

    it "Float cmp String(!float)" do
      refute_cmp 3.14159, :not_float
      refute_cmp 3.14159, nil
    end

    it "String cmp Symbol" do
      assert_cmp "abc", :abc
      assert_cmp "abc", :ABC
      refute_cmp "abc", nil
    end

    it "String(oct) cmp Int" do
      assert_cmp "0777", 0777
      refute_cmp "0777", 0777 + 1
      refute_cmp "0999", 0 # bad octal regexp
      refute_cmp "0777", nil
    end

    it "String(!oct) cmp Int" do
      obj = Object.new
      refute_cmp obj, 0x42
      refute_cmp obj, nil
    end

    it "should test XXX" do
      skip "TODO?"
    end
  end
end
