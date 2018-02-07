class AwsIamGroups < Inspec.resource(1)
  name 'aws_iam_groups'
  desc 'Verifies settings for AWS IAM groups in bulk'
  example '
    describe aws_iam_groups do
      it { should exist }
    end
  '

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.add_accessor(:entries)
        .add(:exists?) { |x| !x.entries.empty? }
  filter.connect(self, :group_data)

  def group_data
    @table
  end

  def to_s
    'IAM Groups'
  end

  def initialize
    backend = AwsIamGroups::BackendFactory.create
    @table = backend.list_groups.to_h[:groups]
  end

  class BackendFactory
    extend AwsBackendFactoryMixin
  end

  class Backend
    class AwsClientApi
      BackendFactory.set_default_backend(self)

      def list_groups(query = {})
        AWSConnection.new.iam_client.list_groups(query)
      end
    end
  end
end
