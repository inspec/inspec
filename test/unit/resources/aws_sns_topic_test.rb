require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_sns_topic'

require 'resource_support/aws'
require 'resources/aws/aws_sns_topic'

# MSNB = MockSnsBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsSnsTopicConstructorTest < Minitest::Test
  def setup
    AwsSnsTopic::BackendFactory.select(AwsMSNB::NoSubscriptions)
  end

  def test_constructor_some_args_required
    assert_raises(ArgumentError) { AwsSnsTopic.new }
  end

  def test_constructor_accepts_scalar_arn
    AwsSnsTopic.new('arn:aws:sns:us-east-1:123456789012:some-topic')
  end

  def test_constructor_accepts_arn_as_hash
    AwsSnsTopic.new(arn: 'arn:aws:sns:us-east-1:123456789012:some-topic')    
  end
  
  def test_constructor_rejects_unrecognized_resource_params
    assert_raises(ArgumentError) { AwsSnsTopic.new(beep: 'boop') }
  end
    
  def test_constructor_rejects_non_arn_formats
    [
      'not-even-like-an-arn',
      'arn:::::', # Empty
      'arn::::::', # Too many colons
      'arn:aws::us-east-1:123456789012:some-topic', # Omits SNS service
      'arn::sns:us-east-1:123456789012:some-topic', # Omits partition
      'arn:aws:sns:*:123456789012:some-topic',  # All-region - not permitted for lookup
      'arn:aws:sns:us-east-1::some-topic',      # Default account - not permitted for lookup
    ].each do |example|
      assert_raises(ArgumentError) { AwsSnsTopic.new(arn: example) }
    end
  end
end

#=============================================================================#
#                               Search / Recall
#=============================================================================#
class AwsSnsTopicRecallTest < Minitest::Test
  # No setup here - each test needs to explicitly declare
  # what they want from the backend.

  def test_recall_no_match_is_no_exception
    AwsSnsTopic::BackendFactory.select(AwsMSNB::Miss)
    topic = AwsSnsTopic.new('arn:aws:sns:us-east-1:123456789012:nope')
    refute topic.exists?
  end

  def test_recall_match_single_result_works
    AwsSnsTopic::BackendFactory.select(AwsMSNB::NoSubscriptions)    
    topic = AwsSnsTopic.new('arn:aws:sns:us-east-1:123456789012:does-not-matter')
    assert topic.exists?
  end
end

#=============================================================================#
#                                Properties
#=============================================================================#

class AwsSnsTopicPropertiesTest < Minitest::Test
  # No setup here - each test needs to explicitly declare
  # what they want from the backend.

  #---------------------------------------
  #       confirmed_subscription_count
  #---------------------------------------
  def test_prop_conf_sub_count_zero
    AwsSnsTopic::BackendFactory.select(AwsMSNB::NoSubscriptions)
    topic = AwsSnsTopic.new('arn:aws:sns:us-east-1:123456789012:does-not-matter')
    assert_equal(0, topic.confirmed_subscription_count)
  end

  def test_prop_conf_sub_count_one
    AwsSnsTopic::BackendFactory.select(AwsMSNB::OneSubscription)
    topic = AwsSnsTopic.new('arn:aws:sns:us-east-1:123456789012:does-not-matter')
    assert_equal(1, topic.confirmed_subscription_count)
  end
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#

module AwsMSNB

  class Miss < AwsBackendBase
    def get_topic_attributes(criteria)
      raise Aws::SNS::Errors::NotFound.new("No SNS topic for #{criteria[:topic_arn]}", 'Nope')
    end
  end

  class NoSubscriptions < AwsBackendBase
    def get_topic_attributes(_criteria)
      OpenStruct.new({
        attributes: { # Note that this is a plain hash, odd for AWS SDK
          # Many other attributes available, see 
          # http://docs.aws.amazon.com/sdkforruby/api/Aws/SNS/Types/GetTopicAttributesResponse.html
          "SubscriptionsConfirmed" => 0
        }
      })
    end
  end

  class OneSubscription < AwsBackendBase
    def get_topic_attributes(_criteria)
      OpenStruct.new({
        attributes: { # Note that this is a plain hash, odd for AWS SDK
          # Many other attributes available, see 
          # http://docs.aws.amazon.com/sdkforruby/api/Aws/SNS/Types/GetTopicAttributesResponse.html
          "SubscriptionsConfirmed" => 1
        }
      })
    end
  end
end
