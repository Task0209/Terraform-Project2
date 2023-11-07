
output api-name {
  value = module.api.api-name
  description = "Api name of the Lambda Function"
}

output "lambda1-arn" {
  description = "ARN for Lambda"
  value       = module.lambda1.lambda1-arn
}
