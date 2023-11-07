
output "fun1-name" {
  description = "Function name for Lambda"
  value       = aws_lambda_function.impex-lambda1.function_name
}

output "lambda1-arn" {
  description = "ARN for Lambda"
  value       = aws_lambda_function.impex-lambda1.invoke_arn
}
