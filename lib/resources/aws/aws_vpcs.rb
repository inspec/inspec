require '_aws'

class AwsVpcs < Inspec.resource(1)
  name 'aws_vpcs'
  desc 'Verifies settings for AWS VPCs in bulk'
  example '
    describe aws_vpcs do
      it { should exist }
    end
  '

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.add_accessor(:entries)
        .add(:exists?) { |x| !x.entries.empty? }
  filter.connect(self, :vpc_data)

  def vpc_data
    @table
  end

  def to_s
    'VPCs'
  end

  def initialize
    backend = AwsVpcs::BackendFactory.create
    @table = backend.describe_vpcs.to_h[:vpcs]
  end

  class BackendFactory
    extend AwsBackendFactoryMixin
  end

  class Backend
    class AwsClientApi
      BackendFactory.set_default_backend(self)

      def describe_vpcs(query = {})
        AWSConnection.new.ec2_client.describe_vpcs(query)
      end
    end
  end
end
