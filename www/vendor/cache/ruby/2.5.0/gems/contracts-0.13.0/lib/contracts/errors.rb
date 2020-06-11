# @private
# Base class for Contract errors
#
# If default failure callback is used it stores failure data
class ContractBaseError < ArgumentError
  attr_reader :data

  def initialize(message, data)
    super(message)
    @data = data
  end

  # Used to convert to simple ContractError from other contract errors
  def to_contract_error
    self
  end
end

# Default contract error
#
# If default failure callback is used, users normally see only these contract errors
class ContractError < ContractBaseError
end

class ParamContractError < ContractError
end

class ReturnContractError < ContractError
end

# @private
# Special contract error used internally to detect pattern failure during pattern matching
class PatternMatchingError < ContractBaseError
  # Used to convert to ContractError from PatternMatchingError
  def to_contract_error
    ContractError.new(to_s, data)
  end
end

# Base invariant violation error
class InvariantError < StandardError
  def to_contract_error
    self
  end
end

module Contracts
  # Error issued when user haven't included Contracts in original class but used Contract definition in singleton class
  #
  # Provides useful description for user of the gem and an example of correct usage.
  class ContractsNotIncluded < TypeError
    DEFAULT_MESSAGE = %{In order to use contracts in singleton class, please include Contracts module in original class
    Example:

    ```ruby
    class Example
      include Contracts  # this line is required
      class << self
        # you can use `Contract` definition here now
      end
    end
    ```}

    attr_reader :message
    alias_method :to_s, :message

    def initialize(message = DEFAULT_MESSAGE)
      @message = message
    end
  end
end
