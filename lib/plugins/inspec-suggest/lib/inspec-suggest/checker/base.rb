module InspecPlugins::Suggest
  class Checker
    class Check
      class Base

        # Registration DSL method.
        def self.name(myname)
          InspecPlugins::Suggest::Checker.register_check(myname,self)
        end

        attr_reader :ui

        # Inherited constructor.
        def initialize(opts)
          @ui = opts[:ui]
        end

      end
    end
  end
end
