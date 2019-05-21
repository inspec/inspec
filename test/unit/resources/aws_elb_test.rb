require 'helper'

require 'resource_support/aws'
require 'resources/aws/aws_elb'

# MAESB = MockAwsElbSingularBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsElbConstructorTest < Minitest::Test

  def setup
    AwsElb::BackendFactory.select(MAESB::Empty)
  end

  def test_empty_params_rejected
    assert_raises(ArgumentError) { AwsElb.new }
  end

  def test_string_accepted
    AwsElb.new 'my-elb'
  end

  def test_hash_accepted
    AwsElb.new elb_name: 'my-elb'
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsElb.new(shoe_size: 9) }
  end
end


#=============================================================================#
#                            Search / Recall
#=============================================================================#
class AwsElbFilterCriteriaTest < Minitest::Test

  def setup
    AwsElb::BackendFactory.select(MAESB::Basic)
  end

  def test_search_miss
    refute AwsElb.new('nonesuch').exists?
  end

  def test_recall_when_provided_a_string
    elb = AwsElb.new 'kangaroo'
    assert elb.exists?
    assert_equal('kangaroo', elb.elb_name)
  end

  def test_recall_when_provided_a_symbol
    elb = AwsElb.new elb_name: 'kang-the-alien'
    assert elb.exists?
    assert_equal('kang-the-alien', elb.elb_name)
  end

end

#=============================================================================#
#                            Properties
#=============================================================================#
class AwsElbProperties < Minitest::Test

  def setup
    AwsElb::BackendFactory.select(MAESB::Basic)
    @roo = AwsElb.new('kangaroo')
    @kang = AwsElb.new('kang-the-alien')
    @gamma = AwsElb.new('gamma')
    @miss = AwsElb.new('nonesuch')
  end

  def test_property_with_availability_zones
    assert_includes(@roo.availability_zones, 'us-east-1b')
    assert_includes(@roo.availability_zones, 'us-east-1c')
    assert_equal(2, @roo.availability_zones.count)
    refute_includes(@roo.availability_zones, nil)
    assert_kind_of(Array, @miss.availability_zones)
    assert_empty(@miss.availability_zones)
  end

  def test_property_with_dns_name
    assert_equal(@gamma.dns_name, '999999.us-east-1.aws.amazon.com')
    assert_equal(@roo.dns_name, '12345678.us-east-2.aws.amazon.com')
  end

  def test_property_with_external_ports
    assert_includes(@kang.external_ports, 80)
    assert_includes(@gamma.external_ports, 631)
    assert_equal(1, @roo.external_ports.count)
    refute_includes(@roo.external_ports, nil)
    assert_kind_of(Array, @miss.external_ports)
    assert_empty(@miss.external_ports)
  end

  def test_property_with_instance_ids
    assert_includes(@roo.instance_ids, 'i-87654321')
    assert_includes(@kang.instance_ids, 'i-12345678')
    assert_equal(2, @kang.instance_ids.count)
    assert_equal(0, @gamma.instance_ids.count)
    refute_includes(@kang.instance_ids, nil)
    assert_kind_of(Array, @miss.instance_ids)
    assert_empty(@miss.instance_ids)
  end

  def test_property_with_internal_ports
    assert_includes(@gamma.internal_ports, 80)
    assert_includes(@roo.internal_ports, 1001)
    assert_equal(1, @roo.internal_ports.count)
    refute_includes(@roo.internal_ports, nil)
    assert_kind_of(Array, @miss.internal_ports)
    assert_empty(@miss.internal_ports)
  end

  def test_property_with_security_group_ids
    assert_includes(@kang.security_group_ids, 'sg-12345678')
    assert_includes(@kang.security_group_ids, 'sg-99998888')
    assert_equal(3, @kang.security_group_ids.count)
    refute_includes(@kang.security_group_ids, nil)
    assert_kind_of(Array, @miss.security_group_ids)
    assert_empty(@miss.security_group_ids)
  end

  def test_property_with_subnet_ids
    assert_includes(@gamma.subnet_ids, 'subnet-ccccdddd')
    assert_includes(@kang.subnet_ids, 'subnet-12345678')
    assert_equal(2, @gamma.subnet_ids.count)
    refute_includes(@gamma.subnet_ids, nil)
    assert_kind_of(Array, @miss.subnet_ids)
    assert_empty(@miss.subnet_ids)
  end

  def test_property_vpc_id
    assert_equal(@gamma.vpc_id, 'vpc-87654321')
  end

