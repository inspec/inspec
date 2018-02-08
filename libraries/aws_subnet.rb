# author: Matthew Dromazos

require '_aws'

class AwsSubnet < Inspec.resource(1)
  name 'aws_subnet'
  desc 'This resource is used to test the attributes of a VPC subnet'
  example "
    describe aws_subnet(subnet_id: 'subnet-12345678') do
      it { should exist }
      its('cidr_block') { should eq '10.0.1.0/24' }
    end
  "
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :assigning_ipv_6_address_on_creation, :availability_zone, :available_ip_address_count,
              :available, :cidr_block, :default_for_az, :ipv_6_cidr_block_association_set,
              :mapping_public_ip_on_launch, :subnet_id, :vpc_id
  alias available? available
  alias default_for_az? default_for_az
  alias mapping_public_ip_on_launch? mapping_public_ip_on_launch
  alias assigning_ipv_6_address_on_creation? assigning_ipv_6_address_on_creation

  def to_s
    "VPC Subnet #{@subnet_id}"
  end

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:subnet_id],
      allowed_scalar_name: :subnet_id,
      allowed_scalar_type: String,
    )

    # Make sure the subnet_id parameter was specified and in the correct form.
    if validated_params.key?(:subnet_id) && validated_params[:subnet_id] !~ /^subnet\-[0-9a-f]{8}/
      raise ArgumentError, 'aws_subnet Subnet ID must be in the format "subnet-" followed by 8 hexadecimal characters.'
    end

    if validated_params.empty?
      raise ArgumentError, 'You must provide a subnet_id to aws_subnet.'
    end

    validated_params
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)

    # Transform into filter format expected by AWS
    filters = []
    filters.push({ name: 'subnet-id', values: [@subnet_id] })
    ds_response = backend.describe_subnets(filters: filters)

    # If no subnets exist in the VPC, exist is false.
    if ds_response.subnets.empty?
      @exists = false
      return
    end
    @exists = true
    assign_properties(ds_response)
  end

  def assign_properties(ds_response)
    @vpc_id                              = ds_response.subnets[0].vpc_id
    @subnet_id                           = ds_response.subnets[0].subnet_id
    @cidr_block                          = ds_response.subnets[0].cidr_block
    @availability_zone                   = ds_response.subnets[0].availability_zone
    @available_ip_address_count          = ds_response.subnets[0].available_ip_address_count
    @default_for_az                      = ds_response.subnets[0].default_for_az
    @mapping_public_ip_on_launch         = ds_response.subnets[0].map_public_ip_on_launch
    @available                           = ds_response.subnets[0].state == 'available'
    @ipv_6_cidr_block_association_set    = ds_response.subnets[0].ipv_6_cidr_block_association_set
    @assigning_ipv_6_address_on_creation = ds_response.subnets[0].assign_ipv_6_address_on_creation
  end

  # Uses the SDK API to really talk to AWS
  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::EC2::Client

      def describe_subnets(query)
        aws_service_client.describe_subnets(query)
      end
    end
  end
end
