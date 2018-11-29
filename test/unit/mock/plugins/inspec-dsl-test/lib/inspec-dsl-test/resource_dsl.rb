module InspecPlugins
  module DslTest
    module ResourceDslFoodType
      def food_type(food)
        if food == :berries
          # OK, add an instance method to any berry resource
          define_method :'has_drupals?' do
            true
          end
        end
      end
    end
  end
end
