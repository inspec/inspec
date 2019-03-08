require 'inspec/utils/telemetry/data_series'
require 'inspec/utils/telemetry/report'
require_relative '../../../helper.rb'

class TestTelemetryUtilsReport < Minitest::Test
  def setup
    @report = Inspec::Telemetry::Report.new(data_series_collection_fixture)
  end

  def test_initialization
    assert_equal Inspec::Telemetry::Report, @report.class
  end

  def test_generate
    assert_equal generate_fixture, @report.generate
  end

  private

  def generate_fixture
    {
      :inspec=>{:version=>"3.7.4"},
      :platform=>{
        :ruby_version=>"2.6.1",
        :ruby_platform=>"x86_64-darwin16"},
      :profiles=>{:count=>1},
      :controls=>{:count=>1},
      :tests=>{
        :count=>6,
        :average_run_time=>0.345688,
        "File"=>{
          :count=>3,
          :average_run_time=>0.27216199999999996},
        "Host"=>{
          :count=>3,
          :average_run_time=>0.419214}
      }
    }
  end

  def data_series_collection_fixture
    dsc = []
    dsc << data_series_file_fixture_a
    dsc << data_series_file_fixture_b
    dsc << data_series_file_fixture_c
    dsc << data_series_host_fixture_a
    dsc << data_series_host_fixture_b
    dsc << data_series_host_fixture_c
    dsc << data_series_control_fixture_a
    dsc << data_series_profile_fixture_a
    dsc
  end

  def data_series_file_fixture_a
    control = Inspec::Telemetry::DataSeries.new
    control.type="test"
    control.run_time=0.537200
    control.resource="File"
    control
  end

  def data_series_file_fixture_b
    control = Inspec::Telemetry::DataSeries.new
    control.type="test"
    control.run_time=0.031183
    control.resource="File"
    control
  end

  def data_series_file_fixture_c
    control = Inspec::Telemetry::DataSeries.new
    control.type="test"
    control.run_time=0.248103
    control.resource="File"
    control
  end

  def data_series_host_fixture_a
    control = Inspec::Telemetry::DataSeries.new
    control.type="test"
    control.run_time=0.051879
    control.resource="Host"
    control
  end

  def data_series_host_fixture_b
    control = Inspec::Telemetry::DataSeries.new
    control.type="test"
    control.run_time=0.917113
    control.resource="Host"
    control
  end

  def data_series_host_fixture_c
    control = Inspec::Telemetry::DataSeries.new
    control.type="test"
    control.run_time=0.288650
    control.resource="Host"
    control
  end

  def data_series_control_fixture_a
    control = Inspec::Telemetry::DataSeries.new
    control.type="control"
    control
  end

  def data_series_profile_fixture_a
    profile = Inspec::Telemetry::DataSeries.new
    profile.type="profile"
    profile
  end
end
