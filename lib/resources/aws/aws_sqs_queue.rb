require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-sqs'

require 'uri'

class AwsSqsQueue < Inspec.resource(1)
  name 'aws_sqs_queue'
  desc 'Verifies settings for an SQS Queue'
  example <<~EXAMPLE
    describe aws_sqs_queue('https://sqs.ap-southeast-2.amazonaws.com/519527725796/QueueName') do
      it { should exist }
      its('visiblity_timeout') { should be 300}
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :arn, :is_fifo_queue, :visibility_timeout, :maximum_message_size, :message_retention_period, :delay_seconds, :receive_message_wait_timeout_seconds, :content_based_deduplication

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:url],
      allowed_scalar_name: :url,
      allowed_scalar_type: String,
    )
    # Validate the URL
    unless validated_params[:url] =~ /\A#{URI::DEFAULT_PARSER.make_regexp(%w{https})}\z/
      raise ArgumentError, 'Malformed URL for SQS.  Expected an ARN of the form ' \
                           "'https://sqs.ap-southeast-2.amazonaws.com/111212121/MyQeueue'"
    end
    validated_params
  end

  def fetch_from_api
    aws_response = BackendFactory.create(inspec_runner).get_queue_attributes(queue_url: @url, attribute_names: ['All']).attributes
    @exists = true
    @visibility_timeout = aws_response['VisibilityTimeout'].to_i
    @maximum_message_size = aws_response['MaximumMessageSize'].to_i
    @message_retention_period = aws_response['MessageRetentionPeriod'].to_i
    @delay_seconds = aws_response['DelaySeconds'].to_i
    @receive_message_wait_timeout_seconds = aws_response['ReceiveMessageWaitTimeSeconds'].to_i

    # FIFO queues - these attributes only exist for FIFO queues, their presence indicates a FIFO
    # queue
    @is_fifo_queue = aws_response['FifoQueue'].nil? ? false: true
    @content_based_deduplication = aws_response['ContentBasedDeduplication'].nil? ? false: true
  rescue Aws::SQS::Errors::NonExistentQueue
    @exists = false
  end

  # Uses the SDK API to really talk to AWS
  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::SQS::Client

      def get_queue_attributes(criteria)
        aws_service_client.get_queue_attributes(criteria)
      end
    end
  end
end
