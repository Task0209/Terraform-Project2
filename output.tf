output "sqs_arn" {
  description = "ARN of SQS Queue"
  value = module.sqs.sqs_arn
}

output "sqs_dead_arn" {
  description = "ARN of SQS dead Queue"
  value = module.dead-sqs.sqs_dead_arn
}