#===========================================================================#
#                                 SNS Topic
#===========================================================================#

# Test fixture: 
# sns_topic_1 has one confirmed subscription
# sns_topic_2 has no subscriptions

resource "aws_sns_topic" "sns_test_topic_1" {
  name = "${terraform.env}-test-topic-01"
}

output "sns_topic_recall_hit_arn" {
  value = "${aws_sns_topic.sns_test_topic_1.arn}"
}

resource "aws_sqs_queue" "sqs_test_queue_1" {
  name = "${terraform.env}-test-queue-01"
}

resource "aws_sns_topic_subscription" "sqs_test_queue_01_sub" {
  topic_arn = "${aws_sns_topic.sns_test_topic_1.arn}"
  protocol  = "sqs"
  endpoint  = "${aws_sqs_queue.sqs_test_queue_1.arn}"
}

output "sns_topic_with_subscription_arn" {
  value = "${aws_sns_topic.sns_test_topic_1.arn}"
}

resource "aws_sns_topic" "sns_test_topic_2" {
  name = "${terraform.env}-test-topic-02"
}

output "sns_topic_no_subscription_arn" {
  value = "${aws_sns_topic.sns_test_topic_2.arn}"
}

resource "aws_sns_topic" "topic_for_sub_03" {
  name = "${terraform.env}-topic_for_sub_3_test"
}

resource "aws_sqs_queue" "sqs_for_sub_03" {
  name = "${terraform.env}-sqs_for_sub_03"
}

resource "aws_sns_topic_subscription" "subscription_3" {
  topic_arn = "${aws_sns_topic.topic_for_sub_03.arn}"
  protocol  = "sqs"
  endpoint  = "${aws_sqs_queue.sqs_for_sub_03.arn}"
}

output "sns_subscription_03_arn" {
  value = "${aws_sns_topic_subscription.subscription_3.arn}"
}

output "sns_topic_3_arn" {
  value = "${aws_sns_topic.topic_for_sub_03.arn}"
}

output "sqs_for_sub_03_arn" {
  value = "${aws_sqs_queue.sqs_for_sub_03.arn}"
}
