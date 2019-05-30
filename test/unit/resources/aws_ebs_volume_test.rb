require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_ebs_volume'

require 'resource_support/aws'
require 'resources/aws/aws_ebs_volume'

class TestEbs < Minitest::Test
  Id = 'volume-id'.freeze

  def setup
    @mock_conn = Minitest::Mock.new
    @mock_client = Minitest::Mock.new
    @mock_resource = Minitest::Mock.new

    @mock_conn.expect :ec2_client, @mock_client
    @mock_conn.expect :ec2_resource, @mock_resource
  end

  def test_that_id_returns_id_directly_when_constructed_with_an_id
    assert_equal Id, AwsEbsVolume.new(Id, @mock_conn).id
  end

  def test_that_id_returns_fetched_id_when_constructed_with_a_name
    mock_volume = Minitest::Mock.new
    mock_volume.expect :nil?, false
    mock_volume.expect :id, Id
    @mock_resource.expect :volumes, [mock_volume], [Hash]
    assert_equal Id, AwsEbsVolume.new({ name: 'cut' }, @mock_conn).id
  end

  def test_that_volume_returns_volume_when_volume_exists
    mock_volume = Object.new

    @mock_resource.expect :volume, mock_volume, [Id]
    assert_same(
      mock_volume,
      AwsEbsVolume.new(Id, @mock_conn).send(:volume),
    )
  end

  def test_that_volume_returns_nil_when_volume_does_not_exist
    @mock_resource.expect :volume, nil, [Id]
    assert AwsEbsVolume.new(Id, @mock_conn).send(:volume).nil?
  end

  def test_that_exists_returns_true_when_volume_exists
    mock_volume = Minitest::Mock.new
    mock_volume.expect :nil?, false
    mock_volume.expect :exists?, true
    @mock_resource.expect :volume, mock_volume, [Id]
    assert AwsEbsVolume.new(Id, @mock_conn).exists?
  end

  def test_that_exists_returns_false_when_volume_does_not_exist
    mock_volume = Minitest::Mock.new
    mock_volume.expect :nil?, true
    mock_volume.expect :exists?, false
    @mock_resource.expect :volume, mock_volume, [Id]
    refute AwsEbsVolume.new(Id, @mock_conn).exists?
  end

  def test_that_encrypted_returns_true_when_volume_is_encrypted
    mock_volume = Minitest::Mock.new
    mock_volume.expect :nil?, false
    mock_volume.expect :encrypted, true
    @mock_resource.expect :volume, mock_volume, [Id]
    assert AwsEbsVolume.new(Id, @mock_conn).encrypted?
  end

  def test_that_encrypted_returns_false_when_volume_is_not_encrypted
    mock_volume = Minitest::Mock.new
    mock_volume.expect :nil?, false
    mock_volume.expect :encrypted, false
    @mock_resource.expect :volume, mock_volume, [Id]
    refute AwsEbsVolume.new(Id, @mock_conn).encrypted?
  end
end
