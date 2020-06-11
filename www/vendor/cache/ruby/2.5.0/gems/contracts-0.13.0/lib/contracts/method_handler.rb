module Contracts
  # Handles class and instance methods addition
  # Represents single such method
  class MethodHandler
    METHOD_REFERENCE_FACTORY = {
      :class_methods => SingletonMethodReference,
      :instance_methods => MethodReference
    }

    RAW_METHOD_STRATEGY = {
      :class_methods => lambda { |target, name| target.method(name) },
      :instance_methods => lambda { |target, name| target.instance_method(name) }
    }

    # Creates new instance of MethodHandler
    #
    # @param [Symbol] method_name
    # @param [Bool] is_class_method
    # @param [Class] target - class that method got added to
    def initialize(method_name, is_class_method, target)
      @method_name = method_name
      @is_class_method = is_class_method
      @target = target
    end

    # Handles method addition
    def handle
      return unless engine?
      return if decorators.empty?

      validate_decorators!
      validate_pattern_matching!

      engine.add_method_decorator(method_type, method_name, decorator)
      mark_pattern_matching_decorators
      method_reference.make_alias(target)
      redefine_method
    end

    private

    attr_reader :method_name, :is_class_method, :target

    def engine?
      Engine.applied?(target)
    end

    def engine
      Engine.fetch_from(target)
    end

    def decorators
      @_decorators ||= engine.all_decorators
    end

    def method_type
      @_method_type ||= is_class_method ? :class_methods : :instance_methods
    end
    # _method_type is required for assigning it to local variable with
    # the same name. See: #redefine_method
    alias_method :_method_type, :method_type

    def method_reference
      @_method_reference ||= METHOD_REFERENCE_FACTORY[method_type].new(method_name, raw_method)
    end

    def raw_method
      RAW_METHOD_STRATEGY[method_type].call(target, method_name)
    end

    def ignore_decorators?
      ENV["NO_CONTRACTS"] && !pattern_matching?
    end

    def decorated_methods
      @_decorated_methods ||= engine.decorated_methods_for(method_type, method_name)
    end

    def pattern_matching?
      return @_pattern_matching if defined?(@_pattern_matching)
      @_pattern_matching = decorated_methods.any? { |x| x.method != method_reference }
    end

    def mark_pattern_matching_decorators
      return unless pattern_matching?
      decorated_methods.each(&:pattern_match!)
    end

    def decorator
      @_decorator ||= decorator_class.new(target, method_reference, *decorator_args)
    end

    def decorator_class
      decorators.first[0]
    end

    def decorator_args
      decorators.first[1]
    end

    def redefine_method
      return if ignore_decorators?

      # Those are required for instance_eval to be able to refer them
      name = method_name
      method_type = _method_type
      current_engine = engine

      # We are gonna redefine original method here
      method_reference.make_definition(target) do |*args, &blk|
        engine = current_engine.nearest_decorated_ancestor

        # If we weren't able to find any ancestor that has decorated methods
        # FIXME : this looks like untested code (commenting it out doesn't make specs red)
        unless engine
          fail "Couldn't find decorator for method " + self.class.name + ":#{name}.\nDoes this method look correct to you? If you are using contracts from rspec, rspec wraps classes in it's own class.\nLook at the specs for contracts.ruby as an example of how to write contracts in this case."
        end

        # Fetch decorated methods out of the contracts engine
        decorated_methods = engine.decorated_methods_for(method_type, name)

        # This adds support for overloading methods. Here we go
        # through each method and call it with the arguments.
        # If we get a failure_exception, we move to the next
        # function. Otherwise we return the result.
        # If we run out of functions, we raise the last error, but
        # convert it to_contract_error.
        success = false
        i = 0
        result = nil
        expected_error = decorated_methods[0].failure_exception

        until success
          decorated_method = decorated_methods[i]
          i += 1
          begin
            success = true
            result = decorated_method.call_with(self, *args, &blk)
          rescue expected_error => error
            success = false
            unless decorated_methods[i]
              begin
                ::Contract.failure_callback(error.data, false)
              rescue expected_error => final_error
                raise final_error.to_contract_error
              end
            end
          end
        end

        # Return the result of successfully called method
        result
      end
    end

    def validate_decorators!
      return if decorators.size == 1

      fail %{
Oops, it looks like method '#{name}' has multiple contracts:
#{decorators.map { |x| x[1][0].inspect }.join("\n")}

Did you accidentally put more than one contract on a single function, like so?

Contract String => String
Contract Num => String
def foo x
end

If you did NOT, then you have probably discovered a bug in this library.
Please file it along with the relevant code at:
https://github.com/egonSchiele/contracts.ruby/issues
      }
    end

    def validate_pattern_matching!
      new_args_contract = decorator.args_contracts
      matched = decorated_methods.select do |contract|
        contract.args_contracts == new_args_contract
      end

      return if matched.empty?

      fail ContractError.new(%{
It looks like you are trying to use pattern-matching, but
multiple definitions for function '#{method_name}' have the same
contract for input parameters:

#{(matched + [decorator]).map(&:to_s).join("\n")}

Each definition needs to have a different contract for the parameters.
      }, {})
    end
  end
end
