require 'helper'

require 'resource_support/aws'
require 'resources/aws/aws_config_delivery_channel'

# MDCSB = MockDeliveryChannelSingleBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsConfigDeliveryChannelConstructorTest < Minitest::Test
  def setup
    AwsConfigDeliveryChannel::BackendFactory.select(AwsMDCSB::Basic)
  end

  def test_constructor_when_no_params_provided
    AwsConfigDeliveryChannel.new
  end


  def test_constructor_expected_well_formed_args_scalar
    AwsConfigDeliveryChannel.new('default')
  end

  def test_constructor_expected_well_formed_args_hash
    AwsConfigDeliveryChannel.new(channel_name: 'default')
  end
  
  def test_constructor_reject_unknown_resource_params
    assert_raises(ArgumentError) { AwsConfigDeliveryChannel.new(bla: 'blabla') }
  end
end

#=============================================================================#
#                               Recall
#=============================================================================#

class AwsConfigDeliveryChannelRecallTest < Minitest::Test
  def setup
    AwsConfigDeliveryChannel::BackendFactory.select(AwsMDCSB::Basic)
  end

  def test_search_hit_by_default
    assert AwsConfigDeliveryChannel.new.exists?
  end

  def test_search_hit_via_scalar
    assert AwsConfigDeliveryChannel.new('default').exists?
  end

  def test_search_hit_via_hash
    assert AwsConfigDeliveryChannel.new(channel_name: 'default').exists?
  end

  def test_search_miss_is_not_an_exception
    refute AwsConfigDeliveryChannel.new(channel_name: 'NonExistentDeliveryChannel').exists?
  end
end

#=============================================================================#
#                               properties
#=============================================================================#

class AwsConfigDeliveryChannelPropertiesTest < Minitest::Test
  def setup
    AwsConfigDeliveryChannel::BackendFactory.select(AwsMDCSB::Basic)
  end

  def test_property_channel_name
    assert_equal('default', AwsConfigDeliveryChannel.new('default').channel_name)
    assert_equal('default', AwsConfigDeliveryChannel.new.channel_name)
    assert_equal('NonExistentDeliveryChannel',AwsConfigDeliveryChannel.new('NonExistentDeliveryChannel').channel_name)    
  end

  def test_property_delivery_frequency_in_hours
    assert_equal(3, AwsConfigDeliveryChannel.new('default').delivery_frequency_in_hours)
    assert_nil(AwsConfigDeliveryChannel.new('NonExistentDeliveryChannel').delivery_frequency_in_hours)
  end

  def test_property_s3_bucket_name
    assert_equal('my-bucket', AwsConfigDeliveryChannel.new('default').s3_bucket_name)
    assert_nil(AwsConfigDeliveryChannel.new('NonExistentDeliveryChannel').s3_bucket_name)
  end

  def test_property_s3_key_prefix
    assert_equal('config-logs/', AwsConfigDeliveryChannel.new('default').s3_key_prefix)
    assert_nil(AwsConfigDeliveryChannel.new('NonExistentDeliveryChannel').s3_key_prefix)
  end
  
  def test_property_sns_topic_arn
    assert_equal('arn:aws:sns:::my-topic-name', AwsConfigDeliveryChannel.new('default').sns_topic_arn)
    assert_nil(AwsConfigDeliveryChannel.new('NonExistentDeliveryChannel').sns_topic_arn)
  end
end

#=============================================================================#
#                               Test Matchers
#=============================================================================#

# None

#=============================================================================#
#                               Test Fixtures
#=============================================================================#

module AwsMDCSB
  class Basic < AwsBackendBase
    def describe_delivery_channels(query = {})
      fixtures = {
        'default' => Aws::ConfigService::Types::DescribeDeliveryChannelsResponse.new(
          :delivery_channels => [
            {
              name: "default",
              s3_bucket_name: 'my-bucket',
              s3_key_prefix: 'config-logs/',
              sns_topic_arn: 'arn:aws:sns:::my-topic-name',
              config_snapshot_delivery_properties: {
                 delivery_frequency: 'Three_Hours'
              },
            },
          ]
        ),
      }
      return fixtures['default'] if query.empty?
      return fixtures[query[:delivery_channel_names][0]] unless fixtures[query[:delivery_channel_names][0]].nil?
      raise Aws::ConfigService::Errors::NoSuchDeliveryChannelException.new(nil, nil)
    end
  end
end
