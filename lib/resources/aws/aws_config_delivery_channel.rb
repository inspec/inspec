class AwsConfigurationDeliveryChannel < Inspec.resource(1)
  name 'aws_config_delivery_channel'
  desc 'Verifies settings for AWS Configuration Delivery Channel'
  example "
    describe aws_config_delivery_channel do
      it { should exist }
      it { should be_default }
      its('s3_bucket_name') { should_not be_nil }
      its('sns_topic_arn') { should_not be_nil }
    end
  "
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :channel_name, :s3_bucket_name, :s3_key_prefix, :sns_topic_arn,
              :delivery_frequency

  def to_s
    "Configuration_Delivery_Channel: #{@channel_name}"
  end

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:channel_name],
      allowed_scalar_name: :channel_name,
      allowed_scalar_type: String,
    )

    # Make sure channel_name is given as param
    if validated_params[:channel_name].nil?
      raise ArgumentError, 'You must provide a channel_name to aws_config_delivery_channel'
    end

    validated_params
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    query = { delivery_channel_names: [@channel_name] }
    @resp = backend.describe_delivery_channels(query)
    @exists = !@resp.empty?
    return unless @exists

    @channel = @resp.delivery_channels.first.to_h
    @channel_name = @channel[:name]
    @s3_bucket_name = @channel[:s3_bucket_name]
    @s3_key_prefix = @channel[:s3_key_prefix]
    @sns_topic_arn = @channel[:sns_topic_arn]
    @delivery_frequency = @channel[:config_snapshot_delivery_properties][:delivery_frequency] unless @channel[:config_snapshot_delivery_properties].nil?
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::ConfigService::Client

      def describe_delivery_channels(query)
        aws_service_client.describe_delivery_channels(query)
      rescue Aws::ConfigService::Errors::NoSuchDeliveryChannelException
        return {}
      end
    end
  end
end
