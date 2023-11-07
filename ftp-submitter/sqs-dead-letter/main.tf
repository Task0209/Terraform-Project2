resource "aws_sqs_queue" "impex-booking-request-sqs-dead-letter" {
  name                        = "${var.dead_queue_name}"
  message_retention_seconds   = var.retention_period
  visibility_timeout_seconds  = var.visibility_timeout
}



