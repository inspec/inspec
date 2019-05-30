require 'resource_support/aws/aws_plural_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-cloudtrail'

class AwsCloudTrailTrails < Inspec.resource(1)
  name 'aws_cloudtrail_trails'
  desc 'Verifies settings for AWS CloudTrail Trails in bulk'
  example <<~EXAMPLE
    describe aws_cloudtrail_trails do
      it { should exist }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsPluralResourceMixin

  def validate_params(resource_params)
    unless resource_params.empty?
      raise ArgumentError, 'aws_cloudtrail_trails does not accept resource parameters.'
    end
    resource_params
  end

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
  filter.register_column(:trail_arns, field: :trail_arn)
  filter.register_column(:names, field: :name)
  filter.install_filter_methods_on_resource(self, :table)

  def to_s
    'CloudTrail Trails'
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    @table = backend.describe_trails({}).to_h[:trail_list]
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      AwsCloudTrailTrails::BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::CloudTrail::Client

      def describe_trails(query)
        aws_service_client.describe_trails(query)
      end
    end
  end
end
