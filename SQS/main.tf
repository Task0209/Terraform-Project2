resource "aws_sqs_queue" "impex_sqs_queue" {
  name                       = var.sqs_queue_name
  delay_seconds              = var.delay_sec
  visibility_timeout_seconds = var.visibility_timeout
  max_message_size           = var.max_msg_sz
  message_retention_seconds  = var.retention_period
  receive_wait_time_seconds  = var.receive_wait_sec
}

