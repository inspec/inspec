module Contracts
  # MethodReference represents original method reference that was
  # decorated by contracts.ruby. Used for instance methods.
  class MethodReference
    attr_reader :name

    # name - name of the method
    # method - method object
    def initialize(name, method)
      @name = name
      @method = method
    end

    # Returns method_position, delegates to Support.method_position
    def method_position
      Support.method_position(@method)
    end

    # Makes a method re-definition in proper way
    def make_definition(this, &blk)
      is_private = private?(this)
      is_protected = protected?(this)
      alias_target(this).send(:define_method, name, &blk)
      make_private(this) if is_private
      make_protected(this) if is_protected
    end

    # Aliases original method to a special unique name, which is known
    # only to this class. Usually done right before re-defining the
    # method.
    def make_alias(this)
      _aliased_name = aliased_name
      original_name = name

      alias_target(this).class_eval do
        alias_method _aliased_name, original_name
      end
    end

    # Calls original method on specified `this` argument with
    # specified arguments `args` and block `&blk`.
    def send_to(this, *args, &blk)
      this.send(aliased_name, *args, &blk)
    end

    private

    # Makes a method private
    def make_private(this)
      original_name = name
      alias_target(this).class_eval { private original_name }
    end

    def private?(this)
      this.private_instance_methods.map(&:to_sym).include?(name)
    end

    def protected?(this)
      this.protected_instance_methods.map(&:to_sym).include?(name)
    end

    # Makes a method protected
    def make_protected(this)
      original_name = name
      alias_target(this).class_eval { protected original_name }
    end

    # Returns alias target for instance methods, subject to be
    # overriden in subclasses.
    def alias_target(this)
      this
    end

    def aliased_name
      @_original_name ||= construct_unique_name
    end

    def construct_unique_name
      :"__contracts_ruby_original_#{name}_#{Support.unique_id}"
    end
  end

  # The same as MethodReference, but used for singleton methods.
  class SingletonMethodReference < MethodReference
    private

    def private?(this)
      this.private_methods.map(&:to_sym).include?(name)
    end

    def protected?(this)
      this.protected_methods.map(&:to_sym).include?(name)
    end

    # Return alias target for singleton methods.
    def alias_target(this)
      Support.eigenclass_of this
    end
  end
end
