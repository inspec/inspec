require 'inspec/utils/telemetry'
require_relative '../../helper.rb'

class TestTelemetryCollector < Minitest::Test
  def setup
    @telemetry = Inspec::Telemetry::Collector.instance
  end

  def test_report_add
    assert @telemetry.report_add(report_fixture)
    assert_equal 3, @telemetry.data_series_collection.count
    assert_equal Inspec::Telemetry::DataSeries,
      @telemetry.data_series_collection.sample.class
  end

  private

  def report_fixture
    {:controls=>
     [{:status=>"passed",
       :code_desc=>"File /tmp should be directory",
       :run_time=>0.003449,
       :start_time=>"2019-03-21T09:16:42-07:00",
       :resource_title=>"File /tmp",
       :expectation_message=>"should be directory"}],
    :other_checks=>[],
    :profiles=>
     [{:supports=>[],
       :title=>"tests from ../inspec_profiles/single_test.rb",
       :name=>"tests from ...inspec_profiles.single_test.rb",
       :controls=>
        [{:title=>nil,
          :desc=>nil,
          :descriptions=>{},
          :impact=>0.5,
          :refs=>[],
          :tags=>{},
          :code=>"",
          :source_location=>{:ref=>"/inspec_telemetry/lib/inspec/control_eval_context.rb", :line=>121},
          :id=>"(generated from single_test.rb:1 fa35eed4744bfbb36877914d02223d3e)",
          :results=>
           [{:status=>"passed",
             :code_desc=>"File /tmp should be directory",
             :run_time=>0.003449,
             :start_time=>"2019-03-21T09:16:42-07:00",
             :resource_title=>"File /tmp",
             :expectation_message=>"should be directory"}]}],
       :groups=>[{:title=>nil, :controls=>["(generated from single_test.rb:1 fa35eed4744bfbb36877914d02223d3e)"], :id=>"single_test.rb"}],
       :inputs=>[],
       :sha256=>"879a234b60a95c9f3dc4e5f74ed0334ccb88653d6af075287cc5fd083bd0d290",
       :status=>"loaded"}],
    :platform=>{:name=>"mac_os_x", :release=>"16.7.0", :target=>"local://"},
    :version=>"3.7.4",
    :statistics=>{:duration=>0.007374, :controls=>{:total=>1, :passed=>{:total=>1}, :skipped=>{:total=>0}, :failed=>{:total=>0}}}}
  end
end
