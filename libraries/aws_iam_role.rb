require '_aws'

class AwsIamRole < Inspec.resource(1)
  name 'aws_iam_role'
  desc 'Verifies settings for an IAM Role'
  example "
    describe aws_iam_role('my-role') do
      it { should exist }
    end
  "

  include AwsResourceMixin
  attr_reader :role_name, :description

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:role_name],
      allowed_scalar_name: :role_name,
      allowed_scalar_type: String,
    )
    if validated_params.empty?
      raise ArgumentError, 'You must provide a role_name to aws_iam_role.'
    end
    validated_params
  end

  def fetch_from_aws
    role_info = nil
    begin
      role_info = AwsIamRole::BackendFactory.create.get_role(role_name: role_name)
    rescue Aws::IAM::Errors::NoSuchEntity
      @exists = false
      return
    end
    @exists = true
    @description = role_info.role.description
  end

  # Uses the SDK API to really talk to AWS
  class Backend
    class AwsClientApi
      BackendFactory.set_default_backend(self)
      def get_role(query)
        AWSConnection.new.iam_client.get_role(query)
      end
    end
  end
end
