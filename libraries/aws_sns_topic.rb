require 'aws_conn'

class AwsSnsTopic < Inspec.resource(1)
  name 'aws_sns_topic'
  desc 'Verifies settings for an SNS Topic'
  example "
    describe aws_sns_topic('arn:aws:sns:us-east-1:123456789012:some-topic') do
      it { should exist }
      its('confirmed_subscription_count') { should_not be_zero }
    end
  "

  attr_reader :arn, :confirmed_subscription_count

  def initialize(raw_params)
    validated_params = validate_params(raw_params)
    @arn = validated_params[:arn]
    search
  end

  def exists?
    @exists
  end

  private

  def validate_params(raw_params)
    # Allow passing ARN as a scalar string, not in a hash
    raw_params = { arn: raw_params } if raw_params.is_a?(String)

    # Remove all expected params from the raw param hash
    validated_params = {}
    [
      :arn,
    ].each do |expected_param|
      validated_params[expected_param] = raw_params.delete(expected_param) if raw_params.key?(expected_param)
    end

    # Any leftovers are unwelcome
    unless raw_params.empty?
      raise ArgumentError, "Unrecognized resource param '#{raw_params.keys.first}'"
    end

    # Validate the ARN
    unless validated_params[:arn] =~ /^arn:aws:sns:[\w\-]+:\d{12}:[\S]+$/
      raise ArgumentError, 'Malformed ARN for SNS topics.  Expected an ARN of the form ' \
                           "'arn:aws:sns:REGION:ACCOUNT-ID:TOPIC-NAME'"
    end

    validated_params
  end

  def search
    aws_response = AwsSnsTopic::Backend.create.get_topic_attributes(topic_arn: @arn).attributes
    @exists = true

    # The response has a plain hash with CamelCase plain string keys and string values
    @confirmed_subscription_count = aws_response['SubscriptionsConfirmed'].to_i
  rescue Aws::SNS::Errors::NotFound
    @exists = false
  end

  class Backend
    #=====================================================#
    #                    API Definition
    #=====================================================#
    [
      :get_topic_attributes,
    ].each do |method|
      define_method(:method) do |*_args|
        raise "Unimplemented abstract method #{method} - internal error"
      end
    end

    #=====================================================#
    #                 Concrete Implementation
    #=====================================================#
    # Uses the SDK API to really talk to AWS
    class AwsClientApi < Backend
      def get_topic_attributes(criteria)
        AWSConnection.new.sns_client.get_topic_attributes(criteria)
      end
    end

    #=====================================================#
    #                   Factory Interface
    #=====================================================#
    # TODO: move this to a mix-in
    DEFAULT_BACKEND = AwsClientApi
    @selected_backend = DEFAULT_BACKEND

    def self.create
      @selected_backend.new
    end

    def self.select(klass)
      @selected_backend = klass
    end
  end
end
