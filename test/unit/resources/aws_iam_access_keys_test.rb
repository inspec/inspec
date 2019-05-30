require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_iam_access_keys'

require 'resource_support/aws'
require 'resources/aws/aws_iam_access_keys'

#==========================================================#
#                 Constructor Tests                        #
#==========================================================#

class AwsIamAccessKeysConstructorTest < Minitest::Test
  def setup
    AwsIamAccessKeys::BackendFactory.select(AlwaysEmptyMAKP)
  end

  def test_bare_constructor_does_not_explode
    AwsIamAccessKeys.new
  end
end

#==========================================================#
#                   Filtering Tests                        #
#==========================================================#

class AwsIamAccessKeysFilterTest < Minitest::Test

  def test_filter_methods_should_exist
    AwsIamAccessKeys::BackendFactory.select(AlwaysEmptyMAKP)
    resource = AwsIamAccessKeys.new
    [:where, :'exists?'].each do |meth|
      assert_respond_to(resource, meth)
    end
  end

  def test_filter_method_where_should_be_chainable
    AwsIamAccessKeys::BackendFactory.select(AlwaysEmptyMAKP)
    resource = AwsIamAccessKeys.new
    assert_respond_to(resource.where, :where)
  end

  def test_filter_method_exists_should_probe_empty_when_empty
    AwsIamAccessKeys::BackendFactory.select(AlwaysEmptyMAKP)
    resource = AwsIamAccessKeys.new
    refute(resource.exists?)
  end

  def test_filter_method_exists_should_probe_present_when_present
    AwsIamAccessKeys::BackendFactory.select(BasicMAKP)
    resource = AwsIamAccessKeys.new
    assert(resource.exists?)
  end
end

#==========================================================#
#                Filter Criteria Tests                     #
#==========================================================#

class AwsIamAccessKeysFilterCriteriaTest < Minitest::Test
  def setup
    # Here we always want no results.
    AwsIamAccessKeys::BackendFactory.select(AlwaysEmptyMAKP)
    @valued_criteria = {
      username: 'bob',
      id: 'AKIA1234567890ABCDEF',
      access_key_id: 'AKIA1234567890ABCDEF',
    }
  end

  def test_criteria_when_used_in_constructor_with_value
    @valued_criteria.each do |criterion, value|
      AwsIamAccessKeys.new(criterion => value)
    end
  end

  def test_criteria_when_used_in_where_with_value
    @valued_criteria.each do |criterion, value|
      AwsIamAccessKeys.new.where(criterion => value)
    end
  end

  # Negative cases
  def test_criteria_when_used_in_constructor_with_bad_criterion
    assert_raises(ArgumentError) do
      AwsIamAccessKeys.new(nope: 'some_val')
    end
  end

  def test_criteria_when_used_in_where_with_bad_criterion
    assert_raises(ArgumentError) do
      AwsIamAccessKeys.new(nope: 'some_val')
    end
  end

  # Identity criterion is allowed based on regex
  def test_identity_criterion_when_used_in_constructor_positive
    AwsIamAccessKeys.new('AKIA1234567890ABCDEF')
  end

  # Permitted by FilterTable?
  def test_identity_criterion_when_used_in_where_positive
    AwsIamAccessKeys.new.where('AKIA1234567890ABCDEF')
  end

  def test_identity_criterion_when_used_in_constructor_negative
    assert_raises(RuntimeError) do
      AwsIamAccessKeys.new('NopeAKIA1234567890ABCDEF')
    end
  end

  # Permitted by FilterTable?
  # def test_identity_criterion_when_used_in_where_negative
  #    assert_raises(RuntimeError) do
  #     AwsIamAccessKeys.new.where('NopeAKIA1234567890ABCDEF')
  #   end
  # end
end

