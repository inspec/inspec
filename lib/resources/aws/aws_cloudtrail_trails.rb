class AwsCloudTrailTrails < Inspec.resource(1)
  name 'aws_cloudtrail_trails'
  desc 'Verifies settings for AWS CloudTrail Trails in bulk'
  example '
    describe aws_cloudtrail_trails do
      it { should exist }
    end
  '

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.add_accessor(:entries)
        .add(:exists?) { |x| !x.entries.empty? }
        .add(:names, field: :name)
        .add(:trail_arns, field: :trail_arn)
  filter.connect(self, :trail_data)

  def trail_data
    @table
  end

  def to_s
    'CloudTrail Trails'
  end

  def initialize
    backend = AwsCloudTrailTrails::BackendFactory.create
    @table = backend.describe_trails({}).to_h[:trail_list]
  end

  class BackendFactory
    extend AwsBackendFactoryMixin
  end

  class Backend
    class AwsClientApi
      BackendFactory.set_default_backend(self)

      def describe_trails(query)
        AWSConnection.new.cloudtrail_client.describe_trails(query)
      end
    end
  end
end

