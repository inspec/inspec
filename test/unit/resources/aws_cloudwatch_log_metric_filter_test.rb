require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_cloudwatch_log_metric_filter'

require 'resource_support/aws'
require 'resources/aws/aws_cloudwatch_log_metric_filter'

# CWLMF = CloudwatchLogMetricFilter
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsCWLMFConstructor < Minitest::Test
  def setup
    AwsCloudwatchLogMetricFilter::BackendFactory.select(AwsMockCWLMFBackend::Empty)
  end

  def test_constructor_some_args_required
    assert_raises(ArgumentError) { AwsCloudwatchLogMetricFilter.new }
  end

  def test_constructor_accepts_known_resource_params
    [
      :filter_name,
      :pattern,
      :log_group_name,
    ].each do |resource_param|
      AwsCloudwatchLogMetricFilter.new(resource_param => 'some_val')
    end
  end

  def test_constructor_reject_bad_resource_params
    assert_raises(ArgumentError) { AwsCloudwatchLogMetricFilter.new(i_am_a_martian: 'beep') }
  end
end

#=============================================================================#
#                             Search Tests                                    #
#=============================================================================#
class AwsCWLMFSearch < Minitest::Test
  def setup
    # Reset to the Basic kit each time
    AwsCloudwatchLogMetricFilter::BackendFactory.select(AwsMockCWLMFBackend::Basic)
  end

  def test_using_lg_and_lmf_name_when_exactly_one
    lmf = AwsCloudwatchLogMetricFilter.new(
      log_group_name: 'test-log-group-01',
      filter_name: 'test-01',
    )
    assert lmf.exists?
  end

  def test_using_lg_and_lmf_name_when_not_present
    lmf = AwsCloudwatchLogMetricFilter.new(
      log_group_name: 'test-log-group-01',
      filter_name: 'test-1000-nope',
    )
    refute lmf.exists?
  end

  def test_using_log_group_name_resulting_in_duplicates
    assert_raises(RuntimeError) do
      AwsCloudwatchLogMetricFilter.new(
        log_group_name: 'test-log-group-01',
      )
    end
  end

  def test_duplicate_locally_uniqued_using_pattern
    lmf = AwsCloudwatchLogMetricFilter.new(
      log_group_name: 'test-log-group-01',
      pattern: 'INFO',
    )
    assert lmf.exists?
  end
end
#=============================================================================#
#                            Property Tests                                   #
#=============================================================================#
class AwsCWLMFProperties < Minitest::Test
  def setup
    # Reset to the Basic kit each time
    AwsCloudwatchLogMetricFilter::BackendFactory.select(AwsMockCWLMFBackend::Basic)
  end

  def test_property_values
    lmf = AwsCloudwatchLogMetricFilter.new(
      log_group_name: 'test-log-group-01',
      filter_name: 'test-01',
    )
    assert_equal('ERROR', lmf.pattern)
    assert_equal('alpha', lmf.metric_name)
    assert_equal('awesome_metrics', lmf.metric_namespace)
  end
end

#=============================================================================#
#                 Support Classes - Mock Data Providers                       #
#=============================================================================#
class AwsMockCWLMFBackend
  class Empty < AwsBackendBase
    def describe_metric_filters(_criteria)
      []
    end
  end
  class Basic < AwsBackendBase
    def describe_metric_filters(criteria) # rubocop:disable Metrics/MethodLength
      everything = [
        OpenStruct.new({
          filter_name: 'test-01',
          filter_pattern: 'ERROR',
          log_group_name: 'test-log-group-01',
          metric_transformations: [
            OpenStruct.new({
              metric_name: 'alpha',
              metric_namespace: 'awesome_metrics',
            }),
          ],
        }),
        OpenStruct.new({
          filter_name: 'test-01', # Intentional duplicate
          filter_pattern: 'ERROR',
          log_group_name: 'test-log-group-02',
          metric_transformations: [
            OpenStruct.new({
              metric_name: 'beta',
              metric_namespace: 'awesome_metrics',
            }),
          ],
        }),
        OpenStruct.new({
          filter_name: 'test-03',
          filter_pattern: 'INFO',
          log_group_name: 'test-log-group-01',
          metric_transformations: [
            OpenStruct.new({
              metric_name: 'gamma',
              metric_namespace: 'awesome_metrics',
            }),
          ],
        }),
      ]
      selection = everything
      # Here we filter on anything the AWS SDK lets us filter on remotely
      # - which notably does not include the 'pattern' criteria
      [:log_group_name, :filter_name].each do |remote_filter|
        next unless criteria.key?(remote_filter)
        selection.select! { |lmf| lmf[remote_filter] == criteria[remote_filter] }
      end
      selection
    end
  end
end
