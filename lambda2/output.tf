output "lamda_role" {
  value = aws_iam_role.lambda_role.name
}

output "lamda2_arn" {
  value = aws_iam_role.lambda_role.arn
}


output "fun2-name" {
  description = "Function name for Lambda"
  value       = aws_lambda_function.impex-lambda2.function_name
}

output "lambda2-arn" {
  description = "ARN for Lambda"
  value       = aws_lambda_function.impex-lambda2.invoke_arn
}

output "arn-lambda2" {
  description = "ARN for Lambda"
  value       = aws_lambda_function.impex-lambda2.arn
}
