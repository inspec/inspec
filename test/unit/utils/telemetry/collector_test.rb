require 'inspec/utils/telemetry'
require_relative '../../../helper.rb'

class TestTelemetryCollector < Minitest::Test
  def setup
    @collector = Inspec::Telemetry::Collector.instance
    @collector.reset
  end

  def test_collector_singleton
    assert_equal Inspec::Telemetry::Collector.instance, @collector
  end

  def test_add_data_series
    data_series = Inspec::Telemetry::DataSeries.new('/resource/File')
    assert @collector.add_data_series(data_series)
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
    @collector.reset
    assert_equal 0, @collector.list_data_series.count
  end
end