#==========================================================#
#                    Property Tests                        #
#==========================================================#
class AwsIamAccessKeysPropertiesTest < Minitest::Test
  def setup
    # Reset back to the basic kit each time.
    AwsIamAccessKeys::BackendFactory.select(BasicMAKP)
    @all_basic = AwsIamAccessKeys.new
  end

  #----------------------------------------------------------#
  #    created_date / created_days_ago / created_hours_ago   #
  #----------------------------------------------------------#
  def test_property_created_date
    assert_kind_of(DateTime, @all_basic.entries.first.create_date)

    arg_filtered = @all_basic.where(create_date: DateTime.parse('2017-10-27T17:58:00Z'))
    assert_equal(1, arg_filtered.entries.count)
    assert arg_filtered.access_key_ids.first.end_with?('BOB')

    block_filtered = @all_basic.where { create_date.friday? }
    assert_equal(1, block_filtered.entries.count)
    assert block_filtered.access_key_ids.first.end_with?('BOB')
  end

  def test_property_created_days_ago
    assert_kind_of(Integer, @all_basic.entries.first.created_days_ago)

    arg_filtered = @all_basic.where(created_days_ago: 9)
    assert_equal(1, arg_filtered.entries.count)
    assert arg_filtered.access_key_ids.first.end_with?('SALLY')

    block_filtered = @all_basic.where { created_days_ago > 2 }
    assert_equal(2, block_filtered.entries.count)
  end

  def test_property_created_hours_ago
    assert_kind_of(Integer, @all_basic.entries.first.created_hours_ago)

    arg_filtered = @all_basic.where(created_hours_ago: 222)
    assert_equal(1, arg_filtered.entries.count)
    assert arg_filtered.access_key_ids.first.end_with?('SALLY')

    block_filtered = @all_basic.where { created_hours_ago > 100 }
    assert_equal(2, block_filtered.entries.count)
  end

  #----------------------------------------------------------#
  #                     created_with_user                    #
  #----------------------------------------------------------#
  def test_property_created_with_user
    assert_kind_of(TrueClass, @all_basic.entries[0].created_with_user)
    assert_kind_of(FalseClass, @all_basic.entries[1].created_with_user)

    arg_filtered = @all_basic.where(created_with_user: true)
    assert_equal(2, arg_filtered.entries.count)
    assert arg_filtered.access_key_ids.first.end_with?('BOB')

    block_filtered = @all_basic.where { created_with_user }
    assert_equal(2, block_filtered.entries.count)
  end

  #----------------------------------------------------------#
  #                    active / inactive                     #
  #----------------------------------------------------------#
  def test_property_active
    assert_kind_of(TrueClass, @all_basic.entries.first.active)

    arg_filtered = @all_basic.where(active: true)
    assert_equal(2, arg_filtered.entries.count)

    block_filtered = @all_basic.where { active }
    assert_equal(2, block_filtered.entries.count)
    assert block_filtered.access_key_ids.first.end_with?('BOB')
  end

  def test_property_inactive
    assert_kind_of(FalseClass, @all_basic.entries.first.inactive)

    arg_filtered = @all_basic.where(inactive: true)
    assert_equal(1, arg_filtered.entries.count)

    block_filtered = @all_basic.where { inactive }
    assert_equal(1, block_filtered.entries.count)
    assert block_filtered.access_key_ids.first.end_with?('ROBIN')
  end

  #-----------------------------------------------------------#
  # last_used_date / last_used_days_ago / last_used_hours_ago #
  #-----------------------------------------------------------#
  def test_property_last_used_date
    assert_kind_of(NilClass, @all_basic.entries[0].last_used_date)
    assert_kind_of(DateTime, @all_basic.entries[1].last_used_date)

    arg_filtered = @all_basic.where(last_used_date: DateTime.parse('2017-10-27T17:58:00Z'))
    assert_equal(1, arg_filtered.entries.count)
    assert arg_filtered.access_key_ids.first.end_with?('SALLY')

    block_filtered = @all_basic.where { last_used_date and last_used_date.friday? }
    assert_equal(1, block_filtered.entries.count)
    assert block_filtered.access_key_ids.first.end_with?('SALLY')
  end

  def test_property_last_used_days_ago
    assert_kind_of(NilClass, @all_basic.entries[0].last_used_days_ago)
    assert_kind_of(Integer, @all_basic.entries[1].last_used_days_ago)

    arg_filtered = @all_basic.where(last_used_days_ago: 4)
    assert_equal(1, arg_filtered.entries.count)
    assert arg_filtered.access_key_ids.first.end_with?('SALLY')

    block_filtered = @all_basic.where { last_used_days_ago and last_used_days_ago < 2 }
    assert_equal(1, block_filtered.entries.count)
    assert block_filtered.access_key_ids.first.end_with?('ROBIN')
  end

  def test_property_last_used_hours_ago
    assert_kind_of(NilClass, @all_basic.entries[0].last_used_hours_ago)
    assert_kind_of(Integer, @all_basic.entries[1].last_used_hours_ago)

    arg_filtered = @all_basic.where(last_used_hours_ago: 102)
    assert_equal(1, arg_filtered.entries.count)
    assert arg_filtered.access_key_ids.first.end_with?('SALLY')

    block_filtered = @all_basic.where { last_used_hours_ago and last_used_hours_ago < 10 }
    assert_equal(1, block_filtered.entries.count)
    assert block_filtered.access_key_ids.first.end_with?('ROBIN')
  end

  #-----------------------------------------------------------#
  #                ever_used / never_used                     #
  #-----------------------------------------------------------#
  def test_property_ever_used
    assert_kind_of(FalseClass, @all_basic.entries[0].ever_used)
    assert_kind_of(TrueClass, @all_basic.entries[1].ever_used)

    arg_filtered = @all_basic.where(ever_used: true)
    assert_equal(2, arg_filtered.entries.count)

    block_filtered = @all_basic.where { ever_used }
    assert_equal(2, block_filtered.entries.count)
    assert block_filtered.access_key_ids.first.end_with?('SALLY')
  end

  def test_property_never_used
    assert_kind_of(TrueClass, @all_basic.entries[0].never_used)
    assert_kind_of(FalseClass, @all_basic.entries[1].never_used)

    arg_filtered = @all_basic.where(never_used: true)
    assert_equal(1, arg_filtered.entries.count)

    block_filtered = @all_basic.where { never_used }
    assert_equal(1, block_filtered.entries.count)
    assert block_filtered.access_key_ids.first.end_with?('BOB')
  end

  #----------------------------------------------------------#
  #                    user_created_date                     #
  #----------------------------------------------------------#
  def test_property_user_created_date
    assert_kind_of(DateTime, @all_basic.entries.first.user_created_date)
    arg_filtered = @all_basic.where(user_created_date: DateTime.parse('2017-10-21T17:58:00Z'))
    assert_equal(1, arg_filtered.entries.count)
    assert arg_filtered.access_key_ids.first.end_with?('SALLY')

    block_filtered = @all_basic.where { user_created_date.saturday? }
    assert_equal(1, block_filtered.entries.count)
    assert block_filtered.access_key_ids.first.end_with?('SALLY')
  end
