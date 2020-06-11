module Tins
  module Expose
    # Expose any (private/protected) method or internal state of this object
    # returning the result for specing purposes.
    #
    # @param method_name [ Symbol | String ] name of the method
    #                                        (shortcut for reader methods).
    # @param block [ Proc ] any private/protected methods of the object can be
    #                       called in this block.
    #
    # @return [ Object ] result of the method or block call
    def expose(method_name = nil, *args, &block)
      if block
        instance_eval(&block)
      elsif method_name.nil?
        methods = private_methods(true) + protected_methods(true)
        o = dup
        o.singleton_class.class_eval do
          public(*methods)
        end
        o
      elsif method_name
        __send__(method_name, *args)
      end
    end
  end
end
