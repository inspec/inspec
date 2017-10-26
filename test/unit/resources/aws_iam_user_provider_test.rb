# author: Simon Varlow
# author: Jeffrey Lyons
# author: Steffanie Freeman
# author: Alex Bedley
require 'aws-sdk'
require 'helper'
require 'aws_iam_user_provider'

class AwsIamUserProviderTest < Minitest::Test
  Username = 'test'.freeze

  def setup
    @mock_iam_resource = Minitest::Mock.new
    @mock_aws_connection = Minitest::Mock.new
    @mock_aws_connection.expect :iam_resource, @mock_iam_resource
    @user_provider = AwsIam::UserProvider.new(@mock_aws_connection)
    @mock_iam_resource_user = Minitest::Mock.new
  end

  def test_user
    @mock_iam_resource_user.expect :nil?, false
    @mock_iam_resource_user.expect :name, Username
    @mock_iam_resource.expect :user, @mock_iam_resource_user, [Username]
    refute @user_provider.user(Username).nil?
  end

  def test_list_users
    mock_users =
      [
        @mock_iam_resource_user,
        @mock_iam_resource_user,
        @mock_iam_resource_user,
      ]
    mock_users.map do ||
      @mock_iam_resource_user.expect :name, Username
    end

    @mock_iam_resource.expect :users, mock_users
    assert_equal(
      @user_provider.list_users,
      [
        @mock_iam_resource_user,
        @mock_iam_resource_user,
        @mock_iam_resource_user,
      ],
    )
  end

  def test_list_users_no_users
    @mock_iam_resource.expect :users, []
    assert @user_provider.list_users == []
  end
end
