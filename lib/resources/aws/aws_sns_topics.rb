class AwsSnsTopics < Inspec.resource(1)
  name 'aws_sns_topics'
  desc 'Verifies settings for SNS Topics in bulk'
  example "
    describe aws_sns_topics do
      its('topic_arns') { should include '' }
    end
  "
  supports platform: 'aws'

  include AwsPluralResourceMixin

  def validate_params(resource_params)
    unless resource_params.empty?
      raise ArgumentError, 'aws_sns_topics does not accept resource parameters.'
    end
    resource_params
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    @table = backend.list_topics.topics.map(&:to_h)
  end

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.add_accessor(:where)
        .add_accessor(:entries)
        .add(:exists?) { |x| !x.entries.empty? }
        .add(:topic_arns, field: :topic_arn)
  filter.connect(self, :table)

  def to_s
    'EC2 SNS Topics'
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend self
      self.aws_client_class = Aws::SNS::Client

      def list_topics
        aws_service_client.list_topics
      end
    end
  end
end
