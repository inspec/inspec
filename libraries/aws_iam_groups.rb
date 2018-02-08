require '_aws'

class AwsIamGroups < Inspec.resource(1)
  name 'aws_iam_groups'
  desc 'Verifies settings for AWS IAM groups in bulk'
  example '
    describe aws_iam_groups do
      it { should exist }
    end
  '
  supports platform: 'aws'

  include AwsPluralResourceMixin

  def validate_params(resource_params)
    unless resource_params.empty?
      raise ArgumentError, 'aws_iam_groups does not accept resource parameters.'
    end
    resource_params
  end

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.add_accessor(:entries)
        .add(:exists?) { |x| !x.entries.empty? }
  filter.connect(self, :table)

  def to_s
    'IAM Groups'
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    @table = backend.list_groups.to_h[:groups]
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::IAM::Client

      def list_groups(query = {})
        aws_service_client.list_groups(query)
      end
    end
  end
end
