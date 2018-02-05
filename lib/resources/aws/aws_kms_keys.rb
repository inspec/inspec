require '_aws'

class AwsKmsKeys < Inspec.resource(1)
  name 'aws_kms_keys'
  desc 'Verifies settings for AWS KMS Keys in bulk'
  example '
    describe aws_kms_keys do
      it { should exist }
    end
  '
  supports platform: 'aws'

  include AwsPluralResourceMixin
  def validate_params(resource_params)
    unless resource_params.empty?
      raise ArgumentError, 'aws_kms_keys does not accept resource parameters.'
    end
    resource_params
  end

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.add_accessor(:entries)
        .add(:exists?) { |x| !x.entries.empty? }
        .add(:key_arns, field: :key_arn)
        .add(:key_ids, field: :key_id)
  filter.connect(self, :table)

  def to_s
    'KMS Keys'
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    @table = backend.list_keys({ limit: 1000 }).to_h[:keys] # max value for limit is 1000
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::KMS::Client

      def list_keys(query = {})
        aws_service_client.list_keys(query)
      end
    end
  end
end
