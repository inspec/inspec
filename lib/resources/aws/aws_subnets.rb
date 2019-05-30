require 'resource_support/aws/aws_plural_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-ec2'

class AwsSubnets < Inspec.resource(1)
  name 'aws_subnets'
  desc 'Verifies settings for VPC Subnets in bulk'
  example <<~EXAMPLE
    # you should be able to test the cidr_block of a subnet
    describe aws_subnets.where(vpc_id: 'vpc-123456789') do
      its('subnet_ids') { should eq ['subnet-12345678', 'subnet-87654321'] }
      its('cidr_blocks') { should eq ['172.31.96.0/20'] }
      its('states') { should_not include 'pending' }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsPluralResourceMixin

  def validate_params(resource_params)
    unless resource_params.empty?
      raise ArgumentError, 'aws_vpc_subnets does not accept resource parameters.'
    end
    resource_params
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    @table = backend.describe_subnets.subnets.map(&:to_h)
  end

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
  filter.register_column(:vpc_ids, field: :vpc_id)
        .register_column(:subnet_ids, field: :subnet_id)
        .register_column(:cidr_blocks, field: :cidr_block)
        .register_column(:states, field: :state)
  filter.install_filter_methods_on_resource(self, :table)

  def to_s
    'EC2 VPC Subnets'
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend self
      self.aws_client_class = Aws::EC2::Client

      def describe_subnets(query = {})
        aws_service_client.describe_subnets(query)
      end
    end
  end
end
