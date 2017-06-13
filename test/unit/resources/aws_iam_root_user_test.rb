# author: Miles Tjandrawidjaja
require 'helper'
require 'aws_iam_root_user'

class AwsIamRootUserTest < Minitest::Test
  def setup
    @mockConn = Minitest::Mock.new
    @mockClient = Minitest::Mock.new

    @mockConn.expect :iam_client, @mockClient
  end

  def test_access_key_count_returns_from_summary_account
    expectedKeys = 2
    summaryMap = OpenStruct.new(summary_map: {'AccountAccessKeysPresent' => expectedKeys})
    @mockClient.expect :get_account_summary, summaryMap

    assert_equal expectedKeys, AwsIamRootUser.new(@mockConn).access_key_count
  end
end