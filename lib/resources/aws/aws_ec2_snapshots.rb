class AwsEc2SnapShots < Inspec.resource(1)
  name 'aws_ec2_snapshots'
  desc 'Verifies settings for AWS EC2 EBS snapshots in bulk'
  example <<~EXAMPLE
    describe aws_ec2_snapshots do
      it { should exist }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsPluralResourceMixin
  def validate_params(resource_params)
    unless resource_params.empty?
      raise ArgumentError, 'aws_ec2_snapshots does not accept resource parameters.'
    end
    resource_params
  end

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
  filter.register_column(:snapshot_ids, field: :snapshot_id)
  filter.register_column(:description, field: :description)
  filter.install_filter_methods_on_resource(self, :table)

  def to_s
    'EC2 Snapshots'
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    @table = []
    catch_aws_errors do
      begin
        api_result = backend.describe_snapshots(nil)
        @table = api_result.snapshots
      rescue Aws::EC2::Errors::ServiceError
        @exists = false
        return
      end
    end

    if table.empty?
      @exists = false
      return
    end
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::EC2::Client

      def describe_snapshots(query)
        aws_service_client.describe_snapshots(query)
      end
    end
  end
end
