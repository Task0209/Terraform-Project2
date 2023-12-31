output "lamda_role" {
  value = aws_iam_role.lambda_role.name
}

output "lamda1_arn" {
  value = aws_iam_role.lambda_role.arn
}


output "fun1-name" {
  description = "Function name for Lambda"
  value       = aws_lambda_function.impex-lambda1.function_name
}

output "lambda1-arn" {
  description = "ARN for Lambda"
  value       = aws_lambda_function.impex-lambda1.invoke_arn
}

output "arn-lambda1" {
  description = "ARN for Lambda"
  value       = aws_lambda_function.impex-lambda1.arn
}