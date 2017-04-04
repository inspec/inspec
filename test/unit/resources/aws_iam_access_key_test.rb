# author: Chris Redekop
require 'aws-sdk'
require 'helper'

require 'aws_iam_access_key'

class AwsIamAccessKeyTest < Minitest::Test
  Username = 'test'
  Id = 'id'
  Date = 'date'

  def setup
    @mockConn = Minitest::Mock.new
    @mockClient = Minitest::Mock.new
    @mockAccessKey = Minitest::Mock.new

    @mockConn.expect :iam_client, @mockClient
  end

  def test_that_id_returns_access_key_id_always
    mock_access_key_lookup
    @mockAccessKey.expect :access_key_id, Id

    assert_equal AwsIamAccessKey.new({username: Username, id: Id}, @mockConn).id, Id
  end

  def test_that_active_returns_true_when_access_key_status_is_active
    mock_access_key_lookup
    @mockAccessKey.expect :status, 'Active'

    assert AwsIamAccessKey.new({username: Username, id: Id}, @mockConn).active?
  end

  def test_that_active_returns_false_when_access_key_status_is_not_active
    mock_access_key_lookup
    @mockAccessKey.expect :status, 'Foo'

    assert !AwsIamAccessKey.new({username: Username, id: Id}, @mockConn).active?
  end

  def test_that_create_date_returns_access_key_last_used_date_always
    mock_access_key_lookup
    @mockAccessKey.expect :create_date, Date

    assert_equal AwsIamAccessKey.new({username: Username, id: Id}, @mockConn).create_date, Date
  end

  def test_that_create_returns_access_key_create_date_always
    mock_access_key_lookup
    @mockAccessKey.expect :access_key_id, Id
    mockAccessKeyLastUsed = Minitest::Mock.new
    mockAccessKeyLastUsed.expect :last_used_date, Date
    @mockClient.expect :get_access_key_last_used, OpenStruct.new({'access_key_last_used' => mockAccessKeyLastUsed}), [{access_key_id: Id}]

    assert_equal AwsIamAccessKey.new({username: Username, id: Id}, @mockConn).last_used_date, Date
  end

private

  def mock_access_key_lookup
    @mockClient.expect :list_access_keys, OpenStruct.new({'access_key_metadata' => [@mockAccessKey]}), [{user_name: Username}]
    @mockAccessKey.expect :access_key_id, Id
  end
end
