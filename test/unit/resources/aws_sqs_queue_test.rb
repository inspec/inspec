require 'helper'

require 'resource_support/aws'
require 'resources/aws/aws_sqs_queue'

# MSQB = MockSQsBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsSqsQueueConstructorTest < Minitest::Test
  def setup
    AwsSqsQueue::BackendFactory.select(AwsMSQB::Hit)
  end

  def test_constructor_some_args_required
    assert_raises(ArgumentError) { AwsSqsQueue.new }
  end

  def test_constructor_accepts_scalar_url
    AwsSqsQueue.new('https://sqs.ap-southeast-2.amazonaws.com/5195277125796/MyQueue')
  end

  def test_constructor_accepts_url_as_hash
    AwsSqsQueue.new(url: 'https://sqs.ap-southeast-2.amazonaws.com/5195277125796/MyQueue')
  end
  
  def test_constructor_rejects_unrecognized_resource_params
    assert_raises(ArgumentError) { AwsSqsQueue.new(beep: 'boop') }
  end
    
  def test_constructor_rejects_non_https_url
    [
      'not-even-a-url',
      'http://example.com', # http
    ].each do |example|
      assert_raises(ArgumentError) { AwsSqsQueue.new(url: example) }
    end
  end
end

#=============================================================================#
#                               Search/Recall
#=============================================================================#
class AwsSqsQueueRecallTest < Minitest::Test
  # No setup here - each test needs to explicitly declare
  # what they want from the backend.

  def test_recall_no_match_is_no_exception
    AwsSqsQueue::BackendFactory.select(AwsMSQB::Miss)
    queue = AwsSqsQueue.new('https://sqs.ap-southeast-2.amazonaws.com/12121/idontexist')
    refute queue.exists?
  end

  def test_recall_match_single_result_works
    AwsSqsQueue::BackendFactory.select(AwsMSQB::Hit)
    queue = AwsSqsQueue.new('https://sqs.ap-southeast-2.amazonaws.com/12121/iexist')
    assert queue.exists?
  end
end

#=============================================================================#
#                                Properties
#=============================================================================#

class AwsSqsQueuePropertiesTest < Minitest::Test
  # No setup here - each test needs to explicitly declare
  # what they want from the backend.

  #---------------------------------------
  #       confirmed_subscription_count
  #---------------------------------------
  def test_visibility_timeout
    AwsSqsQueue::BackendFactory.select(AwsMSQB::Hit)
    queue = AwsSqsQueue.new('https://sqs.ap-southeast-2.amazonaws.com/12121/iexist')
    assert_equal(300, queue.visibility_timeout)
  end

  def test_not_fifo_queue
    AwsSqsQueue::BackendFactory.select(AwsMSQB::Hit)
    queue = AwsSqsQueue.new('https://sqs.ap-southeast-2.amazonaws.com/12121/iexist')
    refute queue.is_fifo_queue
  end  

  def test_fifo_queue
    AwsSqsQueue::BackendFactory.select(AwsMSQB::FifoQueue)
    queue = AwsSqsQueue.new('https://sqs.ap-southeast-2.amazonaws.com/12121/iexist')
    assert queue.is_fifo_queue
    assert queue.content_based_deduplication
  end  
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#

module AwsMSQB

  class Miss < AwsBackendBase
    def get_queue_attributes(criteria)
      raise Aws::SQS::Errors::NonExistentQueue.new("No SQS queue with URL  #{criteria[:url]}", 'Nope')
    end
  end

  class Hit < AwsBackendBase
    def get_queue_attributes(_criteria)
      OpenStruct.new({
        attributes: {
          "QueueArn" => "arn:aws:sqs:ap-southeast-2:519527721296:MyQueue",
          "VisibilityTimeout" => 300
        }
      })
    end
  end 
  
  class FifoQueue < AwsBackendBase
    def get_queue_attributes(_criteria)
      OpenStruct.new({
        attributes: {
          "QueueArn" => "arn:aws:sqs:ap-southeast-2:519527721296:MyQueue.fifo",
          "VisibilityTimeout" => 300,
          "FifoQueue" => true,
          "ContentBasedDeduplication" => true
        }
      })
    end
  end  
end
