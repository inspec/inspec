require 'inspec/plugin/v2'

module InspecPlugins
  module DslTest

    class Plugin < Inspec.plugin(2)
      plugin_name :'inspec-dsl-test'

      control_dsl :favorite_fruit do
        require_relative 'control_dsl'
        InspecPlugins::DslTest::ControlDslFavoriteFruit
      end

      describe_dsl :favorite_vegetable do
        require_relative 'describe_dsl'
        InspecPlugins::DslTest::DescribeDslFavoriteVegetable
      end
    end
  end
end