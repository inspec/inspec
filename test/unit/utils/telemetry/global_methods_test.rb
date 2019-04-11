require 'inspec/utils/telemetry'
require_relative '../../../helper.rb'

class TestTelemetryGlobalMethods < Minitest::Test
  def setup
    @collector = Inspec::Telemetry::Collector.instance
    @collector.reset
  end

  def test_record_telemetry_data
    assert Inspec.record_telemetry_data(:deprecation_group, 'serverspec_compat')

    depgrp = @collector.find_or_create_data_series(:deprecation_group)
    assert_equal ['serverspec_compat'], depgrp.data
    assert_equal :deprecation_group, depgrp.name
  end

  def test_record_telemetry_data_with_block
    Inspec.record_telemetry_data(:deprecation_group) do
      'serverspec_compat'
    end

    depgrp = @collector.find_or_create_data_series(:deprecation_group)
    assert_equal ['serverspec_compat'], depgrp.data
    assert_equal :deprecation_group, depgrp.name
  end
end
