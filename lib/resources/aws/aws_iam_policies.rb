require 'resource_support/aws/aws_plural_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-iam'

class AwsIamPolicies < Inspec.resource(1)
  name 'aws_iam_policies'
  desc 'Verifies settings for AWS IAM Policies in bulk'
  example <<~EXAMPLE
    describe aws_iam_policies do
      it { should exist }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsPluralResourceMixin
  def validate_params(resource_params)
    unless resource_params.empty?
      raise ArgumentError, 'aws_iam_policies does not accept resource parameters.'
    end
    resource_params
  end

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
  filter.register_column(:policy_names, field: :policy_name)
        .register_column(:arns, field: :arn)
  filter.install_filter_methods_on_resource(self, :table)

  def to_s
    'IAM Policies'
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    @table = []
    pagination_opts = {}
    loop do
      api_result = backend.list_policies(pagination_opts)
      @table += api_result.policies.map(&:to_h)
      pagination_opts = { marker: api_result.marker }
      break unless api_result.is_truncated
    end
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::IAM::Client

      def list_policies(query)
        aws_service_client.list_policies(query)
      end
    end
  end
end
