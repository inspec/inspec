require '_aws'

class AwsSnsTopic < Inspec.resource(1)
  name 'aws_sns_topic'
  desc 'Verifies settings for an SNS Topic'
  example "
    describe aws_sns_topic('arn:aws:sns:us-east-1:123456789012:some-topic') do
      it { should exist }
      its('confirmed_subscription_count') { should_not be_zero }
    end
  "

  include AwsResourceMixin
  attr_reader :arn, :confirmed_subscription_count

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:arn],
      allowed_scalar_name: :arn,
      allowed_scalar_type: String,
    )
    # Validate the ARN
    unless validated_params[:arn] =~ /^arn:aws:sns:[\w\-]+:\d{12}:[\S]+$/
      raise ArgumentError, 'Malformed ARN for SNS topics.  Expected an ARN of the form ' \
                           "'arn:aws:sns:REGION:ACCOUNT-ID:TOPIC-NAME'"
    end
    validated_params
  end

  def fetch_from_aws
    aws_response = AwsSnsTopic::BackendFactory.create.get_topic_attributes(topic_arn: @arn).attributes
    @exists = true

    # The response has a plain hash with CamelCase plain string keys and string values
    @confirmed_subscription_count = aws_response['SubscriptionsConfirmed'].to_i
  rescue Aws::SNS::Errors::NotFound
    @exists = false
  end

  # Uses the SDK API to really talk to AWS
  class Backend
    class AwsClientApi
      BackendFactory.set_default_backend(self)

      def get_topic_attributes(criteria)
        AWSConnection.new.sns_client.get_topic_attributes(criteria)
      end
    end
  end
end
