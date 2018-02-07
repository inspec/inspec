# author: Chris Redekop
require 'helper'

class AwsIamAccessKeyTest < Minitest::Test
  Username = 'test'.freeze
  Id = 'id'.freeze
  Date = 'date'.freeze

  module AccessKeyFactory
    def aws_iam_access_key(decorator = mock_decorator(stub_access_key))
      AwsIamAccessKey.new({ username: Username, id: Id }, decorator)
    end

    def stub_access_key(
      id: Id,
      status: 'Active',
      create_date: Date
    )
      OpenStruct.new(
        {
          nil?: nil,
          access_key_id: id,
          status: status,
          create_date: create_date,
        },
      )
    end
  end

  include AccessKeyFactory

  def test_initialize_accepts_fields
    assert_equal(
      Id,
      AwsIamAccessKey.new({ id: Id, username: Username }, nil)
        .instance_variable_get('@id'),
    )
  end

  def test_initialize_accepts_access_key
    assert_equal(
      Id,
      AwsIamAccessKey.new(
        {
          access_key: OpenStruct.new(access_key_id: Id),
        }, nil
      ).instance_variable_get('@id'),
    )
  end

  def test_initialize_prefers_access_key
    assert_equal(
      Id,
      AwsIamAccessKey.new(
        {
          id: 'foo',
          access_key: OpenStruct.new(access_key_id: Id),
        }, nil
      ).instance_variable_get('@id'),
    )
  end

  def test_exists_returns_true_when_access_key_exists
    assert aws_iam_access_key.exists?
  end

  def test_exists_returns_false_when_sdk_raises
    mock_decorator = mock_decorator_raise(
      Aws::IAM::Errors::NoSuchEntity.new(nil, nil),
    )

    refute aws_iam_access_key(mock_decorator).exists?

    mock_decorator.verify
  end

  def test_exists_returns_false_when_access_key_does_not_exist
    mock_decorator = mock_decorator_raise(
      AwsIamAccessKey::AccessKeyNotFoundError.new,
    )

    refute aws_iam_access_key(mock_decorator).exists?

    mock_decorator.verify
  end

  def test_id_returns_id_when_access_key_exists
    assert_equal Id, aws_iam_access_key.id
  end

  def test_active_returns_true_when_access_key_is_active
    assert aws_iam_access_key.active?
  end

  def test_active_returns_false_when_access_key_is_not_active
    refute aws_iam_access_key(mock_decorator(stub_access_key(status: 'Foo')))
      .active?
  end

  def test_create_date_returns_create_date_always
    assert_equal Date, aws_iam_access_key.create_date
  end

  def test_last_used_date_returns_last_used_date_always
    assert_equal(
      Date,
      aws_iam_access_key(
        mock_decorator(
          nil,
          OpenStruct.new({ last_used_date: Date }),
        ),
      ).last_used_date,
    )
  end

  class IamClientDecoratorTest < Minitest::Test
    include AccessKeyFactory

    def test_get_access_key_raises_when_no_access_keys_found
      validator = mock_validator

      e = assert_raises AwsIamAccessKey::AccessKeyNotFoundError do
        iam_client_decorator(validator).get_access_key(Username, Id)
      end

      assert_match(/.*access key not found.*/, e.message)
      assert_match(/.*#{Username}.*/, e.message)
      assert_match(/.*#{Id}.*/, e.message)

      validator.verify
    end

    def test_get_access_key_raises_when_matching_access_key_not_found
      validator = mock_validator

      e = assert_raises AwsIamAccessKey::AccessKeyNotFoundError do
        iam_client_decorator(
          validator,
          [stub_access_key(id: 'Foo')],
        ).get_access_key(Username, Id)
      end

      assert_match(/.*access key not found.*/, e.message)
      assert_match(/.*#{Username}.*/, e.message)
      assert_match(/.*#{Id}.*/, e.message)

      validator.verify
    end

    def test_get_access_key_returns_access_key_when_access_key_found
      access_key = stub_access_key
      validator = mock_validator

      assert_equal(
        access_key,
        iam_client_decorator(
          validator,
          [access_key],
        ).get_access_key(Username, Id),
      )

      validator.verify
    end

    def test_get_access_key_last_used_returns_last_used_when_last_used_found
      access_key_last_used = Object.new
      validator = mock_validator(false)

      assert_equal(
        access_key_last_used,
        iam_client_decorator(
          validator,
          nil,
          access_key_last_used,
        ).get_access_key_last_used(Id),
      )

      validator.verify
    end

    class ArgumentValidatorTest < Minitest::Test
      def test_validate_id_raises_when_id_is_nil
        argument_validator.validate_id(nil)
        flunk
      rescue ArgumentError => e
        assert_match(/.*missing.*"id".*/, e.message)
      end

      def test_validate_id_does_nothing_when_id_is_not_nil
        argument_validator.validate_id(Id)
      end

      def test_validate_username_raises_when_username_is_nil
        argument_validator.validate_username(nil)
        flunk
      rescue ArgumentError => e
        assert_match(/.*missing.*"username".*/, e.message)
      end

      def test_validate_username_does_nothing_when_username_is_not_nil
        argument_validator.validate_username(Username)
      end

      def argument_validator
        AwsIamAccessKey::IamClientDecorator::ArgumentValidator.new
      end
    end

    def mock_validator(validate_username = true)
      mock_validator = Minitest::Mock.new.expect :validate_id, nil, [Id]

      if validate_username
        mock_validator.expect :validate_username, nil, [Username]
      end

      mock_validator
    end

    def mock_conn(access_keys, access_key_last_used = nil)
      Minitest::Mock.new.expect(
        :iam_client,
        mock_client(access_keys, access_key_last_used),
      )
    end

    def mock_client(access_keys, access_key_last_used)
      mock_iam_client = Minitest::Mock.new

      if access_keys
        mock_iam_client.expect(
          :list_access_keys,
          OpenStruct.new({ 'access_key_metadata' => access_keys }),
          [{ user_name: Username }],
        )
      end

      if access_key_last_used
        mock_iam_client.expect(
          :get_access_key_last_used,
          OpenStruct.new({ 'access_key_last_used' => access_key_last_used }),
          [{ access_key_id: Id }],
        )
      end

      mock_iam_client
    end

    def iam_client_decorator(
      validator,
      access_keys = [],
      access_key_last_used = nil
    )
      AwsIamAccessKey::IamClientDecorator.new(
        validator, mock_conn(access_keys, access_key_last_used)
      )
    end
  end

  def mock_decorator(access_key, access_key_last_used = nil)
    mock_decorator = Minitest::Mock.new

    if access_key
      mock_decorator.expect :get_access_key, access_key, [Username, Id]
    end

    if access_key_last_used
      mock_decorator.expect(
        :get_access_key_last_used,
        access_key_last_used,
        [Id],
      )
    end

    mock_decorator
  end

  def mock_decorator_raise(error)
    Minitest::Mock.new.expect(:get_access_key, nil) do |username, id|
      assert_equal Username, username
      assert_equal Id, id

      raise error
    end
  end
end
