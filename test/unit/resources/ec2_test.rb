require 'helper'

require 'ec2'

class TestEc2 < Minitest::Test
  def setup
    @conn = Minitest::Mock.new
    @client = Minitest::Mock.new
    @resource = Minitest::Mock.new

    @conn.expect :ec2_client, @client
    @conn.expect :ec2_resource, @resource
  end

  def test_that_id_returns_directly_provided_id
    @cut = Ec2.new('i-foo', @conn)
     
    assert_equal @cut.id, 'i-foo'
  end

  # def test_that_id_returns_id_for_provided_name
    # @cut = Ec2.new({name: 'cut'}, @conn)
     # 
    # assert_equal @cut.id, 'i-foo'
  # end
end
