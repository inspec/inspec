require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-iam'

class AwsIamGroup < Inspec.resource(1)
  name 'aws_iam_group'
  desc 'Verifies settings for AWS IAM Group'
  example <<~EXAMPLE
    describe aws_iam_group('mygroup') do
      it { should exist }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :group_name, :users

  def to_s
    "IAM Group #{group_name}"
  end

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:group_name],
      allowed_scalar_name: :group_name,
      allowed_scalar_type: String,
    )

    if validated_params.empty?
      raise ArgumentError, 'You must provide a group_name to aws_iam_group.'
    end

    validated_params
  end

  def fetch_from_api
    backend = AwsIamGroup::BackendFactory.create(inspec_runner)

    begin
      resp = backend.get_group(group_name: group_name)
      @exists = true
      @aws_group_struct = resp[:group]
      @users = resp[:users].map(&:user_name)
    rescue Aws::IAM::Errors::NoSuchEntity
      @exists = false
    end
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::IAM::Client

      def get_group(query)
        aws_service_client.get_group(query)
      end
    end
  end
end
