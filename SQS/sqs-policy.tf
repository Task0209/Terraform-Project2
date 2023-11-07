resource "aws_sqs_queue_policy" "impex_sqs_policy" {
  queue_url = aws_sqs_queue.impex_sqs_queue.id
  policy      = data.aws_iam_policy_document.impex_sqs_policy.json
}

data "aws_iam_policy_document" "impex_sqs_policy" {
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
      aws_sqs_queue.impex_sqs_queue.arn
    ]
  }
}