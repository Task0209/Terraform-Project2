resource "aws_sqs_queue_policy" "impex-booking-request-sqs-dead-letter-policy" {
  queue_url = aws_sqs_queue.impex-booking-request-sqs-dead-letter.id
  policy      = data.aws_iam_policy_document.impex-booking-request-sqs-dead-letter-docs.json
}


data "aws_iam_policy_document" "impex-booking-request-sqs-dead-letter-docs" {
  statement {
    sid    = "Policy for Dead queue"
    principals {
      type        = "AWS"
      identifiers = ["266842636661"]
    }
    actions = [
      "sqs:ChangeMessageVisibility",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl",
      "sqs:ReceiveMessage"
    ]
    resources = [
      aws_sqs_queue.impex-booking-request-sqs-dead-letter.arn
    ]
  }
}


