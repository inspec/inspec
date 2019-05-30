require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-elasticloadbalancing'

class AwsElb < Inspec.resource(1)
  name 'aws_elb'
  desc 'Verifies settings for AWS Elastic Load Balancer'
  example <<~EXAMPLE
    describe aws_elb('myelb') do
      it { should exist }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :availability_zones, :dns_name, :elb_name, :external_ports,
              :instance_ids, :internal_ports, :security_group_ids,
              :subnet_ids, :vpc_id

  def to_s
    "AWS ELB #{elb_name}"
  end

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:elb_name],
      allowed_scalar_name: :elb_name,
      allowed_scalar_type: String,
    )

    if validated_params.empty?
      raise ArgumentError, 'You must provide a elb_name to aws_elb.'
    end

    validated_params
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    begin
      lbs = backend.describe_load_balancers(load_balancer_names: [elb_name]).load_balancer_descriptions
      @exists = true
      # Load balancer names are uniq; we will either have 0 or 1 result
      unpack_describe_elbs_response(lbs.first)
    rescue Aws::ElasticLoadBalancing::Errors::LoadBalancerNotFound
      @exists = false
      populate_as_missing
    end
  end

  def unpack_describe_elbs_response(lb_struct)
    @availability_zones = lb_struct.availability_zones
    @dns_name = lb_struct.dns_name
    @external_ports = lb_struct.listener_descriptions.map { |ld| ld.listener.load_balancer_port }
    @instance_ids = lb_struct.instances.map(&:instance_id)
    @internal_ports = lb_struct.listener_descriptions.map { |ld| ld.listener.instance_port }
    @elb_name = lb_struct.load_balancer_name
    @security_group_ids = lb_struct.security_groups
    @subnet_ids = lb_struct.subnets
    @vpc_id = lb_struct.vpc_id
  end

  def populate_as_missing
    @availability_zones = []
    @external_ports = []
    @instance_ids = []
    @internal_ports = []
    @security_group_ids = []
    @subnet_ids = []
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::ElasticLoadBalancing::Client

      def describe_load_balancers(query = {})
        aws_service_client.describe_load_balancers(query)
      end
    end
  end
end
