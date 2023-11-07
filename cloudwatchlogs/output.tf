output log-name1 {
  value = aws_cloudwatch_log_group.impex-log-lambda1.name
  description = "Log group name of the Lambda Function1"
}

output log-name2 {
  value = aws_cloudwatch_log_group.impex-log-lambda2.name
  description = "Log group name of the Lambda Function2"
}
