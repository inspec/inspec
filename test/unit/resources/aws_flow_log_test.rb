require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_flow_log'

require 'resource_support/aws'
require 'resources/aws/aws_flow_log'

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
    assert AwsFlowLog.new(flow_log_id: 'fl-abcd1111').exists?
  end

  def test_to_s
    assert_equal 'AWS Flow Log fl-abcd1234',
      AwsFlowLog.new(flow_log_id: 'fl-abcd1234').to_s
    assert_equal 'AWS Flow Log fl-abcd3333',
      AwsFlowLog.new(subnet_id: 'subnet-abcd3333').to_s
    assert_equal 'AWS Flow Log fl-abcd1111',
      AwsFlowLog.new(vpc_id: 'vpc-abcd1111').to_s
  end

  def test_flow_log_id
    assert_equal 'fl-abcd1111', AwsFlowLog.new(flow_log_id: 'fl-abcd1111').flow_log_id
  end

  def test_log_group_name
    assert_equal 'inspec-abcd1111', AwsFlowLog.new(flow_log_id: 'fl-abcd1111').log_group_name
  end

  def test_resource_id
    assert_equal 'vpc-abcd1111', AwsFlowLog.new(flow_log_id: 'fl-abcd1111').resource_id
    assert_equal 'eni-abcd2222', AwsFlowLog.new(flow_log_id: 'fl-abcd2222').resource_id
    assert_equal 'subnet-abcd3333', AwsFlowLog.new(flow_log_id: 'fl-abcd3333').resource_id
  end

  def test_resource_type
    assert_equal 'vpc', AwsFlowLog.new(flow_log_id: 'fl-abcd1111').resource_type
    assert_equal 'eni', AwsFlowLog.new(flow_log_id: 'fl-abcd2222').resource_type
    assert_equal 'subnet', AwsFlowLog.new(flow_log_id: 'fl-abcd3333').resource_type
  end

  def test_search_miss
    flowlog = AwsFlowLog.new(flow_log_id: 'fl-12341234')
    refute flowlog.exists?
    assert_nil flowlog.log_group_name
    assert_nil flowlog.resource_id
    assert_equal 'AWS Flow Log fl-12341234', flowlog.to_s
  end

  def test_search_subnet_miss
    flowlog = AwsFlowLog.new(subnet_id: 'subnet-12341234')
    refute flowlog.exists?
    assert_nil flowlog.log_group_name
    assert_nil flowlog.resource_id
    assert_equal 'AWS Flow Log subnet-12341234', flowlog.to_s
  end

  def test_search_vpc_miss
    flowlog = AwsFlowLog.new(vpc_id: 'vpc-12341234')
    refute flowlog.exists?
    assert_nil flowlog.log_group_name
    assert_nil flowlog.resource_id
    assert_equal 'AWS Flow Log vpc-12341234', flowlog.to_s
  end

  def test_attached_to?
    assert AwsFlowLog.new(flow_log_id: 'fl-abcd1111').attached_to_vpc?
    assert AwsFlowLog.new(flow_log_id: 'fl-abcd2222').attached_to_eni?
    assert AwsFlowLog.new(flow_log_id: 'fl-abcd3333').attached_to_subnet?
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
            flow_log_id: 'fl-abcd1111',
            log_group_name: 'inspec-abcd1111',
            resource_id: 'vpc-abcd1111',
          ),
          Aws::EC2::Types::FlowLog.new(
            flow_log_id: 'fl-abcd2222',
            log_group_name: 'inspec-abcd2222',
            resource_id: 'eni-abcd2222',
          ),
          Aws::EC2::Types::FlowLog.new(
            flow_log_id: 'fl-abcd3333',
            log_group_name: 'inspec-abcd3333',
            resource_id: 'subnet-abcd3333',
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
