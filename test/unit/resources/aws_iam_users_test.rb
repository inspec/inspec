# author: Adnan Duric
# author: Steffanie Freeman
# author: Simon Varlow
# author: Chris Redekop
require 'aws-sdk'
require 'helper'
require 'aws_iam_users'

class AwsIamUsersTest < Minitest::Test
  def setup
    @mock_user_factory = Minitest::Mock.new
  end

  def test_users_nil_user_provider_returns_empty_list
    cut = AwsIamUsers.new(nil, @mock_user_factory)

    assert_equal(cut.users, [])
  end

  def test_users_empty_list_user_provider_returns_empty_list
    cut = AwsIamUsers.new(create_mock_user_provider, @mock_user_factory)

    assert_equal(cut.users, [])
  end

  def test_users_returns_true_for_all_users_if_mfa_enabled
    cut = AwsIamUsers.new(
      create_mock_user_provider(create_mock_users([true, true])),
      @mock_user_factory,
    )

    cut.users.each do |user|
      assert user.has_mfa_enabled?
    end
  end

  [
    {
      name: 'test_where_returns_no_matching_rows',
      user_material: [false],
    }, {
      name: 'test_where_returns_some_matching_rows',
      user_material: [true, false],
    }, {
      name: 'test_where_returns_all_matching_rows',
      user_material: [true],
    }
  ].each do |test_material|
    define_method(test_material[:name]) do
      cut = AwsIamUsers.new(
        create_mock_user_provider(
          create_mock_users(test_material[:user_material]),
        ),
        @mock_user_factory,
      )

      results = cut.where(has_mfa_enabled?: true)
      expected_count = test_material[:user_material].count { |x| x }

      assert_equal expected_count > 0, results.exists?
      assert_equal expected_count, results.entries.length
    end
  end

  def create_mock_user_provider(user_list = [])
    mock_user_provider = Minitest::Mock.new

    mock_user_provider.expect :list_users, user_list
    mock_user_provider.expect :nil?, false

    mock_user_provider
  end

  def create_mock_users(has_mfa_enableds = [])
    has_mfa_enableds.map { |x| create_mock_user(x) }
  end

  def create_mock_user(has_mfa_enabled = true)
    { has_mfa_enabled?: has_mfa_enabled }
  end
end
