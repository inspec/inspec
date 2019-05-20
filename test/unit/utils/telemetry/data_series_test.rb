require 'inspec/utils/telemetry'
require 'json'
require 'helper'

class TestTelemetryDataSeries < Minitest::Test
  def test_name
    ds = Inspec::Telemetry::DataSeries.new('fizz')
    refute_nil ds
    assert_equal 'fizz', ds.name
  end

  def test_data
    ds = Inspec::Telemetry::DataSeries.new('fizz')
    refute_nil ds.data
    assert_kind_of Array, ds.data
    assert_empty ds.data
  end

  def test_data_append
    ds = Inspec::Telemetry::DataSeries.new('fizz')
    assert_empty ds.data
    assert ds << 'foo'
    assert_equal ['foo'], ds.data
  end

  def test_data_push_alias
    ds = Inspec::Telemetry::DataSeries.new('fizz')
    assert_empty ds.data
    assert ds.push 'bar'
    assert_equal ['bar'], ds.data
  end

  def test_to_h
    ds = Inspec::Telemetry::DataSeries.new('fizz')
    ds << 'foo'
    assert_kind_of Hash, ds.to_h
    assert_equal 'fizz', ds.to_h[:name]
    assert_equal ['foo'], ds.to_h[:data]
  end

  def test_to_json
    ds = Inspec::Telemetry::DataSeries.new('fizz')
    ds << 'foo'
    assert_kind_of String, ds.to_json
    assert_equal '{"name":"fizz","data":["foo"]}', ds.to_json
    assert JSON.parse(ds.to_json)
  end

  def test_enabled
    ds = Inspec::Telemetry::DataSeries.new('fizz')
    assert ds.enabled?
  end

  def test_disable
    ds = Inspec::Telemetry::DataSeries.new('fizz')
    assert ds.enabled?
    ds.disable
    refute ds.enabled?
  end
end
