require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-ec2'

class AwsVpc < Inspec.resource(1)
  name 'aws_vpc'
  desc 'Verifies settings for AWS VPC'
  example <<~EXAMPLE
    describe aws_vpc do
      it { should be_default }
      its('cidr_block') { should cmp '10.0.0.0/16' }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsSingularResourceMixin

  def to_s
    "VPC #{vpc_id}"
  end

  attr_reader :cidr_block, :dhcp_options_id, :instance_tenancy, :is_default,\
              :state, :vpc_id

  alias default? is_default

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:vpc_id],
      allowed_scalar_name: :vpc_id,
      allowed_scalar_type: String,
    )

    if validated_params.key?(:vpc_id) && validated_params[:vpc_id] !~ /^vpc\-([0-9a-f]{8})|(^vpc\-[0-9a-f]{17})$/
      raise ArgumentError, 'aws_vpc VPC ID must be in the format "vpc-" followed by 8 or 17 hexadecimal characters.'
    end

    validated_params
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)

    if @vpc_id.nil?
      filter = { name: 'isDefault', values: ['true'] }
    else
      filter = { name: 'vpc-id', values: [@vpc_id] }
    end

    resp = backend.describe_vpcs({ filters: [filter] })

    vpc = resp.vpcs[0].to_h
    @exists = !vpc.empty?
    return unless @exists

    @cidr_block = vpc[:cidr_block]
    @dhcp_options_id = vpc[:dhcp_options_id]
    @instance_tenancy = vpc[:instance_tenancy]
    @is_default = vpc[:is_default]
    @state = vpc[:state]
    @vpc_id = vpc[:vpc_id]
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::EC2::Client

      def describe_vpcs(query)
        aws_service_client.describe_vpcs(query)
      end
    end
  end
end
