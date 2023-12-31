

data "archive_file" "impex-python" {
  type        = "zip"
  source_file = "${path.module}/impex.py"
  output_path = "${path.module}/impex.zip"
}

resource "aws_lambda_function" "impex-lambda2" {
  function_name = "${var.fun2-name}"
  filename        = "${path.module}/impex.zip"
  role    = aws_iam_role.lambda_role.arn
  handler = "${var.lamda-handler}"
  runtime = "${var.run-time}"
  depends_on  = [aws_iam_role_policy_attachment.lambda2-policy1-docs,
                 aws_iam_role_policy_attachment.lambda2-policy2-docs]
  environment {
    variables = {
      sqs_arn = var.sqs_arn
      sqs_dead_arn = var.sqs_dead_arn
    }
  }
}