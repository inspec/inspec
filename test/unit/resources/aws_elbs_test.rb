require 'helper'

# MAEPB = MockAwsELBsPluralBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsElbsConstructorTest < Minitest::Test

  def setup
    AwsElbs::BackendFactory.select(MAEPB::Empty)
  end

  def test_empty_params_ok
    AwsElbs.new
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsElbs.new(shoe_size: 9) }
  end
end


#=============================================================================#
#                            Filter Criteria
#=============================================================================#
class AwsElbsFilterCriteriaTest < Minitest::Test

  def setup
    AwsElbs::BackendFactory.select(MAEPB::Basic)
  end

  def test_filter_with_no_criteria
    assert AwsElbs.new.exists?
    assert_equal(3, AwsElbs.new.count)
  end

  def test_filter_with_availability_zones
    hit = AwsElbs.new.where { availability_zones.include? 'us-east-1c' }
    assert(hit.exists?)
    assert_equal(2, hit.count)

    miss = AwsElbs.new.where { availability_zones.include? 'us-east-1g' }
    refute(miss.exists?)
  end

  def test_filter_with_dns_name
    hit = AwsElbs.new.where(:dns_name => /us-east-1\.aws/)
    assert(hit.exists?)
    assert_equal(2, hit.count)

    miss = AwsElbs.new.where(:dns_name => 'bananas')
    refute(miss.exists?)
  end

  def test_filter_with_elb_name
    hit = AwsElbs.new.where(:elb_name => /kang/)
    assert(hit.exists?)
    assert_equal(2, hit.count)

    miss = AwsElbs.new.where(:elb_name => 'kodos')
    refute(miss.exists?)
  end

  def test_filter_with_external_ports
    hit = AwsElbs.new.where { external_ports.include? 631 }
    assert(hit.exists?)
    assert_equal(1, hit.count)

    miss = AwsElbs.new.where { external_ports.include? 22000 }
    refute(miss.exists?)
  end

  def test_filter_with_instance_ids
    hit = AwsElbs.new.where { instance_ids.include? 'i-12345678' }
    assert(hit.exists?)
    assert_equal(1, hit.count)

    miss = AwsElbs.new.where { instance_ids.include? 'i-deadbeef' }
    refute(miss.exists?)
  end

  def test_filter_with_internal_ports
    hit = AwsElbs.new.where { internal_ports.include? 80 }
    assert(hit.exists?)
    assert_equal(2, hit.count)

    miss = AwsElbs.new.where { internal_ports.include? 93 }
    refute(miss.exists?)
  end

  def test_filter_with_security_group_ids
    hit = AwsElbs.new.where { security_group_ids.include? 'sg-12345678' }
    assert(hit.exists?)
    assert_equal(3, hit.count)

    miss = AwsElbs.new.where { security_group_ids.include? 'sg-99999999' }
    refute(miss.exists?)
  end

  def test_filter_with_subnet_ids
    hit = AwsElbs.new.where { subnet_ids.include? 'subnet-12345678' }
    assert(hit.exists?)
    assert_equal(2, hit.count)

    miss = AwsElbs.new.where { subnet_ids.include? 'subnet-99999999' }
    refute(miss.exists?)
  end

  def test_filter_with_vpc_id
    hit = AwsElbs.new.where(:vpc_id => 'vpc-12345678')
    assert(hit.exists?)
    assert_equal(2, hit.count)

    miss = AwsElbs.new.where(:vpc_id => 'vpc-09876543')
    refute(miss.exists?)
  end

  # names
  
end

#=============================================================================#
#                            Properties
#=============================================================================#
class AwsElbsProperties < Minitest::Test

  def setup
    AwsElbs::BackendFactory.select(MAEPB::Basic)
    @elbs = AwsElbs.new
  end

  # count
  # availability_zones
  # dns_names
  # external_ports
  # instance_ids       
  # internal_ports
  # names
  # security_group_ids
  # subnet_ids
  # vpc_ids

  # def test_property_vpc_ids
  #   assert_includes(@elbs.vpc_ids, 'vpc-aaaabbbb')
  #   assert_includes(@elbs.vpc_ids, 'vpc-12344321')
  #   refute_includes(@elbs.vpc_ids, nil)
  # end

end
#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module MAEPB
  class Empty < AwsBackendBase
    def describe_load_balancers(query = {})
      Aws::ElasticLoadBalancing::Types::DescribeAccessPointsOutput.new(
        load_balancer_descriptions: []
      )
    end
  end

  class Basic < AwsBackendBase
    def describe_load_balancers(query = {})
      Aws::ElasticLoadBalancing::Types::DescribeAccessPointsOutput.new(
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
            ],
            subnets: [
              'subnet-ccccdddd',
              'subnet-aaaabbbb',
            ],
            vpc_id: 'vpc-87654321',
          )
        ]
      )
    end
  end
end
