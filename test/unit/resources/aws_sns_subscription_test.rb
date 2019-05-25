require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_sns_subscription'

require 'resource_support/aws'
require 'resources/aws/aws_sns_subscription'

# MASSSB = MockAwsSNSSubscriptionSingularBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsSnsSubscriptionConstructorTest < Minitest::Test

  def setup
    AwsSnsSubscription::BackendFactory.select(AwsMASSSB::Basic)
  end

  def test_empty_params_not_ok
    assert_raises(ArgumentError) { AwsSnsSubscription.new }
  end

  def test_accepts_subscription_arn_as_scalar
    AwsSnsSubscription.new('arn:aws:sns:us-west-2:0123456789012:my-topic2:8a21d249-4329-4871-acc6-7be709c6ea7f')
  end

  def test_accepts_subscription_arn_as_hash
    AwsSnsSubscription.new(subscription_arn: 'arn:aws:sns:us-west-2:0123456789012:my-topic2:8a21d249-4329-4871-acc6-7be709c6ea7f')
  end
end


#=============================================================================#
#                               Search / Recall
#=============================================================================#
class AwsSnsSubscriptionRecallTest < Minitest::Test

  def setup
    AwsSnsSubscription::BackendFactory.select(AwsMASSSB::Basic)
  end

  def test_search_hit_via_scalar_works
    assert AwsSnsSubscription.new('arn:aws:sns:us-west-2:0123456789012:my-topic2:8a21d249-4329-4871-acc6-7be709c6ea7f').exists?
  end

  def test_search_hit_via_hash_works
    assert AwsSnsSubscription.new(subscription_arn: 'arn:aws:sns:us-west-2:0123456789012:my-topic2:8a21d249-4329-4871-acc6-7be709c6ea7f').exists?
  end

  def test_search_miss_is_not_an_exception
    refute AwsSnsSubscription.new(subscription_arn: 'arn:aws:sns:us-west-2:0123456789012:my-topic_non_existent:8a21d249-4329-4871-00000-00000000').exists?
  end
end

#=============================================================================#
#                               Properties
#=============================================================================#
class AwsSnsSubscriptionPropertiesTest < Minitest::Test

  def setup
    AwsSnsSubscription::BackendFactory.select(AwsMASSSB::Basic)
  end

  def test_property_topic_arn
    assert_equal('arn:aws:sns:us-west-2:0123456789012:my-topic2', AwsSnsSubscription.new('arn:aws:sns:us-west-2:0123456789012:my-topic2:8a21d249-4329-4871-acc6-7be709c6ea7f').topic_arn)
    assert_nil(AwsSnsSubscription.new('arn:aws:sns:us-west-2:0123456789012:my-topic2:00000-0000-0000-0000-000000').topic_arn)
  end

  def test_property_endpoint
    assert_equal('my-email2@example.com', AwsSnsSubscription.new('arn:aws:sns:us-west-2:0123456789012:my-topic2:8a21d249-4329-4871-acc6-7be709c6ea7f').endpoint)
    assert_nil(AwsSnsSubscription.new('arn:aws:sns:us-west-2:0123456789012:my-topic2:00000-0000-0000-0000-000000').endpoint)
  end

  def test_property_protocol
    assert_equal('https', AwsSnsSubscription.new('arn:aws:sns:us-west-2:0123456789012:my-topic2:8a21d249-4329-4871-acc6-7be709c6ea7f').protocol)
    assert_equal('email', AwsSnsSubscription.new('arn:aws:sns:us-west-2:0123456789012:my-topic:8a21d249-4329-4871-acc6-7be709c6ea7f').protocol)
    assert_nil(AwsSnsSubscription.new('arn:aws:sns:us-west-2:0123456789012:my-topic2:00000-0000-0000-0000-000000').protocol)
  end

  def test_property_owner
    assert_equal('0123456789012', AwsSnsSubscription.new('arn:aws:sns:us-west-2:0123456789012:my-topic2:8a21d249-4329-4871-acc6-7be709c6ea7f').owner)
    assert_nil(AwsSnsSubscription.new('arn:aws:sns:us-west-2:0123456789012:my-topic2:00000-0000-0000-0000-000000').owner)
  end
end


#=============================================================================#
#                               Matchers
#=============================================================================#
class AwsSnsSubscriptionMatchersTest < Minitest::Test

  def setup
    AwsSnsSubscription::BackendFactory.select(AwsMASSSB::Basic)
  end

  def test_matcher_raw_message_delivery_positive
    assert AwsSnsSubscription.new('arn:aws:sns:us-west-2:0123456789012:my-topic2:8a21d249-4329-4871-acc6-7be709c6ea7f').raw_message_delivery?
  end

  def test_matcher_raw_message_delivery_negative
    refute AwsSnsSubscription.new('arn:aws:sns:us-west-2:0123456789012:my-topic:8a21d249-4329-4871-acc6-7be709c6ea7f').raw_message_delivery?
  end
  
  def test_matcher_confirmation_authenticated_positive
    assert AwsSnsSubscription.new('arn:aws:sns:us-west-2:0123456789012:my-topic2:8a21d249-4329-4871-acc6-7be709c6ea7f').confirmation_authenticated?
  end
  
  def test_matcher_confirmation_authenticated_negative
    refute AwsSnsSubscription.new('arn:aws:sns:us-west-2:0123456789012:my-topic:8a21d249-4329-4871-acc6-7be709c6ea7f').confirmation_authenticated?
  end

end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module AwsMASSSB
  class Basic < AwsBackendBase
    def get_subscription_attributes(query)
      fixtures = OpenStruct.new({
        'arn:aws:sns:us-west-2:0123456789012:my-topic:8a21d249-4329-4871-acc6-7be709c6ea7f' => OpenStruct.new({
          "attributes" => OpenStruct.new({
            "Endpoint": "my-email@example.com",
            "Protocol": "email",
            "RawMessageDelivery": "false",
            "ConfirmationWasAuthenticated": "false",
            "Owner": "0123456789012",
            "SubscriptionArn": "arn:aws:sns:us-west-2:0123456789012:my-topic:8a21d249-4329-4871-acc6-7be709c6ea7f",
            "TopicArn": "arn:aws:sns:us-west-2:0123456789012:my-topic"
          }),
        }),
        'arn:aws:sns:us-west-2:0123456789012:my-topic2:8a21d249-4329-4871-acc6-7be709c6ea7f' => OpenStruct.new({
          "attributes" => OpenStruct.new({
            "Endpoint": "my-email2@example.com",
            "Protocol": "https",
            "RawMessageDelivery": "true",
            "ConfirmationWasAuthenticated": "true",
            "Owner": "0123456789012",
            "SubscriptionArn": "arn:aws:sns:us-west-2:0123456789012:my-topic2:8a21d249-4329-4871-acc6-7be709c6ea7f",
            "TopicArn": "arn:aws:sns:us-west-2:0123456789012:my-topic2"
          }),
        }),
      })
      return OpenStruct.new(fixtures[query[:subscription_arn]] ) unless fixtures[query[:subscription_arn]].nil?
      raise Aws::SNS::Errors::NotFound.new(Seahorse::Client::Http::Request, "Key does not exist")
    end
  end
end
