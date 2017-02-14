require 'helper'

require 'ec2'

class TestEc2 < Minitest::Test
  Id = "instance-id"

  def setup
    @mockConn = Minitest::Mock.new
    @mockClient = Minitest::Mock.new
    @mockResource = Minitest::Mock.new

    @mockConn.expect :ec2_client, @mockClient
    @mockConn.expect :ec2_resource, @mockResource
  end

  def test_that_id_returns_id_directly_when_constructed_with_an_id
    assert_equal Id, Ec2.new(Id, @mockConn).id
  end

  def test_that_id_returns_fetched_id_when_constructed_with_a_name
    mockInstance = Minitest::Mock.new

    mockInstance.expect :nil?, false
    mockInstance.expect :id, Id

    @mockResource.expect :instances, [mockInstance], [Hash]
     
    assert_equal Id, Ec2.new({name: 'cut'}, @mockConn).id
  end

  def test_that_instance_returns_instance_when_instance_exists
    mockInstance = Object.new

    @mockResource.expect :instance, mockInstance, [Id] 

    assert_same mockInstance, Ec2.new(Id, @mockConn).send(:instance)
  end

  def test_that_instance_returns_nil_when_instance_does_not_exist
    @mockResource.expect :instance, nil, [Id] 

    assert Ec2.new(Id, @mockConn).send(:instance).nil?
  end

  def test_that_exists_returns_true_when_instance_exists
    mockInstance = Object.new

    @mockResource.expect :instance, mockInstance, [Id] 

    assert Ec2.new(Id, @mockConn).exists?
  end

  # A test similar to this one should pass once issue #13 is fixed`
  # def test_that_exists_returns_false_when_instance_does_not_exist
    # @cut = Ec2.new(Id, @mockConn)
    # mockInstance = Object.new

    # @mockResource.expect :instance, nil, [Id] 

    # assert_false @cut.exists?
  # end
end
