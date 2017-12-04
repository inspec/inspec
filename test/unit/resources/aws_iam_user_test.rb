# author: Simon Varlow
require 'helper'
require 'aws_iam_user'

# rubocop:disable Metrics/ClassLength
class AwsIamUserTest < Minitest::Test
  Username = 'test'.freeze

  def setup
    @mock_user_provider = Minitest::Mock.new
    @mock_dets_provider = Minitest::Mock.new
    @mock_dets_prov_ini = Minitest::Mock.new
    @mock_user = { name: Username }
  end

  def test_that_exists_returns_true_if_user_exists
    @mock_user_provider.expect :user, @mock_user, [Username]
    @mock_dets_provider.expect :exists?, true
    @mock_dets_prov_ini.expect :create, @mock_dets_provider, [@mock_user]
    assert AwsIamUser.new(
      @mock_user,
      @mock_user_provider,
      @mock_dets_prov_ini,
    ).exists?
  end

  def test_that_exists_returns_false_if_user_does_not_exist
    @mock_user_provider.expect :user, @mock_user, [Username]
    @mock_dets_provider.expect :exists?, false
    @mock_dets_prov_ini.expect :create, @mock_dets_provider, [@mock_user]
    refute AwsIamUser.new(
      @mock_user,
      @mock_user_provider,
      @mock_dets_prov_ini,
    ).exists?
  end

  def test_that_mfa_enable_returns_true_if_mfa_enabled
    @mock_user_provider.expect :user, @mock_user, [Username]
    @mock_dets_provider.expect :has_mfa_enabled?, true
    @mock_dets_prov_ini.expect :create, @mock_dets_provider, [@mock_user]
    assert AwsIamUser.new(
      @mock_user,
      @mock_user_provider,
      @mock_dets_prov_ini,
    ).has_mfa_enabled?
  end

  def test_that_mfa_enable_returns_false_if_mfa_is_not_enabled
    @mock_user_provider.expect :user, @mock_user, [Username]
    @mock_dets_provider.expect :has_mfa_enabled?, false
    @mock_dets_prov_ini.expect :create, @mock_dets_provider, [@mock_user]
    refute AwsIamUser.new(
      @mock_user,
      @mock_user_provider,
      @mock_dets_prov_ini,
    ).has_mfa_enabled?
  end

  def test_that_console_password_returns_true_if_console_password_set
    @mock_user_provider.expect :user, @mock_user, [Username]
    @mock_dets_provider.expect :has_console_password?, true
    @mock_dets_prov_ini.expect :create, @mock_dets_provider, [@mock_user]
    assert AwsIamUser.new(
      @mock_user,
      @mock_user_provider,
      @mock_dets_prov_ini,
    ).has_console_password?
  end

  def test_that_console_password_returns_false_if_console_password_not_set
    @mock_user_provider.expect :user, @mock_user, [Username]
    @mock_dets_provider.expect :has_console_password?, false
    @mock_dets_prov_ini.expect :create, @mock_dets_provider, [@mock_user]
    refute AwsIamUser.new(
      @mock_user,
      @mock_user_provider,
      @mock_dets_prov_ini,
    ).has_console_password?
  end

  def test_that_access_keys_returns_aws_iam_access_key_resources
    stub_aws_access_key = Object.new
    stub_access_key_resource = Object.new
    mock_access_key_factory = Minitest::Mock.new

    @mock_user_provider.expect :user, @mock_user, [Username]
    @mock_dets_provider.expect :access_keys, [stub_aws_access_key]
    @mock_dets_prov_ini.expect :create, @mock_dets_provider, [@mock_user]
    mock_access_key_factory.expect(
      :create_access_key,
      stub_access_key_resource,
      [stub_aws_access_key],
    )

    assert_equal(
      stub_access_key_resource,
      AwsIamUser.new(
        @mock_user,
        @mock_user_provider,
        @mock_dets_prov_ini,
        mock_access_key_factory,
      ).access_keys[0],
    )

    mock_access_key_factory.verify
  end

  def test_to_s
    test_user = { name: Username, has_mfa_enabled?: true }
    @mock_user_provider.expect :user, test_user, [Username]
    @mock_dets_provider.expect :name, Username
    @mock_dets_prov_ini.expect :create, @mock_dets_provider, [test_user]
    expected = "IAM User #{Username}"
    test = AwsIamUser.new(
      { name: Username },
      @mock_user_provider,
      @mock_dets_prov_ini,
    ).to_s
    assert_equal expected, test
  end
end
