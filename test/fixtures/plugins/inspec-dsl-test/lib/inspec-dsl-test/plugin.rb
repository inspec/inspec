require "inspec/plugin/v2"

module InspecPlugins
  module DslTest

    class Plugin < Inspec.plugin(2)
      plugin_name :'inspec-dsl-test'

      outer_profile_dsl :favorite_grain do
        require_relative "outer_profile_dsl"
        InspecPlugins::DslTest::OuterProfileDslFavoriteGrain
      end

      control_dsl :favorite_fruit do
        require_relative "control_dsl"
        InspecPlugins::DslTest::ControlDslFavoriteFruit
      end

      describe_dsl :favorite_vegetable do
        require_relative "describe_dsl"
        InspecPlugins::DslTest::DescribeDslFavoriteVegetable
      end

      test_dsl :favorite_legume do
        require_relative "test_dsl"
        InspecPlugins::DslTest::TestDslFavoriteLegume
      end

      resource_dsl :food_type do
        require_relative "resource_dsl"
        InspecPlugins::DslTest::ResourceDslFoodType
      end
    end
  end
end
