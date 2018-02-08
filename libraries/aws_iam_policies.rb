require '_aws'

class AwsIamPolicies < Inspec.resource(1)
  name 'aws_iam_policies'
  desc 'Verifies settings for AWS IAM Policies in bulk'
  example '
    describe aws_iam_policies do
      it { should exist }
    end
  '
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
  filter.add_accessor(:entries)
        .add(:exists?) { |x| !x.entries.empty? }
        .add(:policy_names, field: :policy_name)
        .add(:arns, field: :arn)
  filter.connect(self, :table)

  def to_s
    'IAM Policies'
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    @table = backend.list_policies({}).to_h[:policies]
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
