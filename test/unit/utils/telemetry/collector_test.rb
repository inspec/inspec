require 'inspec/utils/telemetry'
require 'helper'

class TestTelemetryCollector < Minitest::Test
  def setup
    @collector = Inspec::Telemetry::Collector.instance
    @collector.reset!
  end

  def test_collector_singleton
    assert_equal Inspec::Telemetry::Collector.instance, @collector
  end

  def test_add_data_series
    assert_empty @collector.list_data_series
    assert @collector.add_data_series(Inspec::Telemetry::DataSeries.new('/resource/File'))
    refute_empty @collector.list_data_series
  end

  def test_list_data_series
    assert_empty @collector.list_data_series
    @collector.add_data_series(Inspec::Telemetry::DataSeries.new('/resource/File'))
    @collector.add_data_series(Inspec::Telemetry::DataSeries.new(:deprecation_group))
    assert_equal 2, @collector.list_data_series.count
    assert_equal 1, @collector.list_data_series.select { |d| d.name.eql?(:deprecation_group) }.count
    assert_kind_of Array, @collector.list_data_series
    assert_kind_of Inspec::Telemetry::DataSeries, @collector.list_data_series.first
  end

  def test_find_or_create_data_series
    dg = @collector.find_or_create_data_series(:deprecation_group)
    assert_kind_of Inspec::Telemetry::DataSeries, dg
    assert_equal :deprecation_group, dg.name
    assert_equal @collector.find_or_create_data_series(:deprecation_group), dg
  end

  def test_reset_singleton
    data_series = Inspec::Telemetry::DataSeries.new('/resource/File')
    @collector.add_data_series(data_series)
    @collector.reset!
    assert_equal 0, @collector.list_data_series.count
  end

  def test_telemetry_enabled
    @collector.load_config(Inspec::Config.mock('enable_telemetry'=>true))
    assert @collector.telemetry_enabled?
  end

  def test_telemetry_disabled
    @collector.load_config(Inspec::Config.mock('enable_telemetry'=>false))
    refute @collector.telemetry_enabled?
  end

  def test_disable_telemetry
    @collector.load_config(Inspec::Config.mock('enable_telemetry'=>true))
    assert @collector.telemetry_enabled?
    @collector.disable_telemetry
    refute @collector.telemetry_enabled?
  end
end
