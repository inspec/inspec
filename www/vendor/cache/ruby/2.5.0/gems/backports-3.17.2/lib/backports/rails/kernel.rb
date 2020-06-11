# frozen_string_literal: true

require 'backports/tools/deprecation'

Backports.deprecate :rails, 'Rails backports are deprecated.'

# From ActiveSupport
unless Object.method_defined? :try
  class Object
    def try(*a, &b)
      if a.empty? || respond_to?(a.first)
        if a.empty? && block_given?
          if b.arity == 0
            instance_eval(&b)
          else
            yield self
          end
        else
          public_send(*a, &b)
        end
      end
    end
  end

  class NilClass
    def try(*args)
      nil
    end
  end
end
