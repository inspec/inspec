#===========================================================================#
#                                 SQS QUeue
#===========================================================================#

# Test fixture: 
# sqs_queue_1 is a non-fifo queue
# sqs_queue_2 is a fifo queue



resource "aws_sqs_queue" "sqs_queue_1" {
  name                      = "sqs_queue_1"
  delay_seconds             = 0
  max_message_size          = 262144 # 256 KB
  message_retention_seconds = 345600 # 4 days
  receive_wait_time_seconds = 2
  visibility_timeout_seconds = 300 # 5 minutes
}

output "sqs_queue_1_url" {
  value = "${aws_sqs_queue.sqs_queue_1.id}"
}


resource "aws_sqs_queue" "sqs_queue_2" {
  name                         = "sqs_queue_2.fifo"
  fifo_queue                   = true
  content_based_deduplication  = true  
}

output "sqs_queue_2_url" {
  value = "${aws_sqs_queue.sqs_queue_2.id}"
}
