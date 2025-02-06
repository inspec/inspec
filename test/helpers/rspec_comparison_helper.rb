require "rspec/expectations"
require "matchers/matchers"

module RspecComparisonHelper
  include RSpec::Matchers

  def rspec_expect(value, &block)
    ::RSpec::Expectations::ExpectationTarget.for(value, nil, &block)
  end

  # Assertion using the cmp matcher (actual, operator, expected)
  def assert_cmp(actual, operator, expected)
    # Using RSpec's expect to evaluate the cmp matcher.
    case operator
    when :==
      expect(actual).to cmp(expected)
    when :!=
      expect(actual).not_to cmp(expected)
    when :<, :<=, :>, :>=, :===, :=~, :!~
      # Use a custom message; extend as needed
      matcher = cmp(expected)
      matcher.send(operator)
      expect(actual).to matcher
    else
      raise ArgumentError, "Unsupported operator #{operator}"
    end
  end

  def refute_cmp(actual, operator, expected)
    # Invert the assertion.
    case operator
    when :==
      expect { expect(actual).to cmp(expected) }.to raise_error(RSpec::Expectations::ExpectationNotMetError)
    when :!=
      expect { expect(actual).not_to cmp(expected) }.to raise_error(RSpec::Expectations::ExpectationNotMetError)
    when :<, :<=, :>, :>=, :===, :=~, :!~
      matcher = cmp(expected)
      matcher.send(operator)
      expect { expect(actual).to matcher }.to raise_error(RSpec::Expectations::ExpectationNotMetError)
    else
      raise ArgumentError, "Unsupported operator #{operator}"
    end
  end
end
