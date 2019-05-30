require 'resource_support/aws/aws_plural_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-ec2'

class AwsEc2Instances < Inspec.resource(1)
  name 'aws_ec2_instances'
  desc 'Verifies settings for AWS EC2 Instances in bulk'
  example <<~EXAMPLE
    describe aws_ec2_instances do
      it { should exist }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsPluralResourceMixin
  def validate_params(resource_params)
    unless resource_params.empty?
      raise ArgumentError, 'aws_ec2_instances does not accept resource parameters.'
    end
    resource_params
  end

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
  filter.register_column(:instance_ids, field: :instance_id)
  filter.install_filter_methods_on_resource(self, :table)

  def to_s
    'EC2 Instances'
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    @table = []
    pagination_opts = {}
    loop do
      api_result = backend.describe_instances(pagination_opts)
      @table += unpack_describe_instances_response(api_result.reservations)
      break unless api_result.next_token
      pagination_opts = { next_token: api_result.next_token }
    end
  end

  def unpack_describe_instances_response(reservations)
    instance_rows = []
    reservations.each do |res|
      instance_rows += res.instances.map do |instance_struct|
        {
          instance_id: instance_struct.instance_id,
        }
      end
    end
    instance_rows
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::EC2::Client

      def describe_instances(query)
        aws_service_client.describe_instances(query)
      end
    end
  end
end
