require 'inspec/utils/telemetry/data_series'
require_relative '../../../helper.rb'

class TestTelemetryDataSeries < Minitest::Test
  def setup
    @data_series = Inspec::Telemetry::DataSeries.new
  end

  def test_initialization
    assert_equal Inspec::Telemetry::DataSeries, @data_series.class
  end

  def test_resource
    @data_series.resource= "File"
    assert_equal "File", @data_series.resource
  end

  def test_type
    @data_series.type= "Resource"
    assert_equal "Resource", @data_series.type
  end

  def test_run_time
    @data_series.run_time= 0.079475
    assert_equal 0.079475, @data_series.run_time
  end

  def test_enabled_default
    assert_equal true, @data_series.enabled?
  end

  def test_enabled
    @data_series.enable
    assert_equal true, @data_series.enabled?
  end

  def test_disable
    @data_series.disable
    assert_equal false, @data_series.enabled?
  end
end
