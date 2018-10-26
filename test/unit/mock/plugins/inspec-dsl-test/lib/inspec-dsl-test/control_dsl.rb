module InspecPlugins
  module DslTest
    module ControlDslFavoriteFruit
      def favorite_fruit(fruit)
        # Here, self is an instance of an anonymous class, derived from Inspec::Rule

        # Our behavior is to add our favorite fruit to the descriptions of the control.
        @descriptions[:favorite_fruit] = fruit
      end
    end
  end
end
