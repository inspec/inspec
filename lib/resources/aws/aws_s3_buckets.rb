require 'resource_support/aws/aws_plural_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-s3'

class AwsS3Buckets < Inspec.resource(1)
  name 'aws_s3_buckets'
  desc 'Verifies settings for AWS S3 Buckets in bulk'
  example <<~EXAMPLE
    describe aws_s3_bucket do
      its('bucket_names') { should eq ['my_bucket'] }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsPluralResourceMixin

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
  filter.register_column(:bucket_names, field: :name)
  filter.install_filter_methods_on_resource(self, :table)

  def to_s
    'S3 Buckets'
  end

  def validate_params(resource_params)
    unless resource_params.empty?
      raise ArgumentError, 'aws_s3_buckets does not accept resource parameters.'
    end
    resource_params
  end

  private

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    @table = backend.list_buckets.buckets.map(&:to_h)
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend self
      self.aws_client_class = Aws::S3::Client

      def list_buckets
        aws_service_client.list_buckets
      end
    end
  end
end
