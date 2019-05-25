require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_ec2_instance'

require 'resource_support/aws'
require 'resources/aws/aws_ec2_instance'

class TestEc2 < Minitest::Test
  Id = 'instance-id'.freeze
  InstanceProfile = 'instance-role'.freeze
  Arn = 'arn:aws:iam::123456789012:instance-profile/instance-role'.freeze

  def setup
    @mock_conn = Minitest::Mock.new
    @mock_client = Minitest::Mock.new
    @mock_resource = Minitest::Mock.new
    @mock_iam_resource = Minitest::Mock.new

    @mock_conn.expect :ec2_client, @mock_client
    @mock_conn.expect :ec2_resource, @mock_resource
    @mock_conn.expect :iam_resource, @mock_iam_resource
  end

  def test_that_id_returns_id_directly_when_constructed_with_an_id
    assert_equal Id, AwsEc2Instance.new(Id, @mock_conn).id
  end

  def test_that_id_returns_fetched_id_when_constructed_with_a_name
    mock_instance = Minitest::Mock.new
    mock_instance.expect :nil?, false
    mock_instance.expect :id, Id
    @mock_resource.expect :instances, [mock_instance], [Hash]
    assert_equal Id, AwsEc2Instance.new({ name: 'cut' }, @mock_conn).id
  end

  def test_that_instance_returns_instance_when_instance_exists
    mock_instance = Object.new

    @mock_resource.expect :instance, mock_instance, [Id]
    assert_same(
      mock_instance,
      AwsEc2Instance.new(Id, @mock_conn).send(:instance),
    )
  end

  def test_that_instance_returns_nil_when_instance_does_not_exist
    @mock_resource.expect :instance, nil, [Id]
    assert AwsEc2Instance.new(Id, @mock_conn).send(:instance).nil?
  end

  def test_that_exists_returns_true_when_instance_exists
    mock_instance = Minitest::Mock.new
    mock_instance.expect :nil?, false
    mock_instance.expect :exists?, true
    @mock_resource.expect :instance, mock_instance, [Id]
    assert AwsEc2Instance.new(Id, @mock_conn).exists?
  end

  def test_that_exists_returns_false_when_instance_does_not_exist
    mock_instance = Minitest::Mock.new
    mock_instance.expect :nil?, false
    mock_instance.expect :exists?, false
    @mock_resource.expect :instance, mock_instance, [Id]
    assert !AwsEc2Instance.new(Id, @mock_conn).exists?
  end

  def stub_iam_instance_profile
    OpenStruct.new({ arn: Arn })
  end

  def stub_instance_profile(roles)
    OpenStruct.new({ roles: roles })
  end

  def test_that_has_roles_returns_false_when_roles_is_empty
    mock_instance = Minitest::Mock.new
    mock_instance.expect :iam_instance_profile, stub_iam_instance_profile
    @mock_resource.expect :instance, mock_instance, [Id]

    mock_roles = Minitest::Mock.new
    mock_roles.expect :empty?, true

    @mock_iam_resource.expect(
      :instance_profile,
      stub_instance_profile(mock_roles),
      [InstanceProfile],
    )

    refute AwsEc2Instance.new(Id, @mock_conn).has_roles?
  end

  def test_that_has_roles_returns_true_when_roles_is_not_empty
    mock_instance = Minitest::Mock.new
    mock_instance.expect :iam_instance_profile, stub_iam_instance_profile
    @mock_resource.expect :instance, mock_instance, [Id]

    mock_roles = Minitest::Mock.new
    mock_roles.expect :empty?, false

    @mock_iam_resource.expect(
      :instance_profile,
      stub_instance_profile(mock_roles),
      [InstanceProfile],
    )

    assert AwsEc2Instance.new(Id, @mock_conn).has_roles?
  end

  def test_that_has_roles_returns_false_when_roles_does_not_exist
    mock_instance = Minitest::Mock.new
    mock_instance.expect :iam_instance_profile, stub_iam_instance_profile
    @mock_resource.expect :instance, mock_instance, [Id]

    @mock_iam_resource.expect(
      :instance_profile,
      stub_instance_profile(nil),
      [InstanceProfile],
    )

    refute AwsEc2Instance.new(Id, @mock_conn).has_roles?
  end
end
