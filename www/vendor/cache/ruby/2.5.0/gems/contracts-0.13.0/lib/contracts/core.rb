module Contracts
  module Core
    def self.included(base)
      common(base)
    end

    def self.extended(base)
      common(base)
    end

    def self.common(base)
      return if base.respond_to?(:Contract)

      base.extend(MethodDecorators)

      base.instance_eval do
        def functype(funcname)
          contracts = Engine.fetch_from(self).decorated_methods_for(:class_methods, funcname)
          if contracts.nil?
            "No contract for #{self}.#{funcname}"
          else
            "#{funcname} :: #{contracts[0]}"
          end
        end
      end

      # NOTE: Workaround for `defined?(super)` bug in ruby 1.9.2
      # source: http://stackoverflow.com/a/11181685
      # bug: https://bugs.ruby-lang.org/issues/6644
      base.class_eval <<-RUBY
        # TODO: deprecate
        # Required when contracts are included in global scope
        def Contract(*args)
          if defined?(super)
            super
          else
            self.class.Contract(*args)
          end
        end
      RUBY

      base.class_eval do
        def functype(funcname)
          contracts = Engine.fetch_from(self.class).decorated_methods_for(:instance_methods, funcname)
          if contracts.nil?
            "No contract for #{self.class}.#{funcname}"
          else
            "#{funcname} :: #{contracts[0]}"
          end
        end
      end
    end
  end
end
