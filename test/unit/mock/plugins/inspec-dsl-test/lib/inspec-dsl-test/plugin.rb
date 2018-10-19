require 'inspec/plugin/v2'

module InspecPlugins
  module DslTest

    class Plugin < Inspec.plugin(2)
      plugin_name :'inspec-dsl-test'

      control_dsl :test_control_dsl_01 do
        require_relative 'control_dsl'
        InspecPlugins::DslTest::ControlDsl01
      end
    end
  end
end