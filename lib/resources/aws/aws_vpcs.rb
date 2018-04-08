class AwsVpcs < Inspec.resource(1)
  name 'aws_vpcs'
  desc 'Verifies settings for AWS VPCs in bulk'
  example '
    describe aws_vpcs do
      it { should exist }
    end
  '
  supports platform: 'aws'

  include AwsPluralResourceMixin

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.add_accessor(:entries)
        .add_accessor(:where)
        .add(:exists?) { |x| !x.entries.empty? }
        .add(:cidr_blocks, field: :cidr_block)
        .add(:vpc_ids, field: :vpc_id)
  # We need a dummy here, so FilterTable will define and populate the dhcp_options_id field
  filter.add(:dummy, field: :dhcp_options_id)
        .add(:dhcp_options_ids) { |obj| obj.entries.map(&:dhcp_options_id).uniq }
  filter.connect(self, :table)

  def validate_params(raw_params)
    # No params yet
    unless raw_params.empty?
      raise ArgumentError, 'aws_vpcs does not accept resource parameters'
    end
    raw_params
  end

  def to_s
    'VPCs'
  end

  def fetch_from_api
    describe_vpcs_response = BackendFactory.create(inspec_runner).describe_vpcs
    @table = describe_vpcs_response.to_h[:vpcs].map(&:to_h)
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::EC2::Client

      def describe_vpcs(query = {})
        aws_service_client.describe_vpcs(query)
      end
    end
  end
end
