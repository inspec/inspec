class AwsIamPolicies < Inspec.resource(1)
  name 'aws_iam_policies'
  desc 'Verifies settings for AWS IAM Policies in bulk'
  example '
    describe aws_iam_policies do
      it { should exist }
    end
  '

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.add_accessor(:entries)
        .add(:exists?) { |x| !x.entries.empty? }
        .add(:policy_names, field: :policy_name)
        .add(:arns, field: :arn)
  filter.connect(self, :policy_data)

  def policy_data
    @table
  end

  def to_s
    'IAM Policies'
  end

  def initialize
    backend = AwsIamPolicies::BackendFactory.create
    @table = backend.list_policies({}).to_h[:policies]
  end

  class BackendFactory
    extend AwsBackendFactoryMixin
  end

  class Backend
    class AwsClientApi
      BackendFactory.set_default_backend(self)

      def list_policies(query)
        AWSConnection.new.iam_client.list_policies(query)
      end
    end
  end
end
