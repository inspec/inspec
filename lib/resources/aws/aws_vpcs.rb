require 'resource_support/aws/aws_plural_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-ec2'

class AwsVpcs < Inspec.resource(1)
  name 'aws_vpcs'
  desc 'Verifies settings for AWS VPCs in bulk'
  example <<~EXAMPLE
    describe aws_vpcs do
      it { should exist }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsPluralResourceMixin

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
  filter.register_column(:cidr_blocks, field: :cidr_block)
        .register_column(:vpc_ids, field: :vpc_id)
  # We need a dummy here, so FilterTable will define and populate the dhcp_options_id field
  filter.register_column(:dummy, field: :dhcp_options_id)
        .register_column(:dhcp_options_ids) { |obj| obj.entries.map(&:dhcp_options_id).uniq }
  filter.install_filter_methods_on_resource(self, :table)

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
