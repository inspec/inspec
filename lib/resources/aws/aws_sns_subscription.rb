require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-sns'

class AwsSnsSubscription < Inspec.resource(1)
  name 'aws_sns_subscription'
  desc 'Verifies settings for an SNS Subscription'
  example <<~EXAMPLE
    describe aws_sns_subscription('arn:aws:sns:us-east-1::test-topic-01:b214aff5-a2c7-438f-a753-8494493f2ff6') do
      it { should_not have_raw_message_delivery }
      it { should be_confirmation_authenticated }
      its('owner') { should cmp '12345678' }
      its('topic_arn') { should cmp 'arn:aws:sns:us-east-1::test-topic-01' }
      its('endpoint') { should cmp 'arn:aws:sqs:us-east-1::test-queue-01' }
      its('protocol') { should cmp 'sqs' }
    end
  EXAMPLE

  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :arn, :owner, :raw_message_delivery, :topic_arn, :endpoint, :protocol,
              :confirmation_was_authenticated, :aws_response

  alias confirmation_authenticated? confirmation_was_authenticated
  alias raw_message_delivery? raw_message_delivery

  def has_raw_message_delivery?
    raw_message_delivery
  end

  def to_s
    "SNS Subscription #{@arn}"
  end

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:subscription_arn],
      allowed_scalar_name: :subscription_arn,
      allowed_scalar_type: String,
    )

    if validated_params.empty?
      raise ArgumentError, 'You must provide a subscription_arn to aws_sns_subscription.'
    end

    validated_params
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    catch_aws_errors do
      begin
        aws_response = backend.get_subscription_attributes(subscription_arn: @subscription_arn).attributes
        @exists = true
        @owner = aws_response['Owner']
        @raw_message_delivery = aws_response['RawMessageDelivery'].eql?('true')
        @topic_arn = aws_response['TopicArn']
        @endpoint = aws_response['Endpoint']
        @protocol = aws_response['Protocol']
        @confirmation_was_authenticated = aws_response['ConfirmationWasAuthenticated'].eql?('true')
      rescue Aws::SNS::Errors::NotFound
        @exists = false
        return
      end
    end
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend self
      self.aws_client_class = Aws::SNS::Client

      def get_subscription_attributes(criteria)
        aws_service_client.get_subscription_attributes(criteria)
      end
    end
  end
end
