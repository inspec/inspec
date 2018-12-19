class AwsSqsQueue < Inspec.resource(1)
  name 'aws_sqs_queue'
  desc 'Verifies settings for an SQS Queue'
  example "
    describe aws_sqs_queue('https://sqs.ap-southeast-2.amazonaws.com/519527725796/QueueName') do
      it { should exist }
      its('confirmed_subscription_count') { should_not be_zero }
    end
  "
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :arn, :visibility_timeout

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:url],
      allowed_scalar_name: :url,
      allowed_scalar_type: String,
    )
    # Validate the URL
    # FIXME
    #unless validated_params[:url] =~ /^arn:aws:sqs:[\w\-]+:\d{12}:[\S]+$/
    #  raise ArgumentError, 'Malformed ARN for SQS.  Expected an ARN of the form ' \
    #                       "'arn:aws:sqs:REGION:ACCOUNT-ID:QUEUE-NAME'"
    #end
    validated_params
  end

  def fetch_from_api
    aws_response = BackendFactory.create(inspec_runner).get_queue_attributes(queue_url: @url, attribute_names: ["All"]).attributes
    @exists = true

    # The response has a plain hash with CamelCase plain string keys and string values    
    @visibility_timeout = aws_response['VisibilityTimeout'].to_i
  rescue Aws::SQS::Errors::NotFound
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
