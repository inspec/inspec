require 'resource_support/aws/aws_plural_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-ec2'

class AwsRouteTables < Inspec.resource(1)
  name 'aws_route_tables'
  desc 'Verifies settings for AWS Route Tables in bulk'
  example <<~EXAMPLE
    describe aws_route_tables do
      it { should exist }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsPluralResourceMixin
  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
  filter.register_column(:vpc_ids, field: :vpc_id)
        .register_column(:route_table_ids, field: :route_table_id)
  filter.install_filter_methods_on_resource(self, :routes_data)

  def routes_data
    @table
  end

  def to_s
    'Route Tables'
  end

  private

  def validate_params(raw_criteria)
    unless raw_criteria.is_a? Hash
      raise 'Unrecognized criteria for fetching Route Tables. ' \
            "Use 'criteria: value' format."
    end

    # No criteria yet
    unless raw_criteria.empty?
      raise ArgumentError, 'aws_route_tables does not currently accept resource parameters.'
    end
    raw_criteria
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    catch_aws_errors do
      @table = backend.describe_route_tables({}).to_h[:route_tables]
    end
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend self
      self.aws_client_class = Aws::EC2::Client

      def describe_route_tables(query = {})
        aws_service_client.describe_route_tables(query)
      end
    end
  end
end
