require 'helper'
require 'ec2'

class TestEc2 < Minitest::Test
  Id = 'instance-id'.freeze

  def setup
    @mock_conn = Minitest::Mock.new
    @mock_client = Minitest::Mock.new
    @mock_resource = Minitest::Mock.new

    @mock_conn.expect :ec2_client, @mock_client
    @mock_conn.expect :ec2_resource, @mock_resource
  end

  def test_that_id_returns_id_directly_when_constructed_with_an_id
    assert_equal Id, Ec2.new(Id, @mock_conn).id
  end

  def test_that_id_returns_fetched_id_when_constructed_with_a_name
    mock_instance = Minitest::Mock.new
    mock_instance.expect :nil?, false
    mock_instance.expect :id, Id
    @mock_resource.expect :instances, [mock_instance], [Hash]
    assert_equal Id, Ec2.new({ name: 'cut' }, @mock_conn).id
  end

  def test_that_instance_returns_instance_when_instance_exists
    mock_instance = Object.new

    @mock_resource.expect :instance, mock_instance, [Id]
    assert_same mock_instance, Ec2.new(Id, @mock_conn).send(:instance)
  end

  def test_that_instance_returns_nil_when_instance_does_not_exist
    @mock_resource.expect :instance, nil, [Id]
    assert Ec2.new(Id, @mock_conn).send(:instance).nil?
  end

  def test_that_exists_returns_true_when_instance_exists
    mock_instance = Minitest::Mock.new
    mock_instance.expect :exists?, true
    @mock_resource.expect :instance, mock_instance, [Id]
    assert Ec2.new(Id, @mock_conn).exists?
  end

  def test_that_exists_returns_false_when_instance_does_not_exist
    mock_instance = Minitest::Mock.new
    mock_instance.expect :exists?, false
    @mock_resource.expect :instance, mock_instance, [Id]
    assert !Ec2.new(Id, @mock_conn).exists?
  end
end
