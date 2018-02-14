# encoding: utf-8
require 'helper'

# MCDCSB = MockConfigDeliveryChannelSingleBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsConfigurationDeliveryChannelConstructorTest < Minitest::Test
  def setup
    AwsConfigurationDeliveryChannel::BackendFactory.select(AwsMCDCSB::Basic)
  end
  
  def test_constructor_expected_well_formed_args_scalar
    AwsConfigurationDeliveryChannel.new('default')
  end

  def test_constructor_expected_well_formed_args_hash
    AwsConfigurationDeliveryChannel.new(channel_name: 'default')
  end
  
  def test_constructor_reject_no_params
    assert_raises(ArgumentError) { AwsConfigurationDeliveryChannel.new }
  end

  def test_constructor_reject_unknown_resource_params
    assert_raises(ArgumentError) { AwsConfigurationDeliveryChannel.new(bla: 'blabla') }
  end
end

#=============================================================================#
#                               Recall
#=============================================================================#

class AwsConfigurationDeliveryChannelRecallTest < Minitest::Test
  def setup
    AwsConfigurationDeliveryChannel::BackendFactory.select(AwsMCDCSB::Basic)
  end
  
  def test_search_hit_via_scalar
    assert AwsConfigurationDeliveryChannel.new('default').exists?
  end

  def test_search_hit_via_hash
    assert AwsConfigurationDeliveryChannel.new(channel_name: 'default').exists?
  end

  def test_search_miss_is_not_an_exception
    refute AwsConfigurationDeliveryChannel.new(channel_name: 'NonExistentChannel').exists?
  end
end

#=============================================================================#
#                               properties
#=============================================================================#

class AwsConfigurationDeliveryChannelPropertiesTest < Minitest::Test
  def setup
    AwsConfigurationDeliveryChannel::BackendFactory.select(AwsMCDCSB::Basic)
  end

  def test_property_channel_name
    assert_equal('default', AwsConfigurationDeliveryChannel.new(channel_name: 'default').channel_name)
  end

  def test_property_s3_bucket_name
    assert_equal('default_bucket', AwsConfigurationDeliveryChannel.new(channel_name: 'default').s3_bucket_name)
    assert_nil(AwsConfigurationDeliveryChannel.new(channel_name: 'NonExistentChannel').s3_bucket_name)
  end
  
  def test_property_s3_key_prefix
    assert_equal('docs/', AwsConfigurationDeliveryChannel.new(channel_name: 'default').s3_key_prefix)
    assert_nil(AwsConfigurationDeliveryChannel.new(channel_name: 'NonExistentChannel').s3_key_prefix)
  end
  
  def test_property_sns_topic_arn
    assert_equal('arn:aws:sns:us-east-1:721741954427:sns_topic', AwsConfigurationDeliveryChannel.new(channel_name: 'default').sns_topic_arn)
    assert_nil(AwsConfigurationDeliveryChannel.new(channel_name: 'NonExistentChannel').sns_topic_arn)
  end
  
  def test_property_delivery_frequency
    assert_equal('TwentyFour_Hours', AwsConfigurationDeliveryChannel.new(channel_name: 'default').delivery_frequency)
    assert_nil(AwsConfigurationDeliveryChannel.new(channel_name: 'NonExistentChannel').delivery_frequency)
  end
end


#=============================================================================#
#                               Test Fixtures
#=============================================================================#

module AwsMCDCSB
  class Basic < AwsBackendBase
    def describe_delivery_channels(query)
      channels = {
        'default' => OpenStruct.new({
          :delivery_channels => [
            name: "default",
            s3_bucket_name: 'default_bucket',
            s3_key_prefix: 'docs/',
            sns_topic_arn: "arn:aws:sns:us-east-1:721741954427:sns_topic",
            :config_snapshot_delivery_properties => OpenStruct.new({
              delivery_frequency: "TwentyFour_Hours",
            }),
          ]
        }),
        'empty' => {}
      }
      return channels[query[:delivery_channel_names][0]] unless channels[query[:delivery_channel_names][0]].nil?
      channels['empty']
    end
  end
end