end
#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module MAESB
  class Empty < AwsBackendBase
    def describe_load_balancers(query = {})
      raise Aws::ElasticLoadBalancing::Errors::LoadBalancerNotFound.new(nil, nil)
    end
  end

  class Basic < AwsBackendBase
    def describe_load_balancers(query = {})
      data = Aws::ElasticLoadBalancing::Types::DescribeAccessPointsOutput.new(
        load_balancer_descriptions: [
          Aws::ElasticLoadBalancing::Types::LoadBalancerDescription.new(
            availability_zones: [
              'us-east-1a',
              'us-east-1c',
            ],
            dns_name: '12345678.us-east-1.aws.amazon.com',
            load_balancer_name: 'kang-the-alien',
            listener_descriptions: [
              Aws::ElasticLoadBalancing::Types::ListenerDescription.new(
                listener: Aws::ElasticLoadBalancing::Types::Listener.new(
                  protocol: 'http',
                  load_balancer_port: 80,
                  instance_protocol: 'http',
                  instance_port: 80,
                )
              )
            ],
            instances: [
              Aws::ElasticLoadBalancing::Types::Instance.new(instance_id: 'i-12345678'),
              Aws::ElasticLoadBalancing::Types::Instance.new(instance_id: 'i-aaaabbbb'),
            ],
            security_groups: [
              'sg-12345678',
              'sg-aaaabbbb',
              'sg-99998888',
            ],
            subnets: [
              'subnet-12345678',
              'subnet-aaaabbbb',
            ],
            vpc_id: 'vpc-12345678',
          ),
          Aws::ElasticLoadBalancing::Types::LoadBalancerDescription.new(
            availability_zones: [
              'us-east-1b',
              'us-east-1c',
            ],
            dns_name: '12345678.us-east-2.aws.amazon.com',
            load_balancer_name: 'kangaroo',
            listener_descriptions: [
              Aws::ElasticLoadBalancing::Types::ListenerDescription.new(
                listener: Aws::ElasticLoadBalancing::Types::Listener.new(
                  protocol: 'tcp',
                  load_balancer_port: 1001,
                  instance_protocol: 'tcp',
                  instance_port: 1001,
                )
              )
            ],
            instances: [
              Aws::ElasticLoadBalancing::Types::Instance.new(instance_id: 'i-87654321'),
            ],
            security_groups: [
              'sg-12345678',
              'sg-99998888',
            ],
            subnets: [
              'subnet-12345678',
              'subnet-aaaabbbb',
            ],
            vpc_id: 'vpc-12345678',
          ),
          Aws::ElasticLoadBalancing::Types::LoadBalancerDescription.new(
            availability_zones: [
              'us-east-1a',
              'us-east-1e',
            ],
            dns_name: '999999.us-east-1.aws.amazon.com',
            load_balancer_name: 'gamma',
            listener_descriptions: [
              Aws::ElasticLoadBalancing::Types::ListenerDescription.new(
                listener: Aws::ElasticLoadBalancing::Types::Listener.new(
                  protocol: 'http',
                  load_balancer_port: 631,
                  instance_protocol: 'http',
                  instance_port: 80,
                )
              )
            ],
            instances: [
            ],
            security_groups: [
              'sg-12345678',
              'sg-99998888',
              'sg-01010101',
            ],
            subnets: [
              'subnet-ccccdddd',
              'subnet-aaaabbbb',
            ],
            vpc_id: 'vpc-87654321',
          )
        ]
      )

      if query[:load_balancer_names]
        result = data.load_balancer_descriptions.select do |lbd|
          query[:load_balancer_names].include? lbd.load_balancer_name
        end
        if result.empty?
          raise Aws::ElasticLoadBalancing::Errors::LoadBalancerNotFound.new(nil, nil)
        else
          Aws::ElasticLoadBalancing::Types::DescribeAccessPointsOutput.new(
            load_balancer_descriptions: result
          )
        end
      else
        data
      end
    end
  end
end
