require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_iam_access_key'

require 'resource_support/aws'
require 'resources/aws/aws_iam_access_key'

class AwsIamAccessKeyConstructorTest < Minitest::Test
  def setup
    AwsIamAccessKey::BackendFactory.select(EmptyMAIKSB)
  end

  # Username or ID are required
  def test_username_sufficient
    AwsIamAccessKey.new(username: 'bob')
  end

  def test_access_key_id_sufficient
    AwsIamAccessKey.new(access_key_id: 'AKIA1234567890123BOB')
  end

  def test_id_is_alias_for_access_key_id
    AwsIamAccessKey.new(id: 'AKIA1234567890123BOB')
  end

  def test_access_key_id_and_username_ok
    AwsIamAccessKey.new(username: 'bob', access_key_id: 'AKIA1234567890123BOB')
  end

  def test_access_key_id_gets_validated
    assert_raises(ArgumentError) do
      AwsIamAccessKey.new(access_key_id: 'martians')
    end
  end

  def test_reject_other_params
    assert_raises(ArgumentError) do
      AwsIamAccessKey.new(shoe_size: 9)
    end
  end
end

#==========================================================#
#                    Search / Recall                       #
#==========================================================#
class AwsIamAccessKeyRecallTest < Minitest::Test
  def setup
    AwsIamAccessKey::BackendFactory.select(BasicMAIKSB)
  end

  def test_recall_access_key_id_hit
    key = AwsIamAccessKey.new(access_key_id: 'AKIA1234567890123BOB')
    assert(key.exists?)
  end

  def test_recall_access_key_id_miss
    key = AwsIamAccessKey.new(access_key_id: 'AKIA123456789012NOPE')
    refute(key.exists?)
  end

  def test_recall_username_hit
    key = AwsIamAccessKey.new(username: 'bob')
    assert(key.exists?)
  end

  # Recall miss by username
  def test_recall_username_miss
    key = AwsIamAccessKey.new(username: 'nope')
    refute(key.exists?)
  end

  # Recall multiple hit by username
  def test_recall_username_multiple
    assert_raises(RuntimeError) do
      AwsIamAccessKey.new(username: 'sally')
    end
  end
end

#==========================================================#
#                       Properties                         #
#==========================================================#
class AwsIamAccessKeyPropertiesTest < Minitest::Test
  def setup
    AwsIamAccessKey::BackendFactory.select(BasicMAIKSB)
  end

  def test_property_access_key_id
    bob = AwsIamAccessKey.new(username: 'bob')
    assert_equal('AKIA1234567890123BOB', bob.access_key_id)
    noone = AwsIamAccessKey.new(username: 'roderick')
    assert_nil(noone.access_key_id)
  end

  def test_property_username
    sally1 = AwsIamAccessKey.new(access_key_id: 'AKIA12345678901SALLY')
    assert_equal('sally', sally1.username)
    noone = AwsIamAccessKey.new(access_key_id: 'AKIA12345678901STEVE')
    assert_nil(noone.username)
  end

  def test_property_status
    sally1 = AwsIamAccessKey.new(access_key_id: 'AKIA12345678901SALLY')
    assert_equal('Active', sally1.status)
    sally2 = AwsIamAccessKey.new(access_key_id: 'AKIA12345678901SALL2')
    assert_equal('Inactive', sally2.status)
    noone = AwsIamAccessKey.new(access_key_id: 'AKIA12345678901STEVE')
    assert_nil(noone.status)
  end

  def test_property_create_date
    bob = AwsIamAccessKey.new(username: 'bob')
    assert_kind_of(DateTime, bob.create_date)
    assert_equal(DateTime.parse('2017-10-27T17:58:00Z'), bob.create_date)
    noone = AwsIamAccessKey.new(username: 'roderick')
    assert_nil(noone.create_date)
  end

  def test_property_last_used_date
    bob = AwsIamAccessKey.new(username: 'bob')
    assert_kind_of(DateTime, bob.last_used_date)
    assert_equal(DateTime.parse('2017-11-30T17:58:00Z'), bob.last_used_date)
    noone = AwsIamAccessKey.new(username: 'roderick')
    assert_nil(noone.last_used_date)
  end

end

#==========================================================#
#                         Matchers                         #
#==========================================================#
class AwsIamAccessKeyMatchersTest < Minitest::Test
  def setup
    AwsIamAccessKey::BackendFactory.select(BasicMAIKSB)
  end

  def test_matcher_be_active
    sally1 = AwsIamAccessKey.new(access_key_id: 'AKIA12345678901SALLY')
    assert(sally1.active?)
    sally2 = AwsIamAccessKey.new(access_key_id: 'AKIA12345678901SALL2')
    refute(sally2.active?)
    noone = AwsIamAccessKey.new(access_key_id: 'AKIA12345678901STEVE')
    assert_nil(noone.active?)
  end
end

#==========================================================#
#                 Mock Support Classes                     #
#==========================================================#

# MIAKSB = Mock IAM Access Key Singular Backend.  Abbreviation not used
# outside this file.

class EmptyMAIKSB < AwsBackendBase
  def list_access_keys(query)
    raise Aws::IAM::Errors::NoSuchEntity.new(nil, nil)
  end
end

class BasicMAIKSB < AwsBackendBase
  def list_access_keys(query)
    fixtures = [
      # Bob has one active key
      OpenStruct.new({
        user_name: 'bob',
        access_key_id: 'AKIA1234567890123BOB',
        create_date: DateTime.parse('2017-10-27T17:58:00Z'),
        status: 'Active',
      }),
      # Sally has one active and one inactive key
      OpenStruct.new({
        user_name: 'sally',
        access_key_id: 'AKIA12345678901SALLY',
        create_date: DateTime.parse('2017-10-22T17:58:00Z'),
        status: 'Active',
      }),
      OpenStruct.new({
        user_name: 'sally',
        access_key_id: 'AKIA12345678901SALL2',
        create_date: DateTime.parse('2017-10-22T17:58:00Z'),
        status: 'Inactive',
      }),
    ]
    matches = []
    if query.key?(:user_name)
      matches = fixtures.select { |k| k.user_name == query[:user_name] }
      if matches.empty?
        raise Aws::IAM::Errors::NoSuchEntity.new(nil,nil)
      end
    else
      matches = fixtures
    end
    OpenStruct.new({ access_key_metadata: matches })
  end

  def get_access_key_last_used(query)
    fixtures = {
      'AKIA1234567890123BOB' => OpenStruct.new({
        user_name: 'bob',
        access_key_last_used: OpenStruct.new({
          last_used_date: DateTime.parse('2017-11-30T17:58:00Z'),
        }),
      }),
      'AKIA12345678901SALLY' => OpenStruct.new({
        user_name: 'sally',
        access_key_last_used: OpenStruct.new({
          last_used_date: DateTime.parse('2017-11-25T17:58:00Z'),
        }),
      }),
    }
    fixtures[query[:access_key_id]]
  end
end
