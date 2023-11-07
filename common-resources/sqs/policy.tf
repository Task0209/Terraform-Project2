resource "aws_sqs_queue_policy" "impex-booking-request-sqspolicy" {
  queue_url = aws_sqs_queue.impex-booking-request-sqs.id
  policy      = data.aws_iam_policy_document.impex-booking-request-sqspolicy-docs.json
}

data "aws_iam_policy_document" "impex-booking-request-sqspolicy-docs" {
  statement {
    sid    = "Impex Policy for sqs queue"
    principals {
      type        = "AWS"
      identifiers = ["266842636661"]
    }
    actions = [
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl",
      "sqs:SendMessage",
      "sqs:ReceiveMessage"
    ]
    resources = [
      aws_sqs_queue.impex-booking-request-sqs.arn
    ]
  }
}