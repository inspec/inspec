require 'helper'

require 'resource_support/aws'
require 'resources/aws/aws_config_recorder'

# MCRSB = MockConfigRecorderSingleBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsConfigurationRecorderConstructorTest < Minitest::Test
  def setup
    AwsConfigurationRecorder::BackendFactory.select(AwsMCRSB::Basic)
  end

  def test_constructor_when_no_params_provided
    AwsConfigurationRecorder.new
  end


  def test_constructor_expected_well_formed_args_scalar
    AwsConfigurationRecorder.new('default')
  end

  def test_constructor_expected_well_formed_args_hash
    AwsConfigurationRecorder.new(recorder_name: 'default')
  end
  
  def test_constructor_reject_unknown_resource_params
    assert_raises(ArgumentError) { AwsConfigurationRecorder.new(bla: 'blabla') }
  end
end

#=============================================================================#
#                               Recall
#=============================================================================#

class AwsConfigurationRecorderRecallTest < Minitest::Test
  def setup
    AwsConfigurationRecorder::BackendFactory.select(AwsMCRSB::Basic)
  end

  def test_search_hit_by_default
    assert AwsConfigurationRecorder.new.exists?
  end

  def test_search_hit_via_scalar
    assert AwsConfigurationRecorder.new('default').exists?
  end

  def test_search_hit_via_hash
    assert AwsConfigurationRecorder.new(recorder_name: 'default').exists?
  end

  def test_search_miss_is_not_an_exception
    refute AwsConfigurationRecorder.new(recorder_name: 'NonExistentRecorder').exists?
  end
end

#=============================================================================#
#                               properties
#=============================================================================#

class AwsConfigurationRecorderPropertiesTest < Minitest::Test
  def setup
    AwsConfigurationRecorder::BackendFactory.select(AwsMCRSB::Basic)
  end

  def test_property_recorder_name
    assert_equal('default', AwsConfigurationRecorder.new(recorder_name: 'default').recorder_name)
    assert_equal('default', AwsConfigurationRecorder.new.recorder_name)
  end

  def test_property_role_arn
    assert_equal('arn:aws:iam::721741954427:role/default', AwsConfigurationRecorder.new(recorder_name: 'default').role_arn)
    assert_nil(AwsConfigurationRecorder.new(recorder_name: 'NonExistentRecorder').role_arn)
  end
  
  def test_property_resource_types
    assert_equal(['AWS::EC2::CustomerGateway', 'AWS::EC2::EIP'], AwsConfigurationRecorder.new(recorder_name: 'default').resource_types)
    assert_nil(AwsConfigurationRecorder.new(recorder_name: 'NonExistentRecorder').resource_types)
  end
end

#=============================================================================#
#                               Test Matchers
#=============================================================================#
class AwsConfigurationRecorderPropertiesTest < Minitest::Test
  def test_matcher_all_supported
    assert AwsConfigurationRecorder.new(recorder_name: 'default').recording_all_resource_types?
    refute AwsConfigurationRecorder.new(recorder_name: 'Recorder_1').recording_all_resource_types?
  end
  
  def test_matcher_has_include_global_resource_types
    assert AwsConfigurationRecorder.new(recorder_name: 'default').recording_all_global_types?
    refute AwsConfigurationRecorder.new(recorder_name: 'Recorder_1').recording_all_global_types?
  end
  
  def test_matcher_recording
    assert AwsConfigurationRecorder.new(recorder_name: 'default').recording?
    refute AwsConfigurationRecorder.new(recorder_name: 'Recorder_1').recording?
  end
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#

module AwsMCRSB
  class Basic < AwsBackendBase
    def describe_configuration_recorders(query = {})
      recorders = {
        'default' => OpenStruct.new({
          :configuration_recorders => [
            name: "default",
            role_arn: "arn:aws:iam::721741954427:role/default",
            :recording_group => OpenStruct.new({
              all_supported: true,
              include_global_resource_types: true,
              resource_types: ['AWS::EC2::CustomerGateway', 'AWS::EC2::EIP'],
            }),
          ]
        }),
      }
      if query.empty?
        return recorders['default']
      elsif recorders.key?(query[:configuration_recorder_names][0])
        return recorders[query[:configuration_recorder_names][0]]
      else
        raise Aws::ConfigService::Errors::NoSuchConfigurationRecorderException.new(nil, nil)
      end
    end
    
    def describe_configuration_recorder_status(query = {})
      recorders = {
        'default' => OpenStruct.new({
          :configuration_recorders_status => [
            recording: true,
          ]
        }),
        'Recorder_1' => OpenStruct.new({
          :configuration_recorders_status => [
            recording: false,
          ]
        }),
        'empty' => {}
      }
      return recorders[query[:configuration_recorder_names][0]] unless recorders[query[:configuration_recorder_names][0]].nil?
      raise Aws::ConfigService::Errors::NoSuchConfigurationRecorderException(nil, nil)
    end
  end
end