end
#==========================================================#
#                 Mock Support Classes                     #
#==========================================================#

# MAKP = MockAccessKeyProvider.  Abbreviation not used
# outside this file.

class AlwaysEmptyMAKP < AwsBackendBase
  def fetch(_filter_criteria)
    []
  end
end

class BasicMAKP < AwsBackendBase
  def fetch(_filter_criteria)
    [
      {
        username: 'bob',
        access_key_id: 'AKIA1234567890123BOB',
        id: 'AKIA1234567890123BOB',
        create_date: DateTime.parse('2017-10-27T17:58:00Z'),
        created_days_ago: 4,
        created_hours_ago: 102,
        created_with_user: true,
        status: 'Active',
        active: true,
        inactive: false,
        last_used_date: nil,
        last_used_days_ago: nil,
        last_used_hours_ago: nil,
        ever_used: false,
        never_used: true,
        user_created_date: DateTime.parse('2017-10-27T17:58:00Z'),
      },
      {
        username: 'sally',
        access_key_id: 'AKIA12345678901SALLY',
        id: 'AKIA12345678901SALLY',
        create_date: DateTime.parse('2017-10-22T17:58:00Z'),
        created_days_ago: 9,
        created_hours_ago: 222,
        created_with_user: false,        
        status: 'Active',
        active: true,
        inactive: false,
        last_used_date: DateTime.parse('2017-10-27T17:58:00Z'),
        last_used_days_ago: 4,
        last_used_hours_ago: 102,
        ever_used: true,
        never_used: false,
        user_created_date: DateTime.parse('2017-10-21T17:58:00Z'),        
      },
      {
        username: 'robin',
        access_key_id: 'AKIA12345678901ROBIN',
        id: 'AKIA12345678901ROBIN',
        create_date: DateTime.parse('2017-10-31T17:58:00Z'),
        created_days_ago: 1,
        created_hours_ago: 12,
        created_with_user: true,        
        status: 'Inactive',
        active: false,
        inactive: true,
        last_used_date: DateTime.parse('2017-10-31T20:58:00Z'),
        last_used_days_ago: 0,
        last_used_hours_ago: 5,
        ever_used: true,
        never_used: false,
        user_created_date: DateTime.parse('2017-10-31T17:58:00Z'),  
      },
    ]
  end
end
