
require 'aws-sdk'
require 'helper'
require 'aws_iam_access_keys'

#==========================================================#
#                 Constructor Tests                        #
#==========================================================#

class AwsIamAccessKeysConstructorTest < Minitest::Test
  # Reset provider back to the implementation default prior
  # to each test.  Tests must explicitly select an alternate.
  def setup
    AwsIamAccessKeys::AccessKeyProvider.reset
  end

  def test_bare_constructor_does_not_explode
    AwsIamAccessKeys::AccessKeyProvider.select(AlwaysEmptyMAKP)
    AwsIamAccessKeys.new
  end
end

#==========================================================#
#                   Filtering Tests                        #
#==========================================================#

class AwsIamAccessKeysFilterTest < Minitest::Test
  # Reset provider back to the implementation default prior
  # to each test.  Tests must explicitly select an alternate.
  def setup
    AwsIamAccessKeys::AccessKeyProvider.reset
  end

  def test_filter_methods_should_exist
    AwsIamAccessKeys::AccessKeyProvider.select(AlwaysEmptyMAKP)
    resource = AwsIamAccessKeys.new
    [:where, :'exists?'].each do |meth|
      assert_respond_to(resource, meth)
    end
  end

  def test_filter_method_where_should_be_chainable
    AwsIamAccessKeys::AccessKeyProvider.select(AlwaysEmptyMAKP)
    resource = AwsIamAccessKeys.new
    assert_respond_to(resource.where, :where)
  end

  def test_filter_method_exists_should_probe_empty_when_empty
    AwsIamAccessKeys::AccessKeyProvider.select(AlwaysEmptyMAKP)
    resource = AwsIamAccessKeys.new
    refute(resource.exists?)
  end

  def test_filter_method_exists_should_probe_present_when_present
    AwsIamAccessKeys::AccessKeyProvider.select(BasicMAKP)
    resource = AwsIamAccessKeys.new
    assert(resource.exists?)
  end
end

#==========================================================#
#                Filter Criteria Tests                     #
#==========================================================#

class AwsIamAccessKeysFilterCriteriaTest < Minitest::Test
  def setup
    # Here we always want no rseults.
    AwsIamAccessKeys::AccessKeyProvider.select(AlwaysEmptyMAKP)
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
    assert_raises(RuntimeError) do
      AwsIamAccessKeys.new(nope: 'some_val')
    end
  end

  def test_criteria_when_used_in_where_with_bad_criterion
    assert_raises(RuntimeError) do
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
    AwsIamAccessKeys::AccessKeyProvider.select(BasicMAKP)
    @all_basic = AwsIamAccessKeys.new
  end

  #----------------------------------------------------------#
  #    created_date / created_days_ago / created_hours_ago   #
  #----------------------------------------------------------#
  def test_property_created_date
    assert_kind_of(DateTime, @all_basic.entries.first.created_date)

    arg_filtered = @all_basic.where(created_date: DateTime.parse('2017-10-27T17:58:00Z'))
    assert_equal(1, arg_filtered.entries.count)
    assert arg_filtered.access_key_ids.first.end_with?('BOB')

    block_filtered = @all_basic.where { created_date.friday? }
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
end
#==========================================================#
#                 Mock Support Classes                     #
#==========================================================#

# MAKP = MockAccessKeyProvider.  Abbreviation not used
# outside this file.

class AlwaysEmptyMAKP < AwsIamAccessKeys::AccessKeyProvider
  def fetch(_filter_criteria)
    []
  end
end

class BasicMAKP < AwsIamAccessKeys::AccessKeyProvider
  def fetch(_filter_criteria) # rubocop:disable Metrics/MethodLength
    [
      {
        username: 'bob',
        access_key_id: 'AKIA1234567890123BOB',
        id: 'AKIA1234567890123BOB',
        created_date: DateTime.parse('2017-10-27T17:58:00Z'),
        created_days_ago: 4,
        created_hours_ago: 102,
        status: 'Active',
        active: true,
        inactive: false,
        last_used_date: nil,
        last_used_days_ago: nil,
        last_used_hours_ago: nil,
        ever_used: false,
        never_used: true,
      },
      {
        username: 'sally',
        access_key_id: 'AKIA12345678901SALLY',
        id: 'AKIA12345678901SALLY',
        created_date: DateTime.parse('2017-10-22T17:58:00Z'),
        created_days_ago: 9,
        created_hours_ago: 222,
        status: 'Active',
        active: true,
        inactive: false,
        last_used_date: DateTime.parse('2017-10-27T17:58:00Z'),
        last_used_days_ago: 4,
        last_used_hours_ago: 102,
        ever_used: true,
        never_used: false,
      },
      {
        username: 'robin',
        access_key_id: 'AKIA12345678901ROBIN',
        id: 'AKIA12345678901ROBIN',
        created_date: DateTime.parse('2017-10-31T17:58:00Z'),
        created_days_ago: 1,
        created_hours_ago: 12,
        status: 'Inactive',
        active: false,
        inactive: true,
        last_used_date: DateTime.parse('2017-10-31T20:58:00Z'),
        last_used_days_ago: 0,
        last_used_hours_ago: 5,
        ever_used: true,
        never_used: false,
      },
    ]
  end
end
