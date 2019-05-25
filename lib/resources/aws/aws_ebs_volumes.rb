require 'resource_support/aws/aws_plural_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-ec2'

class AwsEbsVolumes < Inspec.resource(1)
  name 'aws_ebs_volumes'
  desc 'Verifies settings for AWS EBS Volumes in bulk'
  example <<~EXAMPLE
    describe aws_ebs_volumes do
      it { should exist }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsPluralResourceMixin
  def validate_params(resource_params)
    unless resource_params.empty?
      raise ArgumentError, 'aws_ebs_volumes does not accept resource parameters.'
    end
    resource_params
  end

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
  filter.register_column(:volume_ids, field: :volume_id)
  filter.install_filter_methods_on_resource(self, :table)

  def to_s
    'EBS Volumes'
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    @table = []
    pagination_opts = {}
    loop do
      api_result = backend.describe_volumes(pagination_opts)
      @table += unpack_describe_volumes_response(api_result.volumes)
      break unless api_result.next_token
      pagination_opts = { next_token: api_result.next_token }
    end
  end

  def unpack_describe_volumes_response(volumes)
    volume_rows = []
    volumes.each do |res|
      volume_rows += res.attachments.map do |volume_struct|
        {
          volume_id: volume_struct.volume_id,
        }
      end
    end
    volume_rows
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::EC2::Client

      def describe_volumes(query)
        aws_service_client.describe_volumes(query)
      end
    end
  end
end
