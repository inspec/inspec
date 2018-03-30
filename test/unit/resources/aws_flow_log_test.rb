require 'helper'

class EmptyAwsFlowLog < Minitest::Test
  def setup
    AwsFlowLog::BackendFactory.select(MockAwsFlowLog::Empty)
  end

  def test_rejects_empty_params
    assert_raises(ArgumentError) { AwsFlowLog.new }
  end

  def test_search_hit_via_scalar_fails
    refute AwsFlowLog.new(flow_log_id: 'fl-abcd1234').exists?
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsFlowLog.new(shoe_size: 9) }
  end

end

class BasicAwsFlowLog < Minitest::Test
  def setup
    AwsFlowLog::BackendFactory.select(MockAwsFlowLog::Basic)
  end

  def test_search_hit
    assert AwsFlowLog.new(flow_log_id: 'fl-abcd1234').exists?
    assert_equal 'inspec-abcd1234', AwsFlowLog.new(flow_log_id: 'fl-abcd1234').log_group_name
    assert_equal 'vpc-abcd1234', AwsFlowLog.new(flow_log_id: 'fl-abcd1234').resource_id
  end

  def test_search_miss
    refute AwsFlowLog.new(flow_log_id: 'fl-12341234').exists?
    refute AwsFlowLog.new(flow_log_id: 'fl-12341234').log_group_name
    refute AwsFlowLog.new(flow_log_id: 'fl-12341234').resource_id
  end
end

module MockAwsFlowLog
  class Empty < AwsBackendBase
    def describe_flow_logs(query)
      Aws::EC2::Types::DescribeFlowLogsResult.new(
        flow_logs: [])
    end
  end

  class Basic < AwsBackendBase
    def describe_flow_logs(query)
      resp = Aws::EC2::Types::DescribeFlowLogsResult.new(
        flow_logs: [
          Aws::EC2::Types::FlowLog.new(
            flow_log_id: 'fl-abcd1234',
            log_group_name: 'inspec-abcd1234',
            resource_id: 'vpc-abcd1234',
          ),
          Aws::EC2::Types::FlowLog.new(
            flow_log_id: 'fl-a1b2c3d4',
            log_group_name: 'inspec-a1b2c3d4',
            resource_id: 'vpc-a1b2c3d4',
          )
        ]
      )

      selected = resp[:flow_logs].select do |fl|
        query[:filter].all? do |filter|
          filter[:values].include?(fl[filter[:name].tr('-','_')])
        end
      end

      OpenStruct.new({ flow_logs: selected })
    end
  end
end
