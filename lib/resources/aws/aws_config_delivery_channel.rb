require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-configservice'

class AwsConfigDeliveryChannel < Inspec.resource(1)
  name 'aws_config_delivery_channel'
  desc 'Verifies settings for AWS Config Delivery Channel'
  example <<~EXAMPLE
    describe aws_config_delivery_channel do
      it { should exist }
      its('s3_bucket_name') { should eq 'my_bucket' }
      its('sns_topic_arn') { should eq arn:aws:sns:us-east-1:721741954427:sns_topic' }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :channel_name, :s3_bucket_name, :s3_key_prefix, :sns_topic_arn,
              :delivery_frequency_in_hours

  def to_s
    "Config_Delivery_Channel: #{@channel_name}"
  end

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:channel_name],
      allowed_scalar_name: :channel_name,
      allowed_scalar_type: String,
    )

    validated_params
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    query = @channel_name ? { delivery_channel_names: [@channel_name] } : {}
    response = backend.describe_delivery_channels(query)

    @exists = !response.delivery_channels.empty?
    return unless exists?

    channel = response.delivery_channels.first.to_h
    @channel_name = channel[:name]
    @s3_bucket_name = channel[:s3_bucket_name]
    @s3_key_prefix = channel[:s3_key_prefix]
    @sns_topic_arn = channel[:sns_topic_arn]
    @delivery_frequency_in_hours = channel.dig(:config_snapshot_delivery_properties, :delivery_frequency)
    frequencies = {
      'One_Hour' => 1,
      'TwentyFour_Hours' => 24,
      'Three_Hours' => 3,
      'Six_Hours' => 6,
      'Twelve_Hours' => 12,
    }
    @delivery_frequency_in_hours = frequencies[@delivery_frequency_in_hours]
  rescue Aws::ConfigService::Errors::NoSuchDeliveryChannelException
    @exists = false
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::ConfigService::Client

      def describe_delivery_channels(query = {})
        aws_service_client.describe_delivery_channels(query)
      end
    end
  end
end
