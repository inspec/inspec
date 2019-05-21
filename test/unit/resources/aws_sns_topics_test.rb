require 'helper'

require 'resource_support/aws'
require 'resources/aws/aws_sns_topics'

# MSTB = MockSnsTopicsBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsSnsTopicsConstructor < Minitest::Test
  def setup
    AwsSnsTopics::BackendFactory.select(AwsMSTB::Basic)
  end

  def test_constructor_no_args_ok
    AwsSnsTopics.new
  end

  def test_constructor_reject_unknown_resource_params
    assert_raises(ArgumentError) { AwsSnsTopics.new(bla: 'blabla') }
  end
end

#=============================================================================#
#                            Properties
#=============================================================================#
class AwsSnsTopicsProperties < Minitest::Test
  def setup
    AwsSnsTopics::BackendFactory.select(AwsMSTB::Basic)
  end

  def test_property_topics_arns
    basic = AwsSnsTopics.new
    assert_kind_of(Array, basic.topic_arns)
    assert(basic.topic_arns.include?('arn:aws:sns:us-east-1:212312313:test-topic-01'))
    assert(basic.topic_arns.include?('arn:aws:sns:us-east-1:123123129:test-topic-02'))
    refute(basic.topic_arns.include?(nil))
  end
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module AwsMSTB
  class Basic < AwsBackendBase
    def list_topics(query = {})
      topics = OpenStruct.new({
        :topics => [
          OpenStruct.new({topic_arn: 'arn:aws:sns:us-east-1:212312313:test-topic-01'}),
          OpenStruct.new({topic_arn: 'arn:aws:sns:us-east-1:123123129:test-topic-02'})
        ]
      })
    end
  end
end
