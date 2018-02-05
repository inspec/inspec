class AwsKmsKeys < Inspec.resource(1)
  name 'aws_kms_keys'
  desc 'Verifies settings for AWS KMS Keys in bulk'
  example '
    describe aws_kms_keys do
      it { should exist }
    end
  '

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.add_accessor(:entries)
        .add(:exists?) { |x| !x.entries.empty? }
        .add(:key_arns, field: :key_arn)
        .add(:key_ids, field: :key_id)
  filter.connect(self, :key_data)

  def key_data
    @table
  end

  def to_s
    'KMS Keys'
  end

  def initialize
    backend = AwsKmsKeys::BackendFactory.create
    @table = backend.list_keys({ limit: 1000 }).to_h[:keys] # max value for limit is 1000
  end

  class BackendFactory
    extend AwsBackendFactoryMixin
  end

  class Backend
    class AwsClientApi
      BackendFactory.set_default_backend(self)

      def list_keys(query = {})
        AWSConnection.new.kms_client.list_keys(query)
      end
    end
  end
end
