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

  def test_that_id_returns_directly_provided_id
    @cut = Ec2.new(Id, @mockConn)
     
    assert_equal @cut.id, Id
  end

  def test_that_id_returns_id_for_provided_name
    @cut = Ec2.new({name: 'cut'}, @mockConn)
    mockInstance = Minitest::Mock.new

    mockInstance.expect :nil?, false
    mockInstance.expect :id, Id

    @mockResource.expect :instances, [mockInstance], [Hash]
     
    assert_equal @cut.id, Id
  end
end
