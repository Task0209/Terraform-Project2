output s3bucket-arn {
  description = "ARN of s3 buckets"
  value = module.s3.s3bucket-arn
}

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


