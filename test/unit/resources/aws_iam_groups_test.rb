require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_iam_groups'

require 'resource_support/aws'
require 'resources/aws/aws_iam_groups'

# MAIGPB = MockAwsIamGroupsPluralBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsIamGroupsConstructorTest < Minitest::Test

  def setup
    AwsIamGroups::BackendFactory.select(MAIGPB::Empty)
  end

  def test_empty_params_ok
    AwsIamGroups.new
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsIamGroups.new(shoe_size: 9) }
  end
end


#=============================================================================#
#                               Search / Recall
#=============================================================================#
class AwsIamGroupsRecallEmptyTest < Minitest::Test

  def setup
    AwsIamGroups::BackendFactory.select(MAIGPB::Empty)
  end

  def test_search_miss_via_empty_groups
    refute AwsIamGroups.new.exist?
  end
end

class AwsIamGroupsRecallBasicTest < Minitest::Test

  def setup
    AwsIamGroups::BackendFactory.select(MAIGPB::Basic)
  end

  def test_search_hit_via_empty_query
    assert AwsIamGroups.new.exist?
  end
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module MAIGPB
  class Empty < AwsBackendBase
    def list_groups(query = {})
      OpenStruct.new({ groups: [] })
    end
  end

  class Basic < AwsBackendBase
    def list_groups(query = {})
      fixtures = [
        OpenStruct.new({
          path: '/',
          group_name: 'Administrator',
          group_id: 'AGPAQWERQWERQWERQWERQ',
          arn: 'arn:aws:iam::111111111111:group/Administrator',
          create_date: DateTime.parse('2017-12-14 05:29:57 UTC')
        }),
        OpenStruct.new({
          path: '/',
          group_name: 'AmazonEC2ReadOnlyAccess',
          group_id: 'AGPAASDFASDFASDFASDFA',
          arn: 'arn:aws:iam::111111111111:group/AmazonEC2ReadOnlyAccess',
          create_date: DateTime.parse('2017-12-15 17:37:14 UTC')
        }),
      ]

      if query[:path_prefix].nil?
        selected = fixtures
      else
        selected = fixtures.select do |group|
          group[:path].start_with? query[:path_prefix]
        end
      end

      OpenStruct.new({ groups: selected })
    end
  end

end
