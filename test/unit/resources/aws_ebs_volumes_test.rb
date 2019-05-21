require 'helper'

require 'resource_support/aws'
require 'resources/aws/aws_ebs_volumes'

# MAEIPB = MockAwsEbsVolumesPluralBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsEbsVolumesConstructorTest < Minitest::Test

  def setup
    AwsEbsVolumes::BackendFactory.select(MAEIPB::Empty)
  end

  def test_empty_params_ok
    AwsEbsVolumes.new
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsEbsVolumes.new(shoe_size: 9) }
  end
end


#=============================================================================#
#                               Search / Recall
#=============================================================================#
class AwsEbsVolumesRecallEmptyTest < Minitest::Test

  def setup
    AwsEbsVolumes::BackendFactory.select(MAEIPB::Empty)
  end

  def test_recall_when_no_volumes_exist
    refute AwsEbsVolumes.new.exists?
  end
end

class AwsEbsVolumesRecallBasicTest < Minitest::Test

  def setup
    AwsEbsVolumes::BackendFactory.select(MAEIPB::Basic)
  end

  def test_recall_when_some_volumes_exist
    assert AwsEbsVolumes.new.exists?
  end
end

#=============================================================================#
#                            Properties
#=============================================================================#
class AwsEbsVolumesProperties < Minitest::Test
  def setup
    AwsEbsVolumes::BackendFactory.select(MAEIPB::Basic)
  end
  
  def test_property_volume_ids_when_no_volumes_exist
    AwsEbsVolumes::BackendFactory.select(MAEIPB::Empty)    
    empty = AwsEbsVolumes.new
    assert_kind_of(Array, empty.volume_ids)
    assert_empty(empty.volume_ids)
  end

  def test_property_volume_ids_when_volumes_exist
    basic = AwsEbsVolumes.new
    assert_kind_of(Array, basic.volume_ids)
    assert(basic.volume_ids.include?('vol-deadbeef'))
    assert_equal(3, basic.volume_ids.length)
    assert(basic.volume_ids.include?('vol-11112222'))
    refute(basic.volume_ids.include?(nil))
  end
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module MAEIPB
  class Empty < AwsBackendBase
    def describe_volumes(query = {})
      OpenStruct.new( volumes: [] )
    end
  end

  class Basic < AwsBackendBase
    def describe_volumes(query = {})
      Aws::EC2::Types::DescribeVolumesResult.new(
        volumes: [
          Aws::EC2::Types::Volume.new(
            attachments: [
              Aws::EC2::Types::VolumeAttachment.new(
                # Many, many other properties available here.
                # We're starting with what we support.
                volume_id: 'vol-0e8541d718e67e1be'
              ),
              Aws::EC2::Types::VolumeAttachment.new(
                volume_id: 'vol-deadbeef'
              ),
            ],
          ),
          Aws::EC2::Types::Volume.new(
            attachments: [
              Aws::EC2::Types::VolumeAttachment.new(
                volume_id: 'vol-11112222'
              ),
            ],
          ),
        ]
      )
    end
  end
end
