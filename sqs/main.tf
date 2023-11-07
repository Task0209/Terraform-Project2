
resource "aws_sqs_queue" "impex-booking-request-sqs" {
  name                       = "${var.sqs_name}"
}

resource "aws_lambda_permission" "lambda_sqs_permission" {
  statement_id  = "AllowExecutionFromLambda"
  action        = "lambda:InvokeFunction"
  function_name = "${var.fun-name}"
  principal     = "sqs.amazonaws.com"
  source_arn    = aws_sqs_queue.impex-booking-request-sqs.arn
}

