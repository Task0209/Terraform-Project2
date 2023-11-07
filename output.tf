
output "impex-booking-request-kmskey-id" {
  description = "The globally unique identifier for the Impex key"
  value       = module.kms-key.impex-booking-request-kmskey-id
}

output "sqs_dead_arn" {
  description = "ARN of SQS dead Queue"
  value = module.ftp-submitter-sqs-dead-letter.sqs_dead_arn
}


output "lambda-arn" {
  description = "ARN for Lambda"
  value       = module.submission-service-lambda.lambda-arn
}

output "ftp-lamda-arn" {
  description = "ARN for ftp Lambda"
  value       = module.ftp-submitter-lambda.ftp-lamda-arn
}

