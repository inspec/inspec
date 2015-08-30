require 'vulcano/backend'

module Vulcano

  class ProfileContext

    attr_reader :rules, :only_ifs
    def initialize profile_id, backend, profile_registry: {}, only_ifs: []
      if backend.nil?
        raise "ProfileContext is initiated with a backend == nil. " +
              "This is a backend error which must be fixed upstream."
      end

      @profile_id = profile_id
      @rules = profile_registry
      @only_ifs = only_ifs
      __CTX = self

      # This is the heart of the profile context
      # An instantiated object which has all resources registered to it
      # and exposes them to the a test file.
      ctx = Class.new do
        include Vulcano::DSL

        define_method :__register_rule do |*args|
          __CTX.register_rule(*args)
        end
        define_method :__unregister_rule do |*args|
          __CTX.unregister_rule(*args)
        end

        Vulcano::Resource.registry.each do |id,r|
          define_method id.to_sym do |*args|
            r.new(backend, *args)
          end
        end

        def to_s
          'Profile Context Run'
        end
      end
      @profile_context = ctx.new

    end

    def load(content, source, line)
      @profile_context.instance_eval(content, source, line)
    end

    def unregister_rule id
      full_id = VulcanoBaseRule::full_id(@profile_id, id)
      @rules[full_id] = nil
    end

    def register_rule r
      # get the full ID
      full_id = VulcanoBaseRule::full_id(@profile_id, r)
      if full_id.nil?
        # TODO error
        return
      end
      # add the rule to the registry
      existing = @rules[full_id]
      if existing.nil?
        @rules[full_id] = r
      else
        VulcanoBaseRule::merge(existing, r)
      end
    end

  end
end
