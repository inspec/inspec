require '_aws'

class AwsSecurityGroup < Inspec.resource(1)
  name 'aws_security_group'
  desc 'Verifies settings for an individual AWS Security Group.'
  example '
    describe aws_security_group("sg-12345678") do
      it { should exist }
    end
  '
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :description, :group_id, :group_name, :vpc_id

  def to_s
    "EC2 Security Group #{@group_id}"
  end

  private

  def validate_params(raw_params)
    recognized_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:id, :group_id, :group_name, :vpc_id],
      allowed_scalar_name: :group_id,
      allowed_scalar_type: String,
    )

    # id is an alias for group_id
    recognized_params[:group_id] = recognized_params.delete(:id) if recognized_params.key?(:id)

    if recognized_params.key?(:group_id) && recognized_params[:group_id] !~ /^sg\-[0-9a-f]{8}/
      raise ArgumentError, 'aws_security_group security group ID must be in the format "sg-" followed by 8 hexadecimal characters.'
    end

    if recognized_params.key?(:vpc_id) && recognized_params[:vpc_id] !~ /^vpc\-[0-9a-f]{8}/
      raise ArgumentError, 'aws_security_group VPC ID must be in the format "vpc-" followed by 8 hexadecimal characters.'
    end

    validated_params = recognized_params

    if validated_params.empty?
      raise ArgumentError, 'You must provide parameters to aws_security_group, such as group_name, group_id, or vpc_id.g_group.'
    end
    validated_params
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)

    # Transform into filter format expected by AWS
    filters = []
    [
      :description,
      :group_id,
      :group_name,
      :vpc_id,
    ].each do |criterion_name|
      instance_var = "@#{criterion_name}".to_sym
      next unless instance_variable_defined?(instance_var)
      val = instance_variable_get(instance_var)
      next if val.nil?
      filters.push(
        {
          name: criterion_name.to_s.tr('_', '-'),
          values: [val],
        },
      )
    end
    dsg_response = backend.describe_security_groups(filters: filters)

    if dsg_response.security_groups.empty?
      @exists = false
      return
    end

    @exists = true
    @description = dsg_response.security_groups[0].description
    @group_id   = dsg_response.security_groups[0].group_id
    @group_name = dsg_response.security_groups[0].group_name
    @vpc_id     = dsg_response.security_groups[0].vpc_id
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      AwsEc2SecurityGroup::BackendFactory.set_default_backend self
      self.aws_client_class = Aws::EC2::Client

      def describe_security_groups(query)
        aws_service_client.describe_security_groups(query)
      end
    end
  end
end
