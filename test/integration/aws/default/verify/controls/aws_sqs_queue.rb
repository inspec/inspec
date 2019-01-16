fixtures = {}
%w{
  sqs_queue_1_url
  sqs_queue_2_url
}.each do |fixture_name|
  fixtures[fixture_name] = attribute(
  fixture_name,
  default: "default.#{fixture_name}",
  description: "See ../build/sqs.tf"
  )
end

control "aws_sqs_queue lookup" do

  sqs_queue1_url = fixtures["sqs_queue_1_url"]

  # Search miss
  sqs_queue_url_non_existent = sqs_queue1_url + "random"

  describe aws_sqs_queue(sqs_queue_url_non_existent) do
    it { should_not exist }
  end

  # Search hit
  describe aws_sqs_queue(sqs_queue1_url) do
    it { should exist }
  end
end

control "aws_sqs_queue properties" do
  describe aws_sqs_queue(fixtures["sqs_queue_1_url"]) do
    its("delay_seconds") { should be 0 }
    its("is_fifo_queue") { should be false }
    its("visibility_timeout") { should be 300 }
    its("maximum_message_size") { should be 262144 }
    its("message_retention_period") { should be 345600 }
    its("receive_message_wait_timeout_seconds") { should be 2 }
  end
end

control "aws_sqs_queue fifo properties" do
  describe aws_sqs_queue(fixtures["sqs_queue_2_url"]) do
    its("is_fifo_queue") { should be true }
    its("content_based_deduplication") { should be true }
  end
end
