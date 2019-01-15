require 'helper'

# MLCB = MockLaunchConfigurationBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsLaunchConfigurationConstructorTest < Minitest::Test
  def setup
    AwsLaunchConfiguration::BackendFactory.select(AwsMLCB::Hit)
  end

  def test_constructor_some_args_required
    assert_raises(ArgumentError) { AwsLaunchConfiguration.new }
  end

  def test_constructor_accepts_scalar_name
    AwsLaunchConfiguration.new('MyLaunchConfiguration')
  end

  def test_constructor_accepts_name_as_hash
    AwsLaunchConfiguration.new(name: 'MyLaunchConfiguration')
  end
  
  def test_constructor_rejects_unrecognized_resource_params
    assert_raises(ArgumentError) { AwsLaunchConfiguration.new(beep: 'boop') }
  end

end

#=============================================================================#
#                               Search
#=============================================================================#
class AwsLaunchConfigurationTest < Minitest::Test
  
  def test_recall_no_match_is_no_exception
    AwsLaunchConfiguration::BackendFactory.select(AwsMLCB::Miss)
    lc = AwsLaunchConfiguration.new('IdontExist')
    refute lc.exists?
  end

  def test_recall_match_single_result_works
    AwsLaunchConfiguration::BackendFactory.select(AwsMLCB::Hit)
    lc = AwsLaunchConfiguration.new('IExist')
    assert lc.exists?
  end
end

#=============================================================================#
#                                Properties
#=============================================================================#

class AwsLaunchConfigurationPropertiesTest < Minitest::Test
  # No setup here - each test needs to explicitly declare
  # what they want from the backend.

  def test_properties
    AwsLaunchConfiguration::BackendFactory.select(AwsMLCB::Hit)
    lc = AwsLaunchConfiguration.new('IExist')
    assert_equal('IExist', lc.name)

    assert_equal("ami-12345", lc.image_id)
    assert_equal("t1.micro", lc.instance_type)
    assert_equal("MyIAMProfile", lc.iam_instance_profile)
    assert_equal("MyKey", lc.key_name)    
    assert lc.security_groups.include? "sg-123"
    assert lc.security_groups.include? "sg-456"
    assert lc.associate_public_ip_address
    assert lc.user_data.include? "#!/bin/bash"
    assert lc.ebs_optimized
    assert_equal("detailed", lc.instance_monitoring)
    assert_equal(0.1, lc.spot_price)
  end

  def test_no_user_data
    AwsLaunchConfiguration::BackendFactory.select(AwsMLCB::HitNoUserData)
    lc = AwsLaunchConfiguration.new('IExist')
    assert_equal('IExist', lc.name)
    refute lc.user_data
  end
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#

module AwsMLCB

  class Miss < AwsBackendBase
    def get_launch_configuration_attributes(criteria)
      OpenStruct.new({
        launch_configurations: []
      })
    end
  end

  class Hit < AwsBackendBase
    def get_launch_configuration_attributes(criteria)
      OpenStruct.new({
        'launch_configurations': [
            {
                associate_public_ip_address: true,
                ebs_optimized: true, 
                image_id: "ami-12345", 
                instance_monitoring: {
                  enabled: true, 
                }, 
                instance_type: "t1.micro", 
                iam_instance_profile: "MyIAMProfile",
                key_name: "MyKey",
                launch_configuration_name: "IExist", 
                security_groups: [
                  "sg-123",
                  "sg-456", 
                ],
                spot_price: "0.1",
                user_data: "IyEvYmluL2Jhc2g=", 
              },
        ]
      })
    end
  end

  class HitNoUserData < AwsBackendBase
    def get_launch_configuration_attributes(criteria)
      OpenStruct.new({
        'launch_configurations': [
            {
                associate_public_ip_address: true,
                ebs_optimized: true, 
                image_id: "ami-12345", 
                instance_monitoring: {
                  enabled: true, 
                }, 
                instance_type: "t1.micro", 
                iam_instance_profile: "MyIAMProfile",
                key_name: "MyKey",
                launch_configuration_name: "IExist", 
                security_groups: [
                  "sg-123",
                  "sg-456", 
                ], 
              },
        ]
      })
    end
  end
end