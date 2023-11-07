output "log-name1" {
  description = "Function name for Lambda"
  value       = module.cloudwatchlogs.log-name1
}

output "log-name2" {
  description = "Function name for Lambda"
  value       = module.cloudwatchlogs.log-name2
}

output api-name {
  value = module.api.api-name
  description = "Api name of the Lambda Function"
}

output "lambda1-arn" {
  description = "ARN for Lambda"
  value       = module.lambda1.lambda1-arn
}

output s3bucket-arn {
  description = "ARN of s3 buckets"
  value = module.s3.s3bucket-arn
}

output "arn-lambda2" {
  description = "ARN for Lambda"
  value       = module.lambda2.arn-lambda2
}

output "arn-lambda1" {
  description = "ARN for Lambda"
  value       = module.lambda1.arn-lambda1
}